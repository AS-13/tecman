import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tecman/blocs/data_event.dart';
import '../blocs/data_bloc.dart';
import '../services/data_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tecman экран после авторизации'),
      ),
      body: BlocProvider(
        create: (context) => DataBloc(DataService())..add(FetchData()),
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DataLoaded) {
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.data[index].title),
                  );
                },
              );
            } else if (state is DataError) {
              return Center(child: Text('Error: ${state.error}'));
            } else {
              return const Center(child: Text('No data'));
            }
          },
        ),
      ),
    );
  }
}
