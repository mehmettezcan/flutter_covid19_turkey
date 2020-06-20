import 'package:covid19turkey/data/repository.dart';
import 'package:covid19turkey/models/corona_news_model/corona_news_model_list.dart';
import 'package:covid19turkey/stores/error/error_store.dart';
import 'package:covid19turkey/utils/dio/dio_error_util.dart';
import 'package:mobx/mobx.dart';

part 'corona_news_store.g.dart';

class CoronaNewsStore = _CoronaNewsStore with _$CoronaNewsStore;

abstract class _CoronaNewsStore with Store {
  // repository instance
  Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _CoronaNewsStore(Repository repository) : this._repository = repository;

  static ObservableFuture<CoronaNewsModelList> emptyCoronaNewsResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<CoronaNewsModelList> fetchCoronaNewsFuture =
      ObservableFuture<CoronaNewsModelList>(emptyCoronaNewsResponse);

  @observable
  CoronaNewsModelList coronaNewsModelList;

  @observable
  bool successCoronaNews = false;

  @computed
  bool get loadingCoronaNews =>
      fetchCoronaNewsFuture.status == FutureStatus.pending;

  @action
  Future getCoronaNewsList() async {
    final future = _repository.getCoronaNewsList();
    fetchCoronaNewsFuture = ObservableFuture(future);
    await future.then((coronaNewsModelList) {
      this.coronaNewsModelList = coronaNewsModelList;
      successCoronaNews = true;
    }).catchError((error) {
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }
}
