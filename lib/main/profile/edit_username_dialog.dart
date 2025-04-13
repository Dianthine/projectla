import 'package:flutter/material.dart';

class EditUsernameDialog extends StatelessWidget {
  final TextEditingController controller;  // Untuk mengelola inputan username

  // Konstruktor untuk menerima controller
  const EditUsernameDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Edit Username"),  // Judul dialog
      content: TextField(
        controller: controller,  // Menggunakan controller untuk mengelola input
        decoration: const InputDecoration(hintText: 'Enter new username'),  // Placeholder
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);  // Menutup dialog tanpa menyimpan
          },
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            // Aksi untuk menyimpan perubahan
            Navigator.pop(context);  // Menutup dialog setelah menyimpan
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
