import 'package:get/get.dart';
import 'package:simple_todo_app/data/repository/todo_repository.dart';
import 'package:simple_todo_app/presentation/controller/todo_controller.dart';

class InitialBinding with Bindings {
  @override
  void dependencies() {
    Get.put<TodoRepository>(TodoRepository());

    Get.put<TodoController>(TodoController(Get.find<TodoRepository>()));
  }
}
