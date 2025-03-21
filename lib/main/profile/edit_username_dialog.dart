import 'package:flutter/material.dart';

void showEditUsernameDialog(BuildContext context, TextEditingController controller, Null Function() param2) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Edit Username"),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: "Enter new username"),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      );
    },
  );
}
