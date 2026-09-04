import 'package:flutter/material.dart';
import 'package:counterapp/api/screens/api_user_home_screen.dart';
import 'package:counterapp/api/screens/post_detail_screen.dart';
import 'package:counterapp/api/services/api_service.dart';
import 'package:counterapp/api/widgets/post_card.dart';

import '../models/post.dart';

class ApiHomeScreen extends StatefulWidget{
  const ApiHomeScreen({super.key});

  @override
  State<ApiHomeScreen> createState() => _ApiHomeScreenState();
}

class _ApiHomeScreenState extends State<ApiHomeScreen> {
  final ApiService apiService = ApiService();

  late Future<List<Post>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = apiService.getPosts();
  }

  Future<void> refreshPosts() async{
    setState(() {
      postsFuture = apiService.getPosts();
    });
    await postsFuture;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Posts"),centerTitle: true),
      body: FutureBuilder(
        future: postsFuture,
        builder: (context, data) {
          if (data.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (data.hasError) {
            return Center(
              child: Column(
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
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: refreshPosts,
                    child: const Text("Retry"),
                  ),
                ],
              ),
            );
          }

          final posts = data.data ??[];

          return RefreshIndicator(
            onRefresh: refreshPosts,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => ApiUserHomeScreen()),
                    );
                  },
                  child: Text("Go to User Screen"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];

                      return PostCard(
                        post: post,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => PostDetailScreen(post: post),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}