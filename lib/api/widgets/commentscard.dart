import 'package:flutter/material.dart';
import 'package:counterapp/api/models/comments.dart';
import 'package:counterapp/api/widgets/section_tile.dart';

class CommentsCard extends StatelessWidget {
  final Comments comment;

  const CommentsCard({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        leading: const CircleAvatar(
          child: Icon(Icons.comment),
        ),

        title: Text(
          comment.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),

        subtitle: Text(
          comment.email,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),

        children: [
          const Divider(height: 1),

          const SectionTile(
            icon: Icons.comment,
            title: "Comment Info",
          ),

          InfoTile(
            icon: Icons.numbers,
            label: "Post ID",
            value: comment.postId.toString(),
          ),

          InfoTile(
            icon: Icons.numbers,
            label: "Comment ID",
            value: comment.id.toString(),
          ),

          InfoTile(
            icon: Icons.person_outline,
            label: "Name",
            value: comment.name,
          ),

          InfoTile(
            icon: Icons.email_outlined,
            label: "Email",
            value: comment.email,
          ),

          InfoTile(
            icon: Icons.message_outlined,
            label: "Comment",
            value: comment.body,
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}