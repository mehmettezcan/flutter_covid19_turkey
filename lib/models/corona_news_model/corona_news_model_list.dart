import 'package:covid19turkey/models/corona_news_model/corona_news_model.dart';

class CoronaNewsModelList {
  final List<CoronaNewsModel> coronaNewsModelList;

  CoronaNewsModelList({
    this.coronaNewsModelList,
  });

  factory CoronaNewsModelList.fromJson(List<dynamic> json) {
    List<CoronaNewsModel> coronaNewsModelList = List<CoronaNewsModel>();
    coronaNewsModelList = json
        .map((coronaNewsModelList) =>
            CoronaNewsModel.fromJson(coronaNewsModelList))
        .toList();
    return CoronaNewsModelList(
      coronaNewsModelList: coronaNewsModelList,
    );
  }

  @override
  String toString() {
    return 'CoronaNewsModelList{roles: $coronaNewsModelList}';
  }

  getLength() {
    return coronaNewsModelList.length;
  }
}
