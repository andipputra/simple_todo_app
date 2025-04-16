import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/controller/todo_form_controller.dart';

class TodoFormPage extends GetView<TodoFormController> {
  const TodoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isUpdate = Get.arguments != null;

    return Scaffold(
      appBar: AppBar(title:  Text( '${isUpdate ? "Update": "Add"} Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            spacing: 8,
            children: [
              TextField(
                controller: controller.title,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: controller.description,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: controller.date,
                decoration: const InputDecoration(labelText: 'Date'),
                readOnly: true,
                onTap: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (selectedDate != null) {
                    controller.selecDate(selectedDate);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.saveTodo,
        child: const Icon(Icons.save),
      ),
    );
  }
}
