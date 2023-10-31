// ignore_for_file: deprecated_member_use, camel_case_types, unused_element

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tractor4you/page/second/Home.dart';
import 'package:url_launcher/url_launcher.dart';

class infoOwner extends StatefulWidget {
  const infoOwner({super.key});

  @override
  State<infoOwner> createState() => _infoOwnerState();
}

class _infoOwnerState extends State<infoOwner> {
  final String _phoneCall = '0980707599';

  void _showDialogReserve(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'คิวที่ ',
            style: TextStyle(fontFamily: "Mali"),
          ),
          content: const Text('ต้องการจองหรือไม่',
              style: TextStyle(fontFamily: "Mali")),
          actions: <Widget>[
            ElevatedButton(
                onPressed: () {
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.success,
                    animType: AnimType.rightSlide,
                    title: 'จองเรียบร้อย',
                    btnCancelOnPress: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const Home();
                        },
                      ));
                    },
                  ).show();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("ยืนยัน")],
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("ยกเลิก")],
                ))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "รายละเอียด",
          style: TextStyle(fontFamily: "Mali"),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(
                      255, 0, 0, 0), // Set the background color for the circle
                  radius: 50,
                  child: Icon(
                    Icons.person, // Example icon (you can use any icon)
                    size: 50, // Adjust the icon size
                    color: Colors.white, // Set the icon color
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Name",
                  style: TextStyle(fontFamily: "Mali", fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 10)),
                    onPressed: () async {
                      final _tel = Uri.parse('tel:$_phoneCall');

                      if (await canLaunchUrl(_tel)) {
                        await launch(_tel.toString());
                      }
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("098-0707599",
                            style: TextStyle(
                                fontFamily: "Mali", color: Colors.black))
                      ],
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 10)),
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Text(
                          "จำนวนคิว : ",
                          style: TextStyle(
                              fontFamily: "Mali", color: Colors.black),
                        )
                      ],
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 10)),
                      backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 144, 238, 145),
                      ),
                      side: MaterialStateProperty.all(
                        const BorderSide(
                          color: Color.fromARGB(
                            255,
                            0,
                            0,
                            0,
                          ), // Set the border color here
                          width: 2.0, // Set the border width
                        ),
                      ),
                    ),
                    onPressed: () {
                      _showDialogReserve(context);
                    },
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "จองคิว",
                            style: TextStyle(
                                fontFamily: "Mali", color: Colors.black),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
