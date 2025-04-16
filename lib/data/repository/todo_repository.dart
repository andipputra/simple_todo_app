import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_todo_app/data/model/todo.dart';

class TodoRepository {
  final _boxNames = 'todos';
  final GetStorage _storage = GetStorage();

  Future<List<Todo>> getTodos() async {
    final listTodo = <Todo>[];
    final todos = _storage.read(_boxNames);

    if (todos != null && todos is List) {
      listTodo.addAll(todos.map((e) => e is Todo ? e : Todo.fromJson(e)));
    }

    return listTodo;
  }

  Future<Todo?> getTodoDetail(String id) async {
    final todos = await getTodos();
    return todos.firstWhereOrNull((todo) => todo.id == id);
  }

  Future<void> addTodo(Todo todo) async {
    final todos = await getTodos();
    todos.add(todo);
    await saveTodos(todos);
  }

  Future<void> saveTodos(List<Todo> todos) async {
    await _storage.write(_boxNames, todos);
  }

  Future<void> updateTodo(Todo todo) async {
    final todos = await getTodos();
    final index = todos.indexWhere((element) => element.id == todo.id);
    todos[index] = todo;
    await saveTodos(todos);
  }

  Future<void> removeTodo(String id) async {
    final todos = await getTodos();
    todos.removeWhere((todo) => todo.id == id);
    await saveTodos(todos);
  }
}
