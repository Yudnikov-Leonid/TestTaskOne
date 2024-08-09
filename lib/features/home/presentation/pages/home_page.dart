import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/core/conver_departament.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/entities/sort_type.dart';
import 'package:test_task_one/features/home/presentation/widgets/empty_list_widget.dart';
import 'package:test_task_one/features/home/presentation/widgets/search_widget.dart';
import 'package:test_task_one/features/home/presentation/pages/home_bloc.dart';
import 'package:test_task_one/features/home/presentation/widgets/person_widget.dart';
import 'package:test_task_one/features/home/presentation/widgets/sort_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  final TextEditingController _controller = TextEditingController();
  String _searchText = '';
  late HomeBloc _bloc;

  @override
  void initState() {
    _bloc = HomeBloc(repository: HomeRepository());
    _bloc.add(HomeInitialEvent());
    _controller.addListener(() {
      setState(() {
        _searchText = _controller.text;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => _bloc,
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
                title: SearchWidget(
                  controller: _controller,
                  sortType: state is HomeLoadedState
                      ? state.sortType
                      : SortByAlphabet(),
                  sortBottomSheet: SortBottomSheet(
                    bloc: _bloc,
                    index: state is HomeLoadedState ? state.sortType.index : 0,
                  ),
                ),
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
                  final searchText = _searchText.toLowerCase();
                  final searchedList = state.persons
                      .where((e) =>
                          '${e.firstName} ${e.lastName}'
                              .toLowerCase()
                              .startsWith(searchText) ||
                          e.userTag.toLowerCase().startsWith(searchText))
                      .toList();
                  return TabBarView(
                      children: <Widget>[
                            searchedList.isEmpty
                                ? const EmptyListWidget()
                                : ListView.builder(
                                    itemCount: searchedList.length,
                                    itemBuilder: (context, i) => PersonWidget(
                                          person: searchedList[i],
                                          showBirthday:
                                              state.sortType is SortByBirthday,
                                        ))
                          ] +
                          _pages.sublist(1).map((cat) {
                            final newList = searchedList
                                .where((per) =>
                                    per.department ==
                                    ConvertDepartment.categoryToDepartment(cat))
                                .toList();
                            if (newList.isEmpty) {
                              return const EmptyListWidget();
                            }
                            return ListView.builder(
                                itemCount: newList.length,
                                itemBuilder: (context, i) => PersonWidget(
                                      person: newList[i],
                                      showBirthday:
                                          state.sortType is SortByBirthday,
                                    ));
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
