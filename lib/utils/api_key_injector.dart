import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_ok/utils/app_constants.dart';

class APIKeyInjector implements RequestInterceptor, ResponseInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final apiParameters = <String, dynamic>{'apiKey': AppConstants.kAPIKEY};
    request.parameters.addAll(apiParameters);
    return request;
  }

  @override
  FutureOr<Response> onResponse(Response response) {
    return response;
  }
}
