import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:netforemostflutter/app/controllers/home_controller.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    final response = await HomeController().fetchArticles();
    if (kDebugMode) {
      print(response);
    }

    try {
      emit(HomeLoadedState(articles: response));
    } catch (e) {
      emit(HomeErrorState(message: 'error test'));
    }

    if (kDebugMode) {
      print("homeInitialEvent $response");
    }
  }
}
