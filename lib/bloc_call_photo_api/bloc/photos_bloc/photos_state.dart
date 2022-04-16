part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();

  @override
  List<Object?> get props => [];
}

class PhotosInitial extends PhotosState {}

class PhotosLoading extends PhotosState {}

class PhotosLoaded extends PhotosState {
  final List<Photo> photos;
  const PhotosLoaded(this.photos);
}

class PhotosError extends PhotosState {
  final String? message;
  const PhotosError(this.message);
}