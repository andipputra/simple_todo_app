import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/controller/todo_controller.dart';
import 'package:simple_todo_app/presentation/controller/todo_form_controller.dart';

class TodoFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TodoFormController(Get.find<TodoController>()));
  }
}
