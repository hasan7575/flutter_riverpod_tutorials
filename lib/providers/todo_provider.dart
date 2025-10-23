
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_tutorials/models/todo_model.dart';

class TodoNotifier extends StateNotifier<List<Todo>>{
  TodoNotifier():super([]);


  void addTodo(String description){
    final todo = Todo(id: DateTime.now().toString(), description: description);
    state = [...state, todo];
  }

  void toggleTodo(String todoId){
    state=[
      for(final todo in state)
        if(todo.id==todoId)
          todo.copyWith(isCompleted: !todo.isCompleted)
      else
        todo,
    ];
  }

  void removeTodo(String todoId){
    state=state.where((todo)=>todo.id !=todoId).toList();
  }
}

final todoListProvider=StateNotifierProvider<TodoNotifier, List<Todo>>((ref){
  return TodoNotifier();
});