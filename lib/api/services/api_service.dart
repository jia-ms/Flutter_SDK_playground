import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:counterapp/api/models/api_user.dart';
import 'package:counterapp/api/models/post.dart';
import 'package:counterapp/api/models/photo.dart';
import 'package:counterapp/api/models/comments.dart';
import 'package:http/http.dart' as http;


List<Photo> parsePhotos(String responseBody) {
  final List<dynamic> jsonList = jsonDecode(responseBody);

  return jsonList.map((json) {
    return Photo.fromJson(json);
  }).toList();
}
List<Comments> parseComments(String responseBody) {
  final List<dynamic> jsonList = jsonDecode(responseBody);

  return jsonList.map((json) {
    return Comments.fromJson(json);
  }).toList();
}

class ApiService {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    final response = await http.get(Uri.parse("$baseUrl/posts"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load posts!");
    }
  }

  Future<Post> getPost(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/posts/$id"));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load post!");
    }
  }

  Future<List<ApiUser>> fetchUsers() async {
    final response = await http.get(Uri.parse("$baseUrl/users"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);

      return jsonData.map((u) => ApiUser.fromJson(u)).toList();
    } else {
      throw Exception("Failed to load users!");
    }
  }

  Future<List<Photo>> getPhotos() async {
    final response = await http.get(Uri.parse("$baseUrl/photos"));

    if (response.statusCode == 200) {
      final photos = await compute(parsePhotos, response.body);
      return photos;
    } else {
      throw Exception("Failed to load photos!");
    }
  }

  Future<List<Comments>> getComments() async {
    final response = await http.get(Uri.parse("$baseUrl/comments"));

    if (response.statusCode == 200) {
      final comment = await compute(parseComments, response.body);
      return comment;
    } else {
      throw Exception("Failed to load photos!");
    }
  }
}
