import 'package:get/get.dart';
import 'package:simple_todo_app/data/model/todo.dart';
import 'package:simple_todo_app/data/repository/todo_repository.dart';

class TodoController extends GetxController {
  TodoController(this.todoRepository);
  final TodoRepository todoRepository;

  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    getAllTodo();
  }

  Future<void> getAllTodo() async {
    todos.clear();
    final todosResponse = await todoRepository.getTodos();
    todos.addAll(todosResponse);
  }

  Future<void> addTodo(Todo todo) async {
    await todoRepository.addTodo(todo);
    getAllTodo();
  }

  Future<void> removeTodoAt(String id) async {
    await todoRepository.removeTodo(id);
    getAllTodo();
  }

  Future<void> updateTodo(Todo todo) async {
    await todoRepository.updateTodo(todo);
    getAllTodo();
  }
}
