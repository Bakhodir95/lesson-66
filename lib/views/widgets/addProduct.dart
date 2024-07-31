import 'package:flutter/material.dart';

class Addproduct extends StatefulWidget {
  const Addproduct({super.key});

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add product"),
      content: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null) {
                return "title";
              } else {
                return null;
              }
            },
          )
        ],
      ),
    );
  }
}
