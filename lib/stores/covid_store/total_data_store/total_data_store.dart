import 'package:covid19turkey/data/repository.dart';
import 'package:covid19turkey/models/total_data_model/total_data_model.dart';
import 'package:covid19turkey/stores/error/error_store.dart';
import 'package:covid19turkey/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'total_data_store.g.dart';

class TotalDataStore = _TotalDataStore with _$TotalDataStore;

abstract class _TotalDataStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _TotalDataStore(Repository repository) : this._repository = repository;

  static ObservableFuture<TotalDataModel> emptyTotalDataResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<TotalDataModel> fetchTotalDataFuture =
      ObservableFuture<TotalDataModel>(emptyTotalDataResponse);

  @observable
  TotalDataModel totalDataModel;

  @observable
  bool successTotalData = false;

  @computed
  bool get loadingTotalData =>
      fetchTotalDataFuture.status == FutureStatus.pending;

  @action
  Future getTotalDataList() async {
    final future = _repository.getTotalData();
    fetchTotalDataFuture = ObservableFuture(future);
    await future.then((totalDataModel) {
      this.totalDataModel = totalDataModel;
      successTotalData = true;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
