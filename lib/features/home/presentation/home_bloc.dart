import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/entities/user_entity.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(HomeLoadingState()) {
    on<HomeInitialEvent>(_onInitial);
  }

  void _onInitial(HomeInitialEvent event, Emitter<HomeState> emit) async {
    final users = await _repository.getUsers();
    emit(HomeLoadedState(users));
  }
}

//events
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

//states
abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<UserEntity> users;
  HomeLoadedState(this.users);
}

class HomeFailedState extends HomeState {
  final String message;
  HomeFailedState(this.message);
}
