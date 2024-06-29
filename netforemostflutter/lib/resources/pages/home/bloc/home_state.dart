part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final articles;
  HomeLoadedState({required this.articles});
}

final class HomeErrorState extends HomeState {
  final message;

  HomeErrorState({required this.message});
}
