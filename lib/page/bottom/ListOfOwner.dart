import 'package:flutter/material.dart';
import 'package:tractor4you/page/second/info/infoOwner.dart';

class ListOfOwner extends StatefulWidget {
  const ListOfOwner({super.key, Key? keys});

  @override
  State<ListOfOwner> createState() => _ListOfOwnerState();
}

Widget cardOwner(BuildContext context) {
  return Card(
    elevation: 10,
    child: Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const Icon(
                Icons.person,
                size: 50,
              ),
              subtitle: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Manee",
                    style: TextStyle(fontFamily: "Mali"),
                  ),
                  Text("500/ไร่", style: TextStyle(fontFamily: "Mali")),
                  Text("จำนวนคิว 3", style: TextStyle(fontFamily: "Mali"))
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const infoOwner(); // Return the infoOwner widget
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    ),
  );
}

class _ListOfOwnerState extends State<ListOfOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 202, 238, 194),
        title: const Text(
          "รายชื่อของเจ้าของรถไถ",
          style: TextStyle(fontFamily: "Mali"),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [cardOwner(context)],
            ),
          ),
        ),
      ),
    );
  }
}
