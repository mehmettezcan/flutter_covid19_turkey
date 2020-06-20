// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continent_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContinentDataStore on _ContinentDataStore, Store {
  Computed<bool> _$loadingContinentDataComputed;

  @override
  bool get loadingContinentData => (_$loadingContinentDataComputed ??=
          Computed<bool>(() => super.loadingContinentData))
      .value;

  final _$fetchContinentDataFutureAtom =
      Atom(name: '_ContinentDataStore.fetchContinentDataFuture');

  @override
  ObservableFuture<ContinentDataModelList> get fetchContinentDataFuture {
    _$fetchContinentDataFutureAtom.context
        .enforceReadPolicy(_$fetchContinentDataFutureAtom);
    _$fetchContinentDataFutureAtom.reportObserved();
    return super.fetchContinentDataFuture;
  }

  @override
  set fetchContinentDataFuture(ObservableFuture<ContinentDataModelList> value) {
    _$fetchContinentDataFutureAtom.context.conditionallyRunInAction(() {
      super.fetchContinentDataFuture = value;
      _$fetchContinentDataFutureAtom.reportChanged();
    }, _$fetchContinentDataFutureAtom,
        name: '${_$fetchContinentDataFutureAtom.name}_set');
  }

  final _$continentDataModelListAtom =
      Atom(name: '_ContinentDataStore.continentDataModelList');

  @override
  ContinentDataModelList get continentDataModelList {
    _$continentDataModelListAtom.context
        .enforceReadPolicy(_$continentDataModelListAtom);
    _$continentDataModelListAtom.reportObserved();
    return super.continentDataModelList;
  }

  @override
  set continentDataModelList(ContinentDataModelList value) {
    _$continentDataModelListAtom.context.conditionallyRunInAction(() {
      super.continentDataModelList = value;
      _$continentDataModelListAtom.reportChanged();
    }, _$continentDataModelListAtom,
        name: '${_$continentDataModelListAtom.name}_set');
  }

  final _$successContinentDataAtom =
      Atom(name: '_ContinentDataStore.successContinentData');

  @override
  bool get successContinentData {
    _$successContinentDataAtom.context
        .enforceReadPolicy(_$successContinentDataAtom);
    _$successContinentDataAtom.reportObserved();
    return super.successContinentData;
  }

  @override
  set successContinentData(bool value) {
    _$successContinentDataAtom.context.conditionallyRunInAction(() {
      super.successContinentData = value;
      _$successContinentDataAtom.reportChanged();
    }, _$successContinentDataAtom,
        name: '${_$successContinentDataAtom.name}_set');
  }

  final _$getContinentDataListAsyncAction = AsyncAction('getContinentDataList');

  @override
  Future<dynamic> getContinentDataList() {
    return _$getContinentDataListAsyncAction
        .run(() => super.getContinentDataList());
  }
}
