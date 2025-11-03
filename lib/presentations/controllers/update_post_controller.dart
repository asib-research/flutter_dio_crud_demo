import 'package:test_project/core/services/api_services/dio_service.dart';

class CreatePostController {
  final DioService _dioService = DioService();
  bool isApiLoading = false;

  Future<void> createPost({required Map<String, dynamic> data}) async {
    isApiLoading = true;
    await _dioService.createPost(data: data);
    isApiLoading = false;
  }
}
