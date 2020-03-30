import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:new_reader/Model/Model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

String apiKey = '28543636070b44eba95440f8a9b14d21';

Future<List<Source>> fetchNewSource() async {
  final response =
      await http.get('https://newsapi.org/v2/sources?apiKey=$apiKey');

  if (response.statusCode == 200) {
    List sources = jsonDecode(response.body)['sources'];
    return sources.map((source) => Source.fromJson(source)).toList();
  } else {
    throw Exception('Failed To Load The Sources List');
  }
}

void main() => runApp(SourceScreen());

class SourceScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SourceScreenState();
}

class SourceScreenState extends State<SourceScreen> {
  var list_sources;
  var RefreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    refreshListSource();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S.G. News',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
          appBar: AppBar(
            title: Text('S.G. News'),
          ),
          body: Center(
            child: RefreshIndicator(
              key: RefreshKey,
              onRefresh: refreshListSource,
              child: FutureBuilder<List<Source>>(
                future: list_sources,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } 
                  else if (snapshot.hasData) {
                    List<Source> sources = snapshot.data;
                    return ListView(
                      children: sources
                          .map((source) => GestureDetector(
                                onTap: () {},
                                child: Card(
                                  elevation: 1.0,
                                  color: Colors.white,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 14.0),
                                  child: Row(),
                                ),
                              ))
                          .toList(),
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          )),
    );
  }

  Future<Null> refreshListSource() {
    RefreshKey.currentState?.show(atTop: false);

    setState(() {
      list_sources = fetchNewSource();
    });

    return null;
  }
}
