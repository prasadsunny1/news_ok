part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  const HomeLoadedState({required this.data});

  final Map<String, dynamic> data;
  @override
  List<Object> get props => [];
}

class HomeEmptyState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  @override
  List<Object> get props => [];
}
