import 'package:test_project/core/services/api_services/dio_service.dart';
import 'package:test_project/data/models/post_model.dart';

class PostController {
  final DioService _dioService = DioService();
  List<PostModel> postList = [];
  bool isApiLoading = false;

  Future<void> fetchPost() async {
    isApiLoading = true;
    final response = await _dioService.getPosts();
    postList = response.map((post) => PostModel.fromJson(post)).toList();
    isApiLoading = false;
  }
}
