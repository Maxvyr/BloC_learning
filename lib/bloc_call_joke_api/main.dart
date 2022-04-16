///This articlr help to build this app
/// https://dhruvnakum.xyz/flutter-bloc-v8-how-to-fetch-data-from-an-api-2022-guide

import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/data/repositories/joke_repositories.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/ui/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[900],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: RepositoryProvider(
        create: (_) => JokeRepository(),
        child: const HomePage(),
      ),
    );
  }
}
