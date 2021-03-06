import 'dart:async' as _i15;

import 'package:dio/src/dio.dart' as _i5;

import '../../data/local/datasources/post/post_datasource.dart' as _i13;
import '../../data/network/apis/covid_api/continent_data_api.dart' as _i9;
import '../../data/network/apis/covid_api/corona_news_api.dart' as _i11;
import '../../data/network/apis/covid_api/covid_api.dart' as _i8;
import '../../data/network/apis/covid_api/total_data_api.dart' as _i10;
import '../../data/network/apis/posts/post_api.dart' as _i12;
import '../../data/network/dio_client.dart' as _i6;
import '../../data/network/rest_client.dart' as _i7;
import '../../data/repository.dart' as _i14;
import '../../data/sharedpref/shared_preference_helper.dart' as _i4;
import '../../main.dart' as _i17;
import '../modules/local_module.dart' as _i2;
import '../modules/netwok_module.dart' as _i16;
import '../modules/preference_module.dart' as _i3;
import 'app_component.dart' as _i1;

class AppComponent$Injector implements _i1.AppComponent {
  AppComponent$Injector._(this._localModule, this._preferenceModule);

  final _i2.LocalModule _localModule;

  final _i3.PreferenceModule _preferenceModule;

  _i4.SharedPreferenceHelper _singletonSharedPreferenceHelper;

  _i5.Dio _singletonDio;

  _i6.DioClient _singletonDioClient;

  _i7.RestClient _singletonRestClient;

  _i8.CovidApi _singletonCovidApi;

  _i9.ContinentDataApi _singletonContinentDataApi;

  _i10.TotalDataApi _singletonTotalDataApi;

  _i11.CoronaNewsApi _singletonCoronaNewsApi;

  _i12.PostApi _singletonPostApi;

  _i13.PostDataSource _singletonPostDataSource;

  _i14.Repository _singletonRepository;

  static _i15.Future<_i1.AppComponent> create(
      _i16.NetworkModule _,
      _i2.LocalModule localModule,
      _i3.PreferenceModule preferenceModule) async {
    final injector = AppComponent$Injector._(localModule, preferenceModule);

    return injector;
  }

  _i17.MyApp _createMyApp() => _i17.MyApp();

  _i14.Repository _createRepository() =>
      _singletonRepository ??= _localModule.provideRepository(
          _createCovidApi(),
          _createContinentDataApi(),
          _createTotalDataApi(),
          _createCoronaNewsApi(),
          _createPostApi(),
          _createSharedPreferenceHelper(),
          _createPostDataSource());

  _i8.CovidApi _createCovidApi() => _singletonCovidApi ??=
      _localModule.provideCovidApi(_createDioClient(), _createRestClient());

  _i6.DioClient _createDioClient() =>
      _singletonDioClient ??= _localModule.provideDioClient(_createDio());

  _i5.Dio _createDio() => _singletonDio ??=
      _localModule.provideDio(_createSharedPreferenceHelper());

  _i4.SharedPreferenceHelper _createSharedPreferenceHelper() =>
      _singletonSharedPreferenceHelper ??=
          _preferenceModule.provideSharedPreferenceHelper();

  _i7.RestClient _createRestClient() =>
      _singletonRestClient ??= _localModule.provideRestClient();

  _i9.ContinentDataApi _createContinentDataApi() =>
      _singletonContinentDataApi ??= _localModule.provideContinentDataApi(
          _createDioClient(), _createRestClient());

  _i10.TotalDataApi _createTotalDataApi() => _singletonTotalDataApi ??=
      _localModule.provideTotalDataApi(_createDioClient(), _createRestClient());

  _i11.CoronaNewsApi _createCoronaNewsApi() =>
      _singletonCoronaNewsApi ??= _localModule.provideCoronaNewsApi(
          _createDioClient(), _createRestClient());

  _i12.PostApi _createPostApi() => _singletonPostApi ??=
      _localModule.providePostApi(_createDioClient(), _createRestClient());

  _i13.PostDataSource _createPostDataSource() =>
      _singletonPostDataSource ??= _localModule.providePostDataSource();

  @override
  _i17.MyApp get app => _createMyApp();

  @override
  _i14.Repository getRepository() => _createRepository();
}
