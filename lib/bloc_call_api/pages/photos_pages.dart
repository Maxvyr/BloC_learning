import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/photos_bloc/photos_bloc.dart';
import '../models/photos.dart';
import 'loading_page.dart';
import 'view_image_pages.dart';

class PhotoPages extends StatefulWidget {
  const PhotoPages({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  _PhotoPagesState createState() => _PhotoPagesState();
}

class _PhotoPagesState extends State<PhotoPages> {
  final PhotosBloc _newsBloc = PhotosBloc();

  @override
  void initState() {
    _newsBloc.add(GetPhotoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<PhotosBloc, PhotosState>(
          listener: (context, state) {
            if (state is PhotosError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<PhotosBloc, PhotosState>(
            builder: (context, state) {
              if (state is PhotosInitial) {
                return const LoadingPage();
              } else if (state is PhotosLoading) {
                return const LoadingPage();
              } else if (state is PhotosLoaded) {
                return _BuildCard(photos: state.photos);
              } else if (state is PhotosError) {
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _BuildCard extends StatelessWidget {
  const _BuildCard({
    required this.photos,
    Key? key,
  }) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        final photo = photos[index];

        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ViewImage(photo: photo),
            ),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(photo.thumbnailUrl),
            ),
            title: Text("${photo.id}. ${photo.title}"),
          ),
        );
      },
    );
  }
}
