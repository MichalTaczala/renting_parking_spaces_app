import os

from google.cloud.sql.connector import Connector, IPTypes
from sqlalchemy.orm import Session
import pytds

import sqlalchemy
from dotenv import load_dotenv


def connect_with_connector() -> sqlalchemy.engine.base.Engine:
    """
    Initializes a connection pool for a Cloud SQL instance of SQL Server.

    Uses the Cloud SQL Python Connector package.
    """
    # Note: Saving credentials in environment variables is convenient, but not
    # secure - consider a more secure solution such as
    # Cloud Secret Manager (https://cloud.google.com/secret-manager) to help
    # keep secrets safe.
    load_dotenv()  # TODO: find a better place to load this
    instance_connection_name = os.environ[
        "INSTANCE_CONNECTION_NAME"
    ]  # e.g. 'project:region:instance'
    db_user = os.environ.get("DB_USER", "")  # e.g. 'my-db-user'
    db_pass = os.environ["DB_PASS"]  # e.g. 'my-db-password'
    db_name = os.environ["DB_NAME"]  # e.g. 'my-database'

    ip_type = IPTypes.PRIVATE if os.environ.get("PRIVATE_IP") else IPTypes.PUBLIC

    connector = Connector(ip_type)

    connect_args = {}
    # If your SQL Server instance requires SSL, you need to download the CA
    # certificate for your instance and include cafile={path to downloaded
    # certificate} and validate_host=False. This is a workaround for a known issue.
    if os.environ.get("DB_ROOT_CERT"):  # e.g. '/path/to/my/server-ca.pem'
        connect_args = {
            "cafile": os.environ["DB_ROOT_CERT"],
            "validate_host": False,
        }

    def getconn() -> pytds.Connection:
        conn = connector.connect(
            instance_connection_name,
            "pg8000",
            user=db_user,
            password=db_pass,
            db=db_name,
            **connect_args,
        )
        return conn

    pool = sqlalchemy.create_engine(
        "postgresql+pg8000://",
        creator=getconn,
        # ...
    )

    return pool


def get_session() -> sqlalchemy.orm.session.Session:
    """
    Returns a new SQLAlchemy session.
    """
    engine = connect_with_connector()
    return Session(bind=engine)


if __name__ == "__main__":
    try:
        session = get_session()
        print("success")
    except Exception as err:
        print("error", err)  # this will give what kind of error
