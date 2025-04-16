import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/binding/todo_form_binding.dart';
import 'package:simple_todo_app/presentation/controller/todo_controller.dart';
import 'package:simple_todo_app/presentation/pages/todo_form/todo_form_page.dart';

class HomePage extends GetView<TodoController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Todo App')),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            final todo = controller.todos[index];
            return ListTile(
              title: Text(todo.title),
              trailing: Checkbox(
                value: todo.worked,
                onChanged: (value) {
                  if (value != null) {
                    final newTodo = todo.copyWith(
                      worked: value,
                      updatedAt: DateTime.now(),
                    );
                    controller.updateTodo(newTodo);
                  }
                },
              ),
              onTap: () {
                Get.to(
                  () => TodoFormPage(),
                  arguments: todo,
                  binding: TodoFormBinding(),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => TodoFormPage(), binding: TodoFormBinding());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
