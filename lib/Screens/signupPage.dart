import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Forms/CreditCardForm.dart';

import '../Forms/CoursesForm.dart';
import '../Forms/DocumentForm.dart';
import '../Forms/basicForm.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => SignupPageState();
}

int formnumber = 1;

class SignupPageState extends State<SignupPage> {
  User? user = FirebaseAuth.instance.currentUser;

  StateRefresh() {
    setState(() {
      formnumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 70, 0, 20),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    formnumber = 1;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: formnumber == 1
                                        ? const Color(0xff6f6dd2)
                                        : const Color(0xff9392c3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Arial',
                                          color: formnumber == 1
                                              ? Colors.white
                                              : Colors.white12),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    formnumber = 2;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: formnumber == 2
                                        ? const Color(0xff6f6dd2)
                                        : const Color(0xff9392c3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Arial',
                                          color: formnumber == 2
                                              ? Colors.white
                                              : Colors.white12),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    formnumber = 3;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: formnumber == 3
                                        ? const Color(0xff6f6dd2)
                                        : const Color(0xff9392c3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '3',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Arial',
                                          color: formnumber == 3
                                              ? Colors.white
                                              : Colors.white12),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    formnumber = 4;
                                  });
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: formnumber == 4
                                        ? const Color(0xff6f6dd2)
                                        : const Color(0xff9392c3),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '4',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Arial',
                                          color: formnumber == 4
                                              ? Colors.white
                                              : Colors.white12),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                  ),
                  child: Center(
                    child: Text(
                      formnumber == 1
                          ? 'Basic'
                          : formnumber == 2
                              ? 'Documents'
                              : formnumber == 3
                                  ? 'Course'
                                  : formnumber == 4
                                      ? 'Payment'
                                      : 'Form',
                      style: const TextStyle(
                          fontSize: 40,
                          fontFamily: 'mistral',
                          color: Color(0xff8f77e8)),
                    ),
                  ),
                ),
                formnumber == 1
                    ? BasicForm(
                        notifyParent: StateRefresh,
                      )
                    : formnumber == 2
                        ? DocumentForm(
                            notifyParent: StateRefresh,
                          )
                        : formnumber == 3
                            ? CoursesForm(
                                notifyParent: StateRefresh,
                              )
                            : CreditCard(
                                notifyParent: StateRefresh,
                                Course: SelectedCourse,
                              ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                          color: Color(0xff5b5b5b),
                          fontSize: 15,
                          fontFamily: 'Arial'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        ' Sign In',
                        style: TextStyle(
                            color: Color(0xff6f6dd2),
                            fontSize: 15,
                            fontFamily: 'Arial'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
