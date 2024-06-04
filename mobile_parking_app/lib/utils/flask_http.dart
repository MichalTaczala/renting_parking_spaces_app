import 'package:http/http.dart' as http;

class FlaskHttp extends http.BaseClient {
  String? userId;
  FlaskHttp({this.userId});

  void addUserId(String userId) {
    userId = userId;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (userId != null) {
      request.headers["userId"] = userId!;
    }
    return request.send();
  }
}
