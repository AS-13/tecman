import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tecman/blocs/data_event.dart';
import 'package:test_tecman/models/data_model.dart';
import 'package:test_tecman/services/data_service.dart';


class DataBloc extends Bloc<DataEvent, DataState> {
  final DataService dataService;

  DataBloc(this.dataService) : super(DataInitial()) {
    on<FetchData>((event, emit) async {
      emit(DataLoading());
      try {
        final List<dynamic> rawData = await dataService.fetchData();
        final data = rawData.map((item) => DataModel.fromJson(item)).toList();
        emit(DataLoaded(data));
      } catch (e) {
        emit(DataError(e.toString()));
      }
    });
  }
}
