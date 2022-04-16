part of 'joke_bloc_bloc.dart';

abstract class JokeBlocEvent extends Equatable {
  const JokeBlocEvent();
}

class LoadJokeEvent extends JokeBlocEvent {
  @override
  List<Object> get props => [];
}
