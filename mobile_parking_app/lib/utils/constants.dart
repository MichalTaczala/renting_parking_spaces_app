import 'package:flutter_dotenv/flutter_dotenv.dart';

final FLASK_APP_URL = 'https://${dotenv.get("PROJECT_ID")}.uc.r.appspot.com/';
