import 'package:flutter/material.dart';
import 'package:test_project/data/models/post_model.dart';
import 'package:test_project/presentations/controllers/post_controller.dart';
import 'package:test_project/presentations/screens/psot_details_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final PostController _postController = PostController();

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() => _postController.isApiLoading = true);
    await _postController.fetchPost();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
        forceMaterialTransparency: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _postController.isApiLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemCount: _postController.postList.length,
                itemBuilder: (context, index) {
                  final PostModel post = _postController.postList[index];
                  return ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> PostDetailsScreen(id: post.id.toString())));
                    },
                    leading: CircleAvatar(child: Text("${post.id ?? ''}")),
                    title: Text(post.title ?? "Unknown"),
                    subtitle: Text(post.body ?? "Unknown"),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
      ),
    );
  }
}
