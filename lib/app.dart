import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_simple/counter/view/counter_page.dart';


class CounterApp extends MaterialApp {
  const CounterApp({Key? key})
      : super(
          key: key,
          home: const CounterPage(),
        );
}
