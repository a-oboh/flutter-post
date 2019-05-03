import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  @override
  _ResultScreenState createState() => _ResultScreenState();

  String from;
  String to;
  String date;
  String adult;
  String travelClass;
  String passengers;

  ResultScreen(
      {Key key,
      @required this.from,
      this.to,
      this.date,
      this.adult,
      this.travelClass,
      this.passengers})
      : super(key: key);
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
