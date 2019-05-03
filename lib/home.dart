import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:wakanow_test/result.dart';

String url = 'https://test.api.amadeus.com/v1/security/oauth2/token';
var data;
var accessToken;

//Future<Post> createPost(Post post) async {
//  final response = await http.post('$url',
//      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
//      body: newPost.toMap());
//  print(response.body);
//  return Post.fromJson(json.decode(response.body)['access_token']);
//}

Future<Post> createPost(String url, {Map body}) async {
  Map<String, String> requestHeaders = {
    'Content-Type': 'application/x-www-form-urlencoded',
    'Accept': 'application/json',
  };
  return http
      .post(url, headers: requestHeaders, body: body)
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    data = jsonDecode(response.body);
    print(data);
    print(data['access_token']);

    accessToken = data['access_token'];
  });
}

Post newPost = new Post(
    grant_type: "client_credentials",
    client_id: '9EUyDJvzfPDs57kucVPODMtsYALPtmMN',
    client_secret: 'noPX4LEv2j2c5pPd');

var apiCall = createPost(
    'https://test.api.amadeus.com/v1/security/oauth2/token',
    body: newPost.toMap());

class Post {
  final String grant_type;
  final String client_id;
  final String client_secret;
  final String access_token;

  Post(
      {this.grant_type, this.client_id, this.client_secret, this.access_token});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      grant_type: json['grant_type'],
      client_id: json['client_id'],
      client_secret: json['client_secret'],
      access_token: json['access_token'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["grant_type"] = grant_type;
    map["client_id"] = client_id;
    map["client_secret"] = client_secret;

    return map;
  }
}

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue, accentColor: Colors.orange),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "One Way",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.0,
              ),
            ),
          ),
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 330.0,
                width: 1000.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                child: Card(
                  elevation: 2.0,
                  color: Colors.white,
                  shape: Border.all(color: Colors.black),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20.0),
                              child: Icon(Icons.my_location),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(
                                      "New York - New York(JFK)",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20.0),
                              child: Icon(Icons.location_on),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 16),
                                    child: Text(
                                      "Madrid - Barajas(MAD)",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20.0),
                              child: Icon(Icons.date_range),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 12.0, horizontal: 10.0),
                                child: Text(
                                  "2019-08-01",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: new Border(
                            bottom: BorderSide(color: Colors.black),
                          ),
                        ),
                        child: Row(
//                    crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 20.0),
                              child: Icon(Icons.airline_seat_recline_extra),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 10.0),
                                    child: Text(
                                      "Economy",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 12.0, bottom: 12.0, left: 14.0),
                              child: Icon(Icons.person),
                            ),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: Text(
                                      "1 Adult",
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  var p = await createPost(
                      'https://test.api.amadeus.com/v1/security/oauth2/token',
                      body: newPost.toMap());

                  setState(() {
                    p;
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ResultScreen()));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 95.0, right: 95.0, top: 12.0, bottom: 12.0),
                      child: Text("Search Flights",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
