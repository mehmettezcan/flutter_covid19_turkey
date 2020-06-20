class CovidModel {
  String country;
  String totalcases;
  String newCases;
  String totaldeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;

  CovidModel(
      {this.country,
      this.totalcases,
      this.newCases,
      this.totaldeaths,
      this.newDeaths,
      this.totalRecovered,
      this.activeCases});

  CovidModel.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    totalcases = json['totalcases'];
    newCases = json['newCases'];
    totaldeaths = json['totaldeaths'];
    newDeaths = json['newDeaths'];
    totalRecovered = json['totalRecovered'];
    activeCases = json['activeCases'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['totalcases'] = this.totalcases;
    data['newCases'] = this.newCases;
    data['totaldeaths'] = this.totaldeaths;
    data['newDeaths'] = this.newDeaths;
    data['totalRecovered'] = this.totalRecovered;
    data['activeCases'] = this.activeCases;
    return data;
  }
}
