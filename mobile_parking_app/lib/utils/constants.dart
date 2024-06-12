import 'package:flutter_dotenv/flutter_dotenv.dart';

// final FLASK_APP_URL = 'https://${dotenv.get("PROJECT_ID")}.uc.r.appspot.com/';
final FLASK_APP_URL = 'http://${dotenv.get("PROJECT_ID_LOCAL")}';
