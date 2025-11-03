import 'package:flutter/material.dart';
import 'package:test_project/data/models/post_model.dart';
import 'package:test_project/presentations/controllers/create_post_controller.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key, this.onPostCreatedPost});

  final void Function(PostModel)? onPostCreatedPost;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final CreatePostController _createPostController = CreatePostController();

  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: InputDecoration(hintText: "Enter title"),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionTEController,
                decoration: InputDecoration(hintText: "Enter Description"),
              ),
              SizedBox(height: 24),
              _createPostController.isApiLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final newPost = PostModel(
                            id: DateTime.now().millisecondsSinceEpoch,
                            userId: 1,
                            title: _titleTEController.text.trim(),
                            body: _descriptionTEController.text.trim(),
                          );

                          widget.onPostCreatedPost?.call(newPost);
                        }
                      },
                      child: Text("Create"),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _titleTEController.dispose();
    _descriptionTEController.dispose();
  }
}
