import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_ok/services/news_api_service.dart';

part 'all_news_state.dart';

class AllNewsCubit extends Cubit<AllNewsState> {
  AllNewsCubit() : super(AllNewsInitial());
  final newsApiService = chopper.getService<NewsApiService>();

  Future<void> fetchAllNews({required String id}) async {
    try {
      emit(AllNewsLoading());
      final headLineSourcesResponse = await newsApiService.getEverything(id);
      if (headLineSourcesResponse.isSuccessful) {
        final decodedJson = jsonDecode(headLineSourcesResponse.bodyString)
            as Map<String, dynamic>;
        emit(AllNewsLoaded(data: decodedJson));
      } else {
        emit(AllNewsError());
      }
    } catch (e) {
      emit(AllNewsError());
    }
  }
}
