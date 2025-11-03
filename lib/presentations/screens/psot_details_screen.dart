import 'package:flutter/material.dart';
import 'package:test_project/presentations/controllers/post_details_controller.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key, required this.id});

  final String id;

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final PostDetailsController _postDetailsController = PostDetailsController();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() => _postDetailsController.isApiLoading = true);
    await _postDetailsController.fetchPostDetails(id: widget.id);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post Details"),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _postDetailsController.isApiLoading
            ? const Center(child: CircularProgressIndicator())
            : ListTile(
                leading: CircleAvatar(
                  child: Text("${_postDetailsController.postDetails.id ?? ''}"),
                ),
                title: Text(
                  _postDetailsController.postDetails.title ?? "Unknown",
                ),
                subtitle: Text(
                  _postDetailsController.postDetails.body ?? "Unknown",
                ),
              ),
      ),
    );
  }
}
