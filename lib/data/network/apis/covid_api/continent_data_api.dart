import 'dart:async';

import 'package:covid19turkey/data/network/dio_client.dart';
import 'package:covid19turkey/data/network/exceptions/network_exceptions.dart';
import 'package:covid19turkey/data/network/rest_client.dart';
import 'package:covid19turkey/models/continent_data_model/continent_data_model_list.dart';

class ContinentDataApi {
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ContinentDataApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<ContinentDataModelList> getContinentData() async {
    return _restClient
        .get('https://api.collectapi.com/corona/continentData')
        .then((dynamic res) {
      return ContinentDataModelList.fromJson(res["result"]);
    }).catchError((error) => throw NetworkException(message: error));
  }
}
