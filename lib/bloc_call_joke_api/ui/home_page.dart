import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/bloc/joke_bloc/joke_bloc_bloc.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/data/repositories/joke_repositories.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/ui/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(
        RepositoryProvider.of<JokeRepository>(context),
      )..add(LoadJokeEvent()),
      child: const HomeView()
    );
  }
}
