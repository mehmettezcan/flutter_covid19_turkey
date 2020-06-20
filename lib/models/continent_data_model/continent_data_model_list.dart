import 'package:covid19turkey/models/continent_data_model/continent_data_model.dart';

class ContinentDataModelList {
  final List<ContinentDataModel> continentDataModelList;

  ContinentDataModelList({
    this.continentDataModelList,
  });

  factory ContinentDataModelList.fromJson(List<dynamic> json) {
    List<ContinentDataModel> continentDataModelList =
        List<ContinentDataModel>();
    continentDataModelList = json
        .map((continentDataModelList) =>
            ContinentDataModel.fromJson(continentDataModelList))
        .toList();
    return ContinentDataModelList(
      continentDataModelList: continentDataModelList,
    );
  }

  @override
  String toString() {
    return 'ContinentDataModelList{roles: $continentDataModelList}';
  }

  getLength() {
    return continentDataModelList.length;
  }
}
