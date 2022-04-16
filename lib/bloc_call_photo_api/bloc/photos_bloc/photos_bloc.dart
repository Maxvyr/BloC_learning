import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/photos.dart';
import '../../ressources/api_repository.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    final ApiRepository _apiRepository = ApiRepository();

    on<GetPhotoList>((event, emit) async {
      try {
        emit(PhotosLoading());
        final photos = await _apiRepository.fetchList();
        emit(PhotosLoaded(photos));
      } on NetworkError {
        emit(
          const PhotosError("Failed to fetch data. is your device online?"),
        );
      }
    });
  }
}
