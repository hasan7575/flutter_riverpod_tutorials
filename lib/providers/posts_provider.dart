import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tutorials/models/post.dart';
import 'package:flutter_tutorials/services/api_service.dart';

final postProvider = FutureProvider<List<Post>>((ref) async {
  return fetchPosts();
});