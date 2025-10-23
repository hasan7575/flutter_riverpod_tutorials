import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/posts_provider.dart';

class AsyncHomePage extends ConsumerWidget {
  const AsyncHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider & AsyncValue (ق۵)'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              ref.invalidate(postsProvider);
            },
          )
        ],
      ),
      body: Center(
        child: asyncPosts.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, color: Colors.red, size: 40),
              const SizedBox(height: 10),
              const Text('An error occurred:', style: TextStyle(color: Colors.red)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          data: (posts) {
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  leading: CircleAvatar(child: Text('${post.id}')),
                  title: Text(post.title),
                  subtitle: Text(post.body, maxLines: 1, overflow: TextOverflow.ellipsis),
                );
              },
            );
          },
        ),
      ),
    );
  }
}