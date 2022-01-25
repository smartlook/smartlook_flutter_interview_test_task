import 'dart:io';

import 'package:flutter/material.dart';
import 'package:movie_streaming_app/views/movie_screen.dart';

import 'views/home_page.dart';

void main() {
  runApp(MyApp());

  startServer();
}

startServer() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8080);
  print("Server running on IP : " +
      server.address.toString() +
      " On Port : " +
      server.port.toString());
  await for (var request in server) {
    var statusCode = 405;
    var responseJson =
        '{"code": 405, "message": "No route found for \'${request.method} ${request.uri.path}\': Method Not Allowed"}';

    if (request.method == "GET" &&
        request.uri.path == "/getCurrentWidgetTree") {
      statusCode == 200;
      /******* REPLACE THE EXAMPLE JSON BELOW WITH A CALL TO YOUR METHOD FOR GETTING THE ACTUAL TREE *******/
      responseJson =
          "[{top: 50.0, left: 66.95954487989886, width: 256.0809102402023, height: 337.6, color: #ffffffff}, {top: 397.6, left: 35.0, width: 105.0, height: 39.0, color: #ffffffff}]"; // eg. getElementTreeJson();
      /******* REPLACE THE EXAMPLE JSON ABOVE WITH A CALL TO YOUR METHOD FOR GETTING THE ACTUAL TREE *******/
    }

    request.response
      ..statusCode = statusCode
      ..headers.contentType =
          new ContentType("application", "json", charset: "utf-8")
      ..write(responseJson)
      ..close();
  }
}

class MyApp extends StatelessWidget {
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
}
