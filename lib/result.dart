import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakanow_test/home.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';
import 'segment.dart';

var _token;
var url =
    'https://test.api.amadeus.com/v1/shopping/flight-offers?origin=NYC&destination=MAD&departureDate=2019-08-01&adults=1&travelClass=ECONOMY&nonStop=true&currency=ngn&max=50';
List data;

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();

  final Parameters parameters;

  ResultScreen({Key key, @required this.parameters}) : super(key: key);
}

class _ResultScreenState extends State<ResultScreen> {
  Map allData;
  List data;
  var isLoading = false;
  var accessToken;

  @override
  void initState() {
    super.initState();
    saveValues();
    makeRequest();
  }

  Future<List<Segment>> makeRequest() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${_token}"
    });

    if (response.statusCode == 200) {
//      allData =
//          jsonDecode(response.body); //JSON.decode ins older versions of flutter
//
//      data = allData['data'];
//
//      print(data.toString());
//
//      setState(() {
//        isLoading = false;
//      });

      List flights = json.decode(response.body)['data'];
    } else {
      throw Exception('Failed to load');
    }
  }

  saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _token = (prefs.getString('accessToken') ?? 'access token here');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Flight Results",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
          elevation: 0.0,
        ),
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView.builder(
                    itemCount: data == null ? 0 : data.length,
                    padding: EdgeInsets.all(16.0),
                    itemBuilder: (BuildContext context, int position) {
                      //Set divider for every thing in odd position(There is a better way to do it)
                      if (position.isOdd) return Divider();
                      final index = position ~/ 2;
                      String dCode = data[index]['offerItems'];

                      return ListTile(
                        title: Text(dCode),
                      );
                    })),
      ),
    );
  }
}
