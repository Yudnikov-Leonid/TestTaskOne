import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/core/conver_departament.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/presentation/home_search_widget.dart';
import 'package:test_task_one/features/home/presentation/home_bloc.dart';
import 'package:test_task_one/features/home/presentation/person_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _pages = [
    'All',
    'Designers',
    'Analytics',
    'Managers',
    'IOS',
    'Android',
    'Frontend',
    'Backend',
    'Management',
    'QA',
    'HR',
    'PR',
    'Back-office',
    'Support'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) =>
          HomeBloc(repository: HomeRepository())..add(HomeInitialEvent()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeFailedState) {
          return Scaffold(
            body: Center(
              child: Text('Error: ${state.message}'),
            ),
          );
        } else {
          return DefaultTabController(
            length: 14,
            child: Scaffold(
              appBar: AppBar(
                title: const HomeSearchWidget(),
                bottom: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: _pages
                        .map((e) => Tab(
                              text: e,
                            ))
                        .toList()),
              ),
              body: Builder(builder: (context) {
                if (state is HomeLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoadedState) {
                  return TabBarView(
                      children: <Widget>[
                            ListView.builder(
                                itemCount: state.persons.length,
                                itemBuilder: (context, i) =>
                                    PersonWidget(person: state.persons[i]))
                          ] +
                          _pages.sublist(1).map((cat) {
                            final newList = state.persons
                                    .where((per) =>
                                        per.department ==
                                        ConvertDepartment.categoryToDepartment(
                                            cat)).toList();
                            return ListView.builder(
                                itemCount: 
                                    newList.length,
                                itemBuilder: (context, i) =>
                                    PersonWidget(person: newList[i]));
                          }).toList());
                } else {
                  throw Exception('unknown home state: $state');
                }
              }),
            ),
          );
        }
      }),
    );
  }
}
