class Todo{
  final String id;
  final String description;
  final bool isCompleted;

  Todo({required this.id, required this.description, this.isCompleted = false});

  Todo copyWith({String? id, String? description, bool? isCompleted}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}