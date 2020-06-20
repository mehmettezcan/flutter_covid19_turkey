import 'package:covid19turkey/models/covid_model.dart';

class CovidModelList {
  final List<CovidModel> covidModelList;

  CovidModelList({
    this.covidModelList,
  });

  factory CovidModelList.fromJson(List<dynamic> json) {
    List<CovidModel> covidModelList = List<CovidModel>();
    covidModelList = json
        .map((covidModelList) => CovidModel.fromJson(covidModelList))
        .toList();
    return CovidModelList(
      covidModelList: covidModelList,
    );
  }

  @override
  String toString() {
    return 'CovidModelList{roles: $covidModelList}';
  }

  getLength() {
    return covidModelList.length;
  }
}
