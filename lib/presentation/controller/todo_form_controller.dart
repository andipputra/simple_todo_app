import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:simple_todo_app/data/model/todo.dart';
import 'package:simple_todo_app/presentation/controller/todo_controller.dart';
import 'package:uuid/uuid.dart';

class TodoFormController extends GetxController {
  final TodoController todoController;
  TodoFormController(this.todoController);

  late TextEditingController title, description, date;
  final selectedDate = Rx<DateTime>(DateTime.now());

  final formKey = GlobalKey<FormState>();
  final isFormLoading = false.obs;

  Todo? initialTodo;

  @override
  void onInit() {
    super.onInit();

    isFormLoading.value = true;

    final argument = Get.arguments;

    if (argument != null && argument is Todo) {
      initialTodo = argument;
    }

    title = TextEditingController(text: initialTodo?.title);
    description = TextEditingController(text: initialTodo?.description);

    selectedDate.value = initialTodo?.todoDate ?? DateTime.now();
    date = TextEditingController(
      text: DateFormat('dd MMMM yyyy').format(selectedDate.value),
    );

    isFormLoading.value = false;
  }

  @override
  void dispose() {
    super.dispose();
    title.dispose();
    description.dispose();
    date.dispose();
  }

  selecDate(DateTime selectedDateTime) async {
    selectedDate.value = selectedDateTime;
    date.text = DateFormat('dd MMMM yyyy').format(selectedDate.value);
  }

  Future<void> saveTodo() async {
    isFormLoading.value = true;

    var uuid = Uuid();
    final todo = Todo(
      id: initialTodo?.id ?? uuid.v4(),
      title: title.text,
      createdAt: initialTodo?.createdAt ?? DateTime.now(),
      todoDate: selectedDate.value,
      description: description.text,
      updatedAt: DateTime.now(),
    );
    if (initialTodo == null) {
      await todoController.addTodo(todo);
    } else {
      await todoController.updateTodo(todo);
    }
    isFormLoading.value = false;
    Get.back();
  }
}
