import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/todo_provider.dart';
import '../models/todo_model.dart';

class TodoHomePage extends ConsumerWidget {
  final TextEditingController _textController = TextEditingController();

  TodoHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("TodoHomePage Rebuild");
    final todoList = ref.watch(todoListProvider);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('📝 Todo List'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Progress Card
         const TodoProgressCard(),

          // Add Task Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Add a new task...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  onPressed: () {
                    if (_textController.text.trim().isNotEmpty) {
                      ref.read(todoListProvider.notifier).addTodo(_textController.text.trim());
                      _textController.clear();
                    }
                  },
                  backgroundColor: Colors.blue,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // Todo List
          Expanded(
            child: todoList.isEmpty
                ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.task_alt, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No tasks yet!',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Text(
                    'Add your first task above',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ListTile(
                    onTap: (){
                      _shoeEditDialog(context, ref,todo);
                    },
                    leading: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (_) {
                        ref.read(todoListProvider.notifier).toggleTodo(todo.id);

                      },
                      activeColor: Colors.blue,
                    ),
                    title: Text(
                      todo.description,
                      style: TextStyle(
                        decoration: todo.isCompleted
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: todo.isCompleted ? Colors.grey : Colors.black87,
                        fontSize: 16,
                      ),
                    ),

                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ref.read(todoListProvider.notifier).removeTodo(todo.id);

                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _shoeEditDialog(BuildContext context, WidgetRef ref, Todo todo) {
    final TextEditingController _editController = TextEditingController(text: todo.description);
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text('Edit Task'),
        content: TextField(
          controller: _editController,
          decoration: const InputDecoration(hintText: 'Enter new task'),
        ),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: (){
              ref.read(todoListProvider.notifier).editTodoDescription(todo.id, _editController.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ]
      );
    });
  }


}

class TodoProgressCard extends ConsumerWidget {
  const TodoProgressCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state=ref.watch(todoListProvider.select((todoList){
      final total=todoList.length;
      final completedCount=todoList.where((todo)=>todo.isCompleted).length;
      return (total:total,completedCount:completedCount);
    }));
    print("TodoProgressCard Rebuild");
    // TODO: implement build
    return  Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Progress',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                '${state.completedCount} of ${state.total} completed',
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
          CircularProgressIndicator(
            value: state.total==0 ? 0.0 : state.completedCount / state.total,
            backgroundColor: Colors.grey[300],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
        ],
      ),
    );
  }
}