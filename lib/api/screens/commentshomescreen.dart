import 'package:flutter/material.dart';
import 'package:counterapp/api/services/api_service.dart';
import 'package:counterapp/api/widgets/commentscard.dart';

import '../models/comments.dart';

class CommentsHomeScreen extends StatefulWidget {
  const CommentsHomeScreen({super.key});

  @override
  State<CommentsHomeScreen> createState() => _CommentsHomeScreenState();
}

class _CommentsHomeScreenState extends State<CommentsHomeScreen> {
  final ApiService apiService = ApiService();

  late Future<List<Comments>> commentsFuture;

  @override
  void initState() {
    super.initState();
    commentsFuture = apiService.getComments();
  }

  Future<void> refreshComments() async {
    setState(() {
      commentsFuture = apiService.getComments();
    });
    await commentsFuture;
  }

  @override
  Widget build(BuildContext build){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Comments>>(
        future:commentsFuture,

        builder:(context,data){
          if(data.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(data.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline_rounded,
                    size:60,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 18),

                  Text(
                    "Something went wrong!",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height:8),

                  ElevatedButton(
                    onPressed: refreshComments,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          final comments=data.data ?? [];

          return RefreshIndicator(
            onRefresh: refreshComments,

            child: ListView.builder(
              itemCount: comments.length,

              itemBuilder: (context, index) {
                final comment = comments[index];

                return CommentsCard(
                  comment:comment,
                );
              },
            ),
          );
        },
      ),
    );
  }
}