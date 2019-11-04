import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:flutter_movie_deep_dive_test/src/app.dart';
import 'package:flutter_movie_deep_dive_test/src/providers/providers.dart';

void main() => runApp(AppProvider(
      httpClient: Client(),
      child: MyApp(),
    ));
