part of 'joke_bloc_bloc.dart';

abstract class JokeBlocState extends Equatable {}

class JokeLoadingState extends JokeBlocState {
  @override
  List<Object> get props => [];
}

class JokeLoadedState extends JokeBlocState {
  final JokeModel joke;

  JokeLoadedState(this.joke);

  @override
  List<Object?> get props => [joke];
}

class JokeErrorState extends JokeBlocState {
  final String error;

  JokeErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
