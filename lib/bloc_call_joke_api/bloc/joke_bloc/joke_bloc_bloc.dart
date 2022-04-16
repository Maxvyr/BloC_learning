import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/data/models/joke_model.dart';
import 'package:flutter_application_bloc_simple/bloc_call_joke_api/data/repositories/joke_repositories.dart';

part 'joke_bloc_event.dart';
part 'joke_bloc_state.dart';

class JokeBloc extends Bloc<JokeBlocEvent, JokeBlocState> {
  final JokeRepository _jokeRepository;

  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>((event, emit) async {
      emit(JokeLoadingState());
      try {
        final joke = await _jokeRepository.getJoke();
        emit(JokeLoadedState(joke));
      } catch (err) {
        emit(JokeErrorState(err.toString()));
      }
    });
  }
}
