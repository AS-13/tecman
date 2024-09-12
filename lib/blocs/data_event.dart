
import 'package:equatable/equatable.dart';
import 'package:test_tecman/models/data_model.dart';

abstract class DataEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchData extends DataEvent {}

abstract class DataState extends Equatable {
  @override
  List<Object> get props => [];
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final List<DataModel> data;

  DataLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class DataError extends DataState {
  final String error;

  DataError(this.error);

  @override
  List<Object> get props => [error];
}