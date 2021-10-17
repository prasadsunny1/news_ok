import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_ok/services/news_api_service.dart';
import 'package:news_ok/utils/api_key_injector.dart';
import 'package:news_ok/utils/app_constants.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final newsApiService = chopper.getService<NewsApiService>();

  Future<void> fetchSources() async {
    try {
      emit(HomeLoadingState());
      final headLineSourcesResponse = await newsApiService.getHeadLineSources();
      if (headLineSourcesResponse.isSuccessful) {
        final decodedJson = jsonDecode(headLineSourcesResponse.bodyString)
            as Map<String, dynamic>;
        emit(HomeLoadedState(data: decodedJson));
      } else {
        emit(HomeErrorState());
        emit(HomeEmptyState());
      }
    } catch (e) {
      emit(HomeErrorState());
      emit(HomeEmptyState());
    }
  }
}
