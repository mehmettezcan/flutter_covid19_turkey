import 'package:covid19turkey/data/repository.dart';
import 'package:covid19turkey/models/covid_model_list.dart';
import 'package:covid19turkey/stores/error/error_store.dart';
import 'package:covid19turkey/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'covid_store.g.dart';

class CovidStore = _CovidStore with _$CovidStore;

abstract class _CovidStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _CovidStore(Repository repository) : this._repository = repository;

  static ObservableFuture<CovidModelList> emptyCovidResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<CovidModelList> fetchCovidFuture =
      ObservableFuture<CovidModelList>(emptyCovidResponse);

  @observable
  CovidModelList covidModelList;

  @observable
  bool successCovid = false;

  @computed
  bool get loadingCovid => fetchCovidFuture.status == FutureStatus.pending;

  @action
  Future getCovidList() async {
    final future = _repository.getCovidList();
    fetchCovidFuture = ObservableFuture(future);
    await future.then((covidModelList) {
      this.covidModelList = covidModelList;
      successCovid = true;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
