import 'package:covidtracker/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
class DataScreen extends StatelessWidget {
  final DataModel data;
  DataScreen({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Covid-19 Tracker'),
      ),
      body: ListView.builder(
        itemCount: data.countriesStat.length,
        itemBuilder: (context, index) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data.countriesStat[index].countryName),
                Row(
                  children: <Widget>[
                   ListItem(text: 'cases',color: Colors.amber,icon: Icons.language, value:data.countriesStat[index].cases ),
                   ListItem(text: 'total Recovered',color: Colors.green,icon: Icons.mood, value:data.countriesStat[index].totalRecovered),
                   ListItem(text: 'total Death',color: Colors.red,icon: Icons.mood_bad, value:data.countriesStat[index].deaths),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListItem({String text, String value, Color color, IconData icon}){
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoSizeText(value),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(icon,size: 5.0,),
                Text(text,style: TextStyle(
                  fontSize: 8
                ),),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
