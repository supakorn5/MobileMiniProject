// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tractor4you/page/bottom/ListReserve.dart';
import 'package:tractor4you/page/bottom/profile.dart';
import 'package:tractor4you/page/bottom/ListOfOwner.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _SelectPageState();
}

class _SelectPageState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ListOfOwner(),
    const ListReserve(),
    const profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 202, 238, 194),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 202, 238, 194),
            color: Colors.black,
            activeColor: Colors.black,
            gap: 8,
            onTabChange: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.person_pin_rounded,
                text: "เจ้าของรถไถ",
                textStyle: TextStyle(
                  fontFamily: "Mali",
                  color: Colors.black,
                ),
              ),
              GButton(
                icon: Icons.history_edu,
                text: "ประวัติ",
                textStyle: TextStyle(
                  fontFamily: "Mali",
                  color: Colors.black,
                ),
              ),
              GButton(
                icon: Icons.person,
                text: "โปรไฟล์",
                textStyle: TextStyle(
                  fontFamily: "Mali",
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
