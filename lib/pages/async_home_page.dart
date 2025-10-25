import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/posts_provider.dart';

class AsyncHomePage extends ConsumerWidget {
  const AsyncHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPosts = ref.watch(postProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider & AsyncValue (ق۵)'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {
            ref.invalidate(postProvider);
          }),
        ],
      ),
      body: Center(
        child: asyncPosts.when(
          data: (posts) {
            return Stack(
              alignment: Alignment.topCenter,
              children: [

                if(asyncPosts.isLoading)
                 Container(child: LinearProgressIndicator(),),
                ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(posts[index].title),
                      subtitle: Text(
                        posts[index].body,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      leading: CircleAvatar(
                        child: Text(posts[index].id.toString()),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          loading: () {
            return const CircularProgressIndicator();
          },
          error: (error, stackTrace) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, color: Colors.red, size: 50),
                const SizedBox(height: 20),
                const Text(
                  'Something went wrong',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                Text(error.toString()),
              ],
            );
          },
        ),
      ),
    );
  }
}
