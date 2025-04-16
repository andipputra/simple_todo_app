import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_todo_app/presentation/controller/todo_form_controller.dart';

class TodoFormPage extends GetView<TodoFormController> {
  const TodoFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
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
