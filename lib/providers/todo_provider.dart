import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_tutorials/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<Todo>> {
  TodoNotifier() : super([]);

  void addTodo(String description) {
    final todo = Todo(id: DateTime.now().toString(), description: description);
    state = [...state, todo];
  }

  void toggleTodo(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void removeTodo(String todoId) {
    state = state.where((todo) => todo.id != todoId).toList();
  }

  void editTodoDescription(String todoId, String newDescription) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(description: newDescription)
        else
          todo,
    ];
  }
}

final todoListProvider =
    StateNotifierProvider.autoDispose<TodoNotifier, List<Todo>>((ref) {
      ref.onDispose(() {
        print('todoListProvider dispose');
      });
      return TodoNotifier();
    });

enum FilterType { all, active, completed }

final filterTodosProvider = Provider.family.autoDispose<List<Todo>, FilterType>(
  (ref, filterType) {
    final todos = ref.watch(todoListProvider);

    switch (filterType) {
      case FilterType.all:
        return todos;
      case FilterType.active:
        return todos.where((todo) => !todo.isCompleted).toList();
      case FilterType.completed:
        return todos.where((todo) => todo.isCompleted).toList();
      default:
        return todos;
    }
  },
);
