import 'package:test_project/core/services/api_services/dio_service.dart';
import 'package:test_project/data/models/post_details_model.dart';
import 'package:test_project/data/models/post_model.dart';

class PostDetailsController {
  final DioService _dioService = DioService();
  PostDetailsModel postDetails = PostDetailsModel();
  bool isApiLoading = false;

  Future<void> fetchPostDetails({required String id}) async {
    isApiLoading = true;
    final response = await _dioService.getSinglePost(id: id);
    if (response != null) {
      postDetails = PostDetailsModel.fromJson(response);
    }
    isApiLoading = false;
  }
}
