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

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    try {
      final response = await HomeController().fetchArticles();

      if (response.isEmpty) {
        emit(HomeErrorState(message: 'No se encontraron artículos'));
      } else {
        emit(HomeLoadedState(articles: response));
      }

      if (kDebugMode) {
        print("homeInitialEvent $response");
      }
    } on Exception catch (e) {
      emit(HomeErrorState(message: 'Error al cargar artículos: $e'));
    }
  }
}
