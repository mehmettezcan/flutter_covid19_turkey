import 'dart:async';

import 'package:covid19turkey/data/network/dio_client.dart';
import 'package:covid19turkey/data/network/exceptions/network_exceptions.dart';
import 'package:covid19turkey/data/network/rest_client.dart';
import 'package:covid19turkey/models/covid_model_list.dart';

class CovidApi {
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  CovidApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<CovidModelList> fetchCovid() async {
    return _restClient
        .get('https://api.collectapi.com/corona/countriesData')
        .then((dynamic res) {
      return CovidModelList.fromJson(res["result"]);
    }).catchError((error) => throw NetworkException(message: error));
  }
}
