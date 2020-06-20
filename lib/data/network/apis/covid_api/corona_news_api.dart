import 'dart:async';

import 'package:covid19turkey/data/network/dio_client.dart';
import 'package:covid19turkey/data/network/exceptions/network_exceptions.dart';
import 'package:covid19turkey/data/network/rest_client.dart';
import 'package:covid19turkey/models/corona_news_model/corona_news_model_list.dart';

class CoronaNewsApi {
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  CoronaNewsApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<CoronaNewsModelList> getCoronaNews() async {
    return _restClient
        .get('https://api.collectapi.com/corona/coronaNews')
        .then((dynamic res) {
      return CoronaNewsModelList.fromJson(res["result"]);
    }).catchError((error) => throw NetworkException(message: error));
  }
}
