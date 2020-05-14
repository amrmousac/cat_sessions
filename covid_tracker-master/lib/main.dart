import 'package:covidtracker/models/data_model.dart';
import 'package:covidtracker/networking/coivd_data.dart';
import 'package:covidtracker/screens/data_screen.dart';
import 'package:flutter/material.dart';



main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              DataModel myData = snapshot.data;
              return DataScreen( data: myData);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }

          },
        )
      ),
    );
  }
}


/*

 */