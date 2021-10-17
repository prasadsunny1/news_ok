part of 'all_news_cubit.dart';

abstract class AllNewsState extends Equatable {
  const AllNewsState();
}

class AllNewsInitial extends AllNewsState {
  @override
  List<Object> get props => [];
}

class AllNewsLoading extends AllNewsState {
  @override
  List<Object> get props => [];
}

class AllNewsLoaded extends AllNewsState {
  const AllNewsLoaded({required this.data});

  final dynamic data;
  @override
  List<Object> get props => [];
}

class AllNewsError extends AllNewsState {
  @override
  List<Object> get props => [];
}
