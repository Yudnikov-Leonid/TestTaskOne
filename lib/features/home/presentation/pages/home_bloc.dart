import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/core/handle_error.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';
import 'package:test_task_one/features/home/entities/sort_type.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;
  final HandleError _handleError;

  HomeBloc(
      {required HomeRepository repository, required HandleError handleError})
      : _repository = repository,
        _handleError = handleError,
        super(HomeLoadingState()) {
    on<HomeInitialEvent>(_onInitial);
    on<HomeChangeSortTypeEvent>(_onChangeSortType);
    on<HomeRefreshEvent>(_onRefreshEvent);
  }

  void _onRefreshEvent(HomeRefreshEvent event, Emitter<HomeState> emit) async {
    if (event.showLoading) emit(HomeLoadingState());
    try {
      final persons = await _repository.getPersons();
      final sortType = SortByAlphabet();
      emit(HomeLoadedState(sortType.sort(persons), sortType));
    } catch (e) {
      emit(HomeFailedState(_handleError(e)));
    }
  }

  void _onChangeSortType(
      HomeChangeSortTypeEvent event, Emitter<HomeState> emit) async {
    try {
      final persons = _repository.getCachedPersons();
      emit(HomeLoadedState(event.newType.sort(persons), event.newType));
    } catch (e) {
      emit(HomeFailedState(_handleError(e)));
    }
  }

  void _onInitial(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      final persons = await _repository.getPersons();
      final sortType = SortByAlphabet();
      emit(HomeLoadedState(sortType.sort(persons), sortType));
    } catch (e) {
      emit(HomeFailedState(_handleError(e)));
    }
  }
}

//events
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeChangeSortTypeEvent extends HomeEvent {
  final SortType newType;
  HomeChangeSortTypeEvent(this.newType);
}

class HomeRefreshEvent extends HomeEvent {
  final bool showLoading;
  HomeRefreshEvent({required this.showLoading});
}

//states
abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedState extends HomeState {
  final List<PersonEntity> persons;
  final SortType sortType;
  HomeLoadedState(this.persons, this.sortType);
}

class HomeFailedState extends HomeState {
  final String message;
  HomeFailedState(this.message);
}
