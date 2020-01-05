import 'package:bloc/bloc.dart';
import 'package:flutter_uas/api/api.dart';
import 'package:flutter_uas/model/response_category.dart';

abstract class DataState {}

class ApiRepo {
  final _apiProvider = Api();

  Future<ResponseC> fetchAll() =>
      _apiProvider.getAll();

  Future<ResponseC> fetchBisnis() =>
      _apiProvider.getBisnis();

  Future<ResponseC> fetchHiburan() =>
      _apiProvider.getHiburan();

  Future<ResponseC> fetchKesehatan() =>
      _apiProvider.getKesehatan();

  Future<ResponseC> fetchSains() =>
      _apiProvider.getSains();

  Future<ResponseC> fetchOlahraga() =>
      _apiProvider.getOlahraga();

  Future<ResponseC> fetchTechnology() =>
      _apiProvider.getTechnology();
}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final ResponseC data;

  DataSuccess(this.data);
}

class DataFailed extends DataState {
  final String errorMessage;

  DataFailed(this.errorMessage);
}

class DataEvent {
  final String category;

  DataEvent(this.category);
}

class HomeBloc extends Bloc<DataEvent, DataState> {
  @override
  DataState get initialState => DataInitial();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    yield DataLoading();
    final apirepo = ApiRepo();
    final categoryLowerCase = event.category.toLowerCase();
    switch (categoryLowerCase) {
      case 'all':
        final data = await apirepo.fetchAll();
        if (data.error == null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed('Failed to fetch data');
        }
        break;
      case 'bisnis':
        final data = await apirepo.fetchBisnis();
        if (data.error == null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      case 'hiburan':
        final data = await apirepo.fetchHiburan();
        if (data.error == null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      case 'kesehatan':
        final data = await apirepo.fetchKesehatan();
        if (data.error == null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      case 'sains':
        final data = await apirepo.fetchSains();
        if (data.error == null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      case 'olahraga':
        final data = await apirepo.fetchOlahraga();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      case 'technology':
        final data = await apirepo.fetchTechnology();
        if (data != null) {
          yield DataSuccess(data);
        } else {
          yield DataFailed(data.error);
        }
        break;
      default:
        yield DataFailed('category error');
    }
  }
}
