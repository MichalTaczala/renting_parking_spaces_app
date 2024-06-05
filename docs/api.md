# API

## Endpoints
### Users
- [Create a new user](#create-new-user)


## Creating a new user
**Type:** Private

```shell
METHOD /api/your_endpoint 
```

Short description here.

### Parameters
- `param1`: (required) sth
- `param2`: sth
- `param3`: (optional) sth


### Examples
#### Create new user
##### Request

```shell
curl http://localhost:11434/api/your_endpoint -d '{
    "param1": "sth",
    "param2": "sth else"
}'
```
##### Response
```json
{
    "response": "Success",
    "created_at": "2023-08-04T08:52:19.385406455-07:00",
}
```