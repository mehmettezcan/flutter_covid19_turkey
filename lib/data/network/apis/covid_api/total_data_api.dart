import 'dart:async';

import 'package:covid19turkey/data/network/dio_client.dart';
import 'package:covid19turkey/data/network/exceptions/network_exceptions.dart';
import 'package:covid19turkey/data/network/rest_client.dart';
import 'package:covid19turkey/models/total_data_model/total_data_model.dart';

class TotalDataApi {
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  TotalDataApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<TotalDataModel> getTotalData() async {
    return _restClient
        .get('https://api.collectapi.com/corona/totalData')
        .then((dynamic res) {
      return TotalDataModel.fromJson(res["result"]);
    }).catchError((error) => throw NetworkException(message: error));
  }
}
