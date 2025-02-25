import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController _postController = TextEditingController();
  File? _selectedImage;
  String _postType = "product"; // Default post type

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _submitPost() {
    if (_postController.text.isNotEmpty || _selectedImage != null) {
      // Handle post submission logic for StitchHub
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Post"),
        backgroundColor: Colors.deepPurple,
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: Text("Post", style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://via.placeholder.com/50"),
                  radius: 25,
                ),
                SizedBox(width: 10),
                Text("John Doe", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _postType,
              items: [
                DropdownMenuItem(value: "product", child: Text("Product Post")),
                DropdownMenuItem(value: "order", child: Text("Order Request")),
              ],
              onChanged: (value) {
                setState(() {
                  _postType = value!;
                });
              },
              decoration: InputDecoration(
                labelText: "Select Post Type",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: _postType == "product" ? "Describe your product..." : "Describe your order request...",
                border: InputBorder.none,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 10),
            if (_selectedImage != null)
              Stack(
                children: [
                  Image.file(_selectedImage!, height: 200, width: double.infinity, fit: BoxFit.cover),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            _selectedImage = null;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image, color: Colors.deepPurple),
                  onPressed: _pickImage,
                ),
                Text("Add Photo", style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
