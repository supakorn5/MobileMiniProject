import 'package:flutter/material.dart';

class ListReserve extends StatefulWidget {
  const ListReserve({Key? key}) : super(key: key);

  @override
  State<ListReserve> createState() => _ListReserveState();
}

class _ListReserveState extends State<ListReserve> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 238, 194),
        title: const Text(
          "ประวัติการจอง",
          style: TextStyle(fontFamily: "Mali"),
        ),
      ),
    );
  }
}
