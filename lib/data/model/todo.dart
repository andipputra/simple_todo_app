class Todo {
  final String id;
  final String title;
  final DateTime createdAt;
  final DateTime todoDate;
  final DateTime? updatedAt;
  final bool worked;
  final String description;

  Todo({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.todoDate,
    this.updatedAt,
    this.worked = false,
    this.description = '',
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json['id'],
    title: json['title'],
    createdAt: DateTime.parse(json['createdAt']),
    todoDate: DateTime.parse(json['todoDate']),
    updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt']),
    worked: json['worked'],
    description: json['description'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'createdAt': createdAt.toIso8601String(),
    'todoDate': todoDate.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'worked': worked,
    'description': description,
  };

  Todo copyWith({
    String? id,
    String? title,
    DateTime? createdAt,
    DateTime? todoDate,
    DateTime? updatedAt,
    bool? worked,
    String? description,
  }) => Todo(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    todoDate: todoDate ?? this.todoDate,
    updatedAt: updatedAt ?? this.updatedAt,
    worked: worked ?? this.worked,
    description: description ?? this.description,
  );
}

