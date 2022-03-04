import 'dart:io';

import 'package:flutter/material.dart';

import 'package:shelf_router/shelf_router.dart' as SRouter;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

import 'views/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _startServer(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xff091A2A),
        accentColor: Color(0xffE50914),
        fontFamily: 'Poppins',
      ),
      home: HomePage(),
    );
  }

  void _startServer(BuildContext context) async {
    final app = SRouter.Router();

    app.get('/getCurrentWidgetTree', (Request request) async {
      /******* REPLACE THE EXAMPLE JSON BELOW WITH A CALL TO YOUR METHOD FOR GETTING THE ACTUAL TREE *******/
      final json =
          "[{top: 50.0, left: 66.95954487989886, width: 256.0809102402023, height: 337.6, color: #ffffffff}, {top: 397.6, left: 35.0, width: 105.0, height: 39.0, color: #ffffffff}]"; // eg. getElementTreeJson();
      /******* REPLACE THE EXAMPLE JSON ABOVE WITH A CALL TO YOUR METHOD FOR GETTING THE ACTUAL TREE *******/
      final headers = {HttpHeaders.contentTypeHeader: "application/json"};

      return Response.ok(json, headers: headers);
    });

    await io.serve(app, 'localhost', 9000);
  }
}
