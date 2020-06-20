// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'corona_news_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoronaNewsStore on _CoronaNewsStore, Store {
  Computed<bool> _$loadingCoronaNewsComputed;

  @override
  bool get loadingCoronaNews => (_$loadingCoronaNewsComputed ??=
          Computed<bool>(() => super.loadingCoronaNews))
      .value;

  final _$fetchCoronaNewsFutureAtom =
      Atom(name: '_CoronaNewsStore.fetchCoronaNewsFuture');

  @override
  ObservableFuture<CoronaNewsModelList> get fetchCoronaNewsFuture {
    _$fetchCoronaNewsFutureAtom.context
        .enforceReadPolicy(_$fetchCoronaNewsFutureAtom);
    _$fetchCoronaNewsFutureAtom.reportObserved();
    return super.fetchCoronaNewsFuture;
  }

  @override
  set fetchCoronaNewsFuture(ObservableFuture<CoronaNewsModelList> value) {
    _$fetchCoronaNewsFutureAtom.context.conditionallyRunInAction(() {
      super.fetchCoronaNewsFuture = value;
      _$fetchCoronaNewsFutureAtom.reportChanged();
    }, _$fetchCoronaNewsFutureAtom,
        name: '${_$fetchCoronaNewsFutureAtom.name}_set');
  }

  final _$coronaNewsModelListAtom =
      Atom(name: '_CoronaNewsStore.coronaNewsModelList');

  @override
  CoronaNewsModelList get coronaNewsModelList {
    _$coronaNewsModelListAtom.context
        .enforceReadPolicy(_$coronaNewsModelListAtom);
    _$coronaNewsModelListAtom.reportObserved();
    return super.coronaNewsModelList;
  }

  @override
  set coronaNewsModelList(CoronaNewsModelList value) {
    _$coronaNewsModelListAtom.context.conditionallyRunInAction(() {
      super.coronaNewsModelList = value;
      _$coronaNewsModelListAtom.reportChanged();
    }, _$coronaNewsModelListAtom,
        name: '${_$coronaNewsModelListAtom.name}_set');
  }

  final _$successCoronaNewsAtom =
      Atom(name: '_CoronaNewsStore.successCoronaNews');

  @override
  bool get successCoronaNews {
    _$successCoronaNewsAtom.context.enforceReadPolicy(_$successCoronaNewsAtom);
    _$successCoronaNewsAtom.reportObserved();
    return super.successCoronaNews;
  }

  @override
  set successCoronaNews(bool value) {
    _$successCoronaNewsAtom.context.conditionallyRunInAction(() {
      super.successCoronaNews = value;
      _$successCoronaNewsAtom.reportChanged();
    }, _$successCoronaNewsAtom, name: '${_$successCoronaNewsAtom.name}_set');
  }

  final _$getCoronaNewsListAsyncAction = AsyncAction('getCoronaNewsList');

  @override
  Future<dynamic> getCoronaNewsList() {
    return _$getCoronaNewsListAsyncAction.run(() => super.getCoronaNewsList());
  }
}
