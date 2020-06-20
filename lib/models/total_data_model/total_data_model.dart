class TotalDataModel {
  String totalDeaths;
  String totalCases;
  String totalRecovered;

  TotalDataModel({this.totalDeaths, this.totalCases, this.totalRecovered});

  TotalDataModel.fromJson(Map<String, dynamic> json) {
    totalDeaths = json['totalDeaths'];
    totalCases = json['totalCases'];
    totalRecovered = json['totalRecovered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalDeaths'] = this.totalDeaths;
    data['totalCases'] = this.totalCases;
    data['totalRecovered'] = this.totalRecovered;
    return data;
  }
}
