import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:tractor4you/page/fist/login.dart';

class Member extends StatefulWidget {
  const Member({super.key});

  @override
  State<Member> createState() => _MemberState();
}

class _MemberState extends State<Member> {
  final GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: fromkey,
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "สมัครสมาชิก",
                  style: TextStyle(fontSize: 36, fontFamily: "Mali"),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: "ชื่อผู้ใช้งาน",
                    labelStyle:
                        const TextStyle(fontSize: 12, fontFamily: "Mali"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "โปรดกรอกชื่อผู้ใช้";
                    } else if (!RegExp(r'^[a-z A-Z 0-9]').hasMatch(value!)) {
                      return "รูปแบบผิดพลาด";
                    } else {
                      return null;
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                    labelText: "รหัสผ่าน",
                    labelStyle:
                        const TextStyle(fontSize: 12, fontFamily: "Mali"),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "โปรดกรอกรหัสผ่าน";
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "มีบัญชีแล้ว ?",
                      style: TextStyle(fontFamily: "Mali", fontSize: 12),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) {
                              return const Login(); // Return the Login widget
                            },
                          ));
                        },
                        child: const Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 144, 238, 145),
                              fontFamily: "Mali",
                              fontSize: 12),
                        )),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(const Size(300, 50)),
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
                    setState(() {
                      if (fromkey.currentState!.validate()) {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.success,
                          animType: AnimType.rightSlide,
                          title: 'สมัครสมาชิกสำเร็จ',
                          btnOkOnPress: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const Login(); // Navigate to the Home widget
                                },
                              ),
                            );
                          },
                        ).show();
                      } else {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.error,
                          animType: AnimType.rightSlide,
                          title: 'แจ้งเตือน',
                          desc: 'ตรวจสอบชื่อผู้ใช้หรือรหัสผ่านผิด',
                          btnCancelOnPress: () {},
                        ).show();
                      }
                    });
                  },
                  child: const Text(
                    "เข้าสู่ระบบ",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Mali",
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
