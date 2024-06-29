import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:netforemostflutter/config/common.dart';
import '../models/article.dart';

class HomeController {
  final url = Uri.parse(Common.baseUrl);

  Future<List<Article>> fetchArticles() async {
    try {
      final response = await http.get(url);

      if (kDebugMode) {
        print('Response status: ${response.statusCode}');
      }
      if (kDebugMode) {
        print('Response body: ${response.body}');
      }

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => Article.fromJson(json)).toList();
      } else {
        if (kDebugMode) {
          print('Failed to load articles');
        }
        // Devuelve una lista vacía o maneja el error según tus necesidades
        return [];
      }
    } on http.ClientException catch (e) {
      // Captura específicamente excepciones de cliente HTTP
      if (kDebugMode) {
        print('HTTP Client Exception: $e');
      }
      // Devuelve una lista vacía o maneja el error según tus necesidades
      return [];
    } catch (e) {
      // Captura cualquier otra excepción
      if (kDebugMode) {
        print('Error: $e');
      }
      // Devuelve una lista vacía o maneja el error según tus necesidades
      return [];
    }
  }
}
