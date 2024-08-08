import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_one/features/home/data/home_repository.dart';
import 'package:test_task_one/features/home/presentation/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
          return Scaffold(
            appBar: AppBar(
              title: const Text('app bar'),
            ),
            body: Builder(builder: (context) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeLoadedState) {
                return ListView.builder(
                    itemCount: state.users.length,
                    itemBuilder: (context, i) => ListTile(
                          title: Text(state.users[i].firstName),
                        ));
              } else {
                throw Exception('unknown home state: $state');
              }
            }),
          );
        }
      }),
    );
  }
}
