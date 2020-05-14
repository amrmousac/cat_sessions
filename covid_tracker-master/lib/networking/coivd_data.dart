import 'dart:convert';

import 'package:covidtracker/models/data_model.dart';
import 'package:http/http.dart' as http;

getData() async {
  final http.Response response =
      await http.get('https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php',
      headers: {
        "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
        "x-rapidapi-key": "23b07c350emsh9c68105cd7bb956p1098b0jsn5db7e0c88443"
      });
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);

    DataModel dataModel = DataModel.fromJson(parsed);

    return dataModel;
  }else{
   throw Exception('Failed to get data ${response.statusCode}');

  }


}
