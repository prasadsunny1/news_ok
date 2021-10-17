// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$NewsApiService extends NewsApiService {
  _$NewsApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = NewsApiService;

  @override
  Future<Response<dynamic>> getEverything(String query) {
    final $url = 'https://newsapi.org/v2/everything/';
    final $params = <String, dynamic>{'q': query};
    final $headers = {
      'x-api-key': '57e671c523824417aed1c0559a572fbf',
    };

    final $request = Request('GET', $url, client.baseUrl,
        parameters: $params, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTopHeadlines() {
    final $url = 'https://newsapi.org/v2/top-headlines/';
    final $headers = {
      'x-api-key': '57e671c523824417aed1c0559a572fbf',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getHeadLineSources() {
    final $url = 'https://newsapi.org/v2/top-headlines/sources/';
    final $headers = {
      'x-api-key': '57e671c523824417aed1c0559a572fbf',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
