import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 238, 194),
        title: const Text(
          "โปรไฟล์",
          style: TextStyle(fontFamily: "Mali"),
        ),
      ),
    );
  }
}
