import 'package:covid19turkey/data/repository.dart';
import 'package:covid19turkey/models/continent_data_model/continent_data_model_list.dart';
import 'package:covid19turkey/stores/error/error_store.dart';
import 'package:covid19turkey/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'continent_data_store.g.dart';

class ContinentDataStore = _ContinentDataStore with _$ContinentDataStore;

abstract class _ContinentDataStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _ContinentDataStore(Repository repository) : this._repository = repository;

  static ObservableFuture<ContinentDataModelList> emptyContinentDataResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ContinentDataModelList> fetchContinentDataFuture =
      ObservableFuture<ContinentDataModelList>(emptyContinentDataResponse);

  @observable
  ContinentDataModelList continentDataModelList;

  @observable
  bool successContinentData = false;

  @computed
  bool get loadingContinentData =>
      fetchContinentDataFuture.status == FutureStatus.pending;

  @action
  Future getContinentDataList() async {
    final future = _repository.getContinentDataList();
    fetchContinentDataFuture = ObservableFuture(future);
    await future.then((continentDataModelList) {
      this.continentDataModelList = continentDataModelList;
      successContinentData = true;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
