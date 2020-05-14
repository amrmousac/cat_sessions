class DataModel {
  List<CountriesStat> countriesStat;
  String statisticTakenAt;

  DataModel({this.countriesStat, this.statisticTakenAt});

  DataModel.fromJson(Map<String, dynamic> json) {
    if (json['countries_stat'] != null) {
      countriesStat = new List<CountriesStat>();
      json['countries_stat'].forEach((v) {
        countriesStat.add(new CountriesStat.fromJson(v));
      });
    }
    statisticTakenAt = json['statistic_taken_at'];
  }

}

class CountriesStat {
  String countryName;
  String cases;
  String deaths;
  String region;
  String totalRecovered;
  String newDeaths;
  String newCases;
  String seriousCritical;
  String activeCases;
  String totalCasesPer1mPopulation;
  String deathsPer1mPopulation;
  String totalTests;
  String testsPer1mPopulation;

  CountriesStat(
      {this.countryName,
        this.cases,
        this.deaths,
        this.region,
        this.totalRecovered,
        this.newDeaths,
        this.newCases,
        this.seriousCritical,
        this.activeCases,
        this.totalCasesPer1mPopulation,
        this.deathsPer1mPopulation,
        this.totalTests,
        this.testsPer1mPopulation});

  CountriesStat.fromJson(Map<String, dynamic> json) {
    countryName = json['country_name'];
    cases = json['cases'];
    deaths = json['deaths'];
    region = json['region'];
    totalRecovered = json['total_recovered'];
    newDeaths = json['new_deaths'];
    newCases = json['new_cases'];
    seriousCritical = json['serious_critical'];
    activeCases = json['active_cases'];
    totalCasesPer1mPopulation = json['total_cases_per_1m_population'];
    deathsPer1mPopulation = json['deaths_per_1m_population'];
    totalTests = json['total_tests'];
    testsPer1mPopulation = json['tests_per_1m_population'];
  }


}

