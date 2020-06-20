// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'covid_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CovidStore on _CovidStore, Store {
  Computed<bool> _$loadingCovidComputed;

  @override
  bool get loadingCovid =>
      (_$loadingCovidComputed ??= Computed<bool>(() => super.loadingCovid))
          .value;

  final _$fetchCovidFutureAtom = Atom(name: '_CovidStore.fetchCovidFuture');

  @override
  ObservableFuture<CovidModelList> get fetchCovidFuture {
    _$fetchCovidFutureAtom.context.enforceReadPolicy(_$fetchCovidFutureAtom);
    _$fetchCovidFutureAtom.reportObserved();
    return super.fetchCovidFuture;
  }

  @override
  set fetchCovidFuture(ObservableFuture<CovidModelList> value) {
    _$fetchCovidFutureAtom.context.conditionallyRunInAction(() {
      super.fetchCovidFuture = value;
      _$fetchCovidFutureAtom.reportChanged();
    }, _$fetchCovidFutureAtom, name: '${_$fetchCovidFutureAtom.name}_set');
  }

  final _$covidModelListAtom = Atom(name: '_CovidStore.covidModelList');

  @override
  CovidModelList get covidModelList {
    _$covidModelListAtom.context.enforceReadPolicy(_$covidModelListAtom);
    _$covidModelListAtom.reportObserved();
    return super.covidModelList;
  }

  @override
  set covidModelList(CovidModelList value) {
    _$covidModelListAtom.context.conditionallyRunInAction(() {
      super.covidModelList = value;
      _$covidModelListAtom.reportChanged();
    }, _$covidModelListAtom, name: '${_$covidModelListAtom.name}_set');
  }

  final _$successCovidAtom = Atom(name: '_CovidStore.successCovid');

  @override
  bool get successCovid {
    _$successCovidAtom.context.enforceReadPolicy(_$successCovidAtom);
    _$successCovidAtom.reportObserved();
    return super.successCovid;
  }

  @override
  set successCovid(bool value) {
    _$successCovidAtom.context.conditionallyRunInAction(() {
      super.successCovid = value;
      _$successCovidAtom.reportChanged();
    }, _$successCovidAtom, name: '${_$successCovidAtom.name}_set');
  }

  final _$getCovidListAsyncAction = AsyncAction('getCovidList');

  @override
  Future<dynamic> getCovidList() {
    return _$getCovidListAsyncAction.run(() => super.getCovidList());
  }
}
