import 'dart:async';

import 'package:covid19turkey/data/local/datasources/post/post_datasource.dart';
import 'package:covid19turkey/data/network/apis/covid_api/continent_data_api.dart';
import 'package:covid19turkey/data/network/apis/covid_api/corona_news_api.dart';
import 'package:covid19turkey/data/network/apis/covid_api/covid_api.dart';
import 'package:covid19turkey/data/network/apis/covid_api/total_data_api.dart';
import 'package:covid19turkey/data/sharedpref/shared_preference_helper.dart';
import 'package:covid19turkey/models/continent_data_model/continent_data_model_list.dart';
import 'package:covid19turkey/models/corona_news_model/corona_news_model_list.dart';
import 'package:covid19turkey/models/covid_model_list.dart';
import 'package:covid19turkey/models/post/post.dart';
import 'package:covid19turkey/models/post/post_list.dart';
import 'package:covid19turkey/models/total_data_model/total_data_model.dart';
import 'package:sembast/sembast.dart';

import 'local/constants/db_constants.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;
  final CovidApi _covidApi;
  final TotalDataApi _totalDataApi;
  final ContinentDataApi _continentDataApi;
  final CoronaNewsApi _coronaNewsApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(
      this._postApi,
      this._sharedPrefsHelper,
      this._postDataSource,
      this._covidApi,
      this._totalDataApi,
      this._continentDataApi,
      this._coronaNewsApi);

  // Post: ---------------------------------------------------------------------

  Future<CovidModelList> getCovidList() async {
    return await _covidApi
        .fetchCovid()
        .then((covidList) => covidList)
        .catchError((error) => throw error);
  }

  Future<TotalDataModel> getTotalData() async {
    return await _totalDataApi
        .getTotalData()
        .then((dataList) => dataList)
        .catchError((error) => throw error);
  }

  Future<ContinentDataModelList> getContinentDataList() async {
    return await _continentDataApi
        .getContinentData()
        .then((continentList) => continentList)
        .catchError((error) => throw error);
  }

  Future<CoronaNewsModelList> getCoronaNewsList() async {
    return await _coronaNewsApi
        .getCoronaNews()
        .then((newsList) => newsList)
        .catchError((error) => throw error);
  }

  Future<PostList> getPosts() async {
    // check to see if posts are present in database, then fetch from database
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postDataSource.count() > 0
        ? _postDataSource
            .getPostsFromDb()
            .then((postsList) => postsList)
            .catchError((error) => throw error)
        : _postApi.getPosts().then((postsList) {
            postsList.posts.forEach((post) {
              _postDataSource.insert(post);
            });

            return postsList;
          }).catchError((error) => throw error);
  }

  Future<List<Post>> findPostById(int id) {
    //creating filter
    List<Filter> filters = List();

    //check to see if dataLogsType is not null
    if (id != null) {
      Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
      filters.add(dataLogTypeFilter);
    }

    //making db call
    return _postDataSource
        .getAllSortedByFilter(filters: filters)
        .then((posts) => posts)
        .catchError((error) => throw error);
  }

  Future<int> insert(Post post) => _postDataSource
      .insert(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> update(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  Future<int> delete(Post post) => _postDataSource
      .update(post)
      .then((id) => id)
      .catchError((error) => throw error);

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  Future<bool> get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  Future<String> get currentLanguage => _sharedPrefsHelper.currentLanguage;
}
