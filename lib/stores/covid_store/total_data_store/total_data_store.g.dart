// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TotalDataStore on _TotalDataStore, Store {
  Computed<bool> _$loadingTotalDataComputed;

  @override
  bool get loadingTotalData => (_$loadingTotalDataComputed ??=
          Computed<bool>(() => super.loadingTotalData))
      .value;

  final _$fetchTotalDataFutureAtom =
      Atom(name: '_TotalDataStore.fetchTotalDataFuture');

  @override
  ObservableFuture<TotalDataModel> get fetchTotalDataFuture {
    _$fetchTotalDataFutureAtom.context
        .enforceReadPolicy(_$fetchTotalDataFutureAtom);
    _$fetchTotalDataFutureAtom.reportObserved();
    return super.fetchTotalDataFuture;
  }

  @override
  set fetchTotalDataFuture(ObservableFuture<TotalDataModel> value) {
    _$fetchTotalDataFutureAtom.context.conditionallyRunInAction(() {
      super.fetchTotalDataFuture = value;
      _$fetchTotalDataFutureAtom.reportChanged();
    }, _$fetchTotalDataFutureAtom,
        name: '${_$fetchTotalDataFutureAtom.name}_set');
  }

  final _$totalDataModelAtom = Atom(name: '_TotalDataStore.totalDataModel');

  @override
  TotalDataModel get totalDataModel {
    _$totalDataModelAtom.context.enforceReadPolicy(_$totalDataModelAtom);
    _$totalDataModelAtom.reportObserved();
    return super.totalDataModel;
  }

  @override
  set totalDataModel(TotalDataModel value) {
    _$totalDataModelAtom.context.conditionallyRunInAction(() {
      super.totalDataModel = value;
      _$totalDataModelAtom.reportChanged();
    }, _$totalDataModelAtom, name: '${_$totalDataModelAtom.name}_set');
  }

  final _$successTotalDataAtom = Atom(name: '_TotalDataStore.successTotalData');

  @override
  bool get successTotalData {
    _$successTotalDataAtom.context.enforceReadPolicy(_$successTotalDataAtom);
    _$successTotalDataAtom.reportObserved();
    return super.successTotalData;
  }

  @override
  set successTotalData(bool value) {
    _$successTotalDataAtom.context.conditionallyRunInAction(() {
      super.successTotalData = value;
      _$successTotalDataAtom.reportChanged();
    }, _$successTotalDataAtom, name: '${_$successTotalDataAtom.name}_set');
  }

  final _$getTotalDataListAsyncAction = AsyncAction('getTotalDataList');

  @override
  Future<dynamic> getTotalDataList() {
    return _$getTotalDataListAsyncAction.run(() => super.getTotalDataList());
  }
}
