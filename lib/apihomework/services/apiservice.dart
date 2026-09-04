import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/todo.dart';

class ApiService {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<ApiTodo>> fetchTodos() async {
    final response = await http.get(Uri.parse("$_baseUrl/todos"));

    if (response.statusCode != 200) {
      throw Exception("Failed to load todos (${response.statusCode})");
    }

    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ApiTodo.fromJson(json)).toList();
  }

  Future<ApiTodo> addTodo(String title) async {
    final response = await http.post(
      Uri.parse("$_baseUrl/todos"),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode({"title": title, "completed": false, "userId": 1}),
    );

    if (response.statusCode != 201) {
      throw Exception("Failed to add todo (${response.statusCode})");
    }

    return ApiTodo.fromJson(jsonDecode(response.body));
  }

  Future<void> toggleTodo(int id, bool completed) async {
    final response = await http.patch(
      Uri.parse("$_baseUrl/todos/$id"),
      headers: {"Content-Type": "application/json; charset=UTF-8"},
      body: jsonEncode({"completed": completed}),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to update todo (${response.statusCode})");
    }
  }

  Future<void> deleteTodo(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/todos/$id"));

    if (response.statusCode != 200) {
      throw Exception("Failed to delete todo (${response.statusCode})");
    }
  }
}