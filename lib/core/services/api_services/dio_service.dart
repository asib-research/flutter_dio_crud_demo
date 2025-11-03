import 'package:dio/dio.dart';
import 'package:test_project/core/network/api_endpoint.dart';
import 'package:flutter/material.dart';

class DioService {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiEndpoint.apiEndpoint));

  Future<List> getPosts() async {
    try {
      final response = await _dio.get(ApiEndpoint.getPosts);
      return response.data;
    } catch (e) {
      debugPrint('Error in GET posts: $e');
      return [];
    }
  }

  Future<Map<String, dynamic>?> getSinglePost({required String id}) async {
    try {
      final response = await _dio.get(ApiEndpoint.getSinglePost(id));
      return response.data;
    } catch (e) {
      debugPrint('Error in GET posts: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> createPost({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.post(ApiEndpoint.createPost, data: data);
      return response.data;
    } catch (e) {
      debugPrint('Error in GET posts: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> updatePost({
    required String id,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await _dio.put(ApiEndpoint.updatePost(id), data: data);
      return response.data;
    } catch (e) {
      print('Error in PUT post: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> deletePost({required String id}) async {
    try {
      final response = await _dio.delete(ApiEndpoint.deletePost(id));
      return response.data;
    } catch (e) {
      print('Error in Delete post: $e');
      return null;
    }
  }
}
