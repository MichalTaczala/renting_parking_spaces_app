import 'package:http_interceptor/http_interceptor.dart';

class MainInterceptor implements InterceptorContract {
  final String firebaseUserId;
  MainInterceptor({required this.firebaseUserId});

  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    request.headers.addAll({"FirebaseId": firebaseUserId});
    return request;
  }

  @override
  Future<BaseResponse> interceptResponse(
      {required BaseResponse response}) async {
    return response;
  }

  @override
  Future<bool> shouldInterceptRequest() async {
    return true;
  }

  @override
  Future<bool> shouldInterceptResponse() async {
    return false;
  }
}
