class ContinentDataModel {
  String continent;
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;

  ContinentDataModel(
      {this.continent,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases});

  ContinentDataModel.fromJson(Map<String, dynamic> json) {
    continent = json['continent'];
    totalCases = json['totalCases'];
    newCases = json['newCases'];
    totalDeaths = json['totalDeaths'];
    newDeaths = json['newDeaths'];
    totalRecovered = json['totalRecovered'];
    activeCases = json['activeCases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['continent'] = this.continent;
    data['totalCases'] = this.totalCases;
    data['newCases'] = this.newCases;
    data['totalDeaths'] = this.totalDeaths;
    data['newDeaths'] = this.newDeaths;
    data['totalRecovered'] = this.totalRecovered;
    data['activeCases'] = this.activeCases;
    return data;
  }
}
