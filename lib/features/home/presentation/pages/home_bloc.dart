import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/entities/person_entity.dart';
import 'package:test_task_one/features/home/entities/sort_type.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(HomeLoadingState()) {
    on<HomeInitialEvent>(_onInitial);
    on<HomeChangeSortTypeEvent>(_onChangeSortType);
  }

  void _onChangeSortType(
      HomeChangeSortTypeEvent event, Emitter<HomeState> emit) async {
    try {
      final persons = _repository.getCachedPersons();
      print('new type: ${event.newType}');
      emit(HomeLoadedState(event.newType.sort(persons), event.newType));
    } catch (e) {
      emit(HomeFailedState(e.toString()));
    }
  }

  void _onInitial(HomeInitialEvent event, Emitter<HomeState> emit) async {
    try {
      final persons = await _repository.getPersons();
      persons.sort((a, b) => '${a.firstName} ${a.lastName}'
          .compareTo('${b.firstName} ${b.lastName}'));
      emit(HomeLoadedState(persons, SortByAlphabet()));
    } catch (e) {
      emit(HomeFailedState(e.toString()));
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
