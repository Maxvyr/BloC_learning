import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_simple/app.dart';
import 'package:flutter_application_bloc_simple/counter_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(
      const CounterApp()
    ),
    blocObserver: CounterObserver(),
  );
}
