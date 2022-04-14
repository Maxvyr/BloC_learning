

import '../models/photos.dart';
import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<Photo>> fetchList() {
    return _provider.fetchPhotoList();
  }
}

class NetworkError extends Error {}