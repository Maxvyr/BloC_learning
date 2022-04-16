import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../models/photos.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = "https://jsonplaceholder.typicode.com/photos";

  Future<List<Photo>> fetchPhotoList() async {
    try {
      Response response = await _dio.get(_url);
      return parsePhotos(response.data as List<dynamic>);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");
      return [Photo.withError("Data not found / Connection issue")];
    }
  }

  List<Photo> parsePhotos(List<dynamic> res) {
    List<Photo> photos = res
        .map(
          (element) => Photo.fromJson(element),
        )
        .toList();
    return photos;
  }
}
