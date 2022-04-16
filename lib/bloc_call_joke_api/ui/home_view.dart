import 'package:flutter/material.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/bloc/joke_bloc/joke_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Joke App'),
      ),
      body: BlocBuilder<JokeBloc, JokeBlocState>(
        builder: (context, state) {
          if (state is JokeLoadingState) {
            return const CircularProgressIndicator();
          }
          if (state is JokeLoadedState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ExpansionTile(
                    title: Text(
                      state.joke.setup,
                      textAlign: TextAlign.center,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.joke.delivery,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<JokeBloc>(context).add(LoadJokeEvent());
                    },
                    child: const Text('Load New Joke'),
                  ),
                ],
              ),
            );
          }

          if (state is JokeErrorState) {
            return Center(
              child: Text(state.error.toString()),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
