import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:news_ok/utils/api_endpoints.dart';

// This is necessary for the generator to work.
part 'news_api_service.chopper.dart';

final chopper = ChopperClient(
  services: [
    _$NewsApiService(),
    // Create and pass an instance of the generated service to the client
  ],
  interceptors: <dynamic>[
    // APIKeyInjector(),
    HttpLoggingInterceptor(),
  ],
);

@ChopperApi(
  baseUrl: 'https://newsapi.org',
)
abstract class NewsApiService extends ChopperService {
  // static NewsApiService create([ChopperClient? c]) => _$NewsApiService(c);
  @Get(
    path: ApiEndPoints.kGetEverything,
    headers: {'x-api-key': '57e671c523824417aed1c0559a572fbf'},
  )
  Future<Response> getEverything(
    @Query('q') String query,
  );
  @Get(
    path: ApiEndPoints.kGetTopHeadlines,
    headers: {'x-api-key': '57e671c523824417aed1c0559a572fbf'},
  )
  Future<Response> getTopHeadlines();
  @Get(
    path: ApiEndPoints.kGetHeadLineSources,
    headers: {'x-api-key': '57e671c523824417aed1c0559a572fbf'},
  )
  Future<Response> getHeadLineSources();
}
