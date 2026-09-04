import 'package:flutter/material.dart';
import 'package:counterapp/api/models/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostCard({super.key, required this.post, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(child: Text("${post.id}")),
        title: Text(post.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        // subtitle: Text(post.body, maxLines: 4, overflow: TextOverflow.ellipsis),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}