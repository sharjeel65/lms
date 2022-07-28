import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Screens/signupPage.dart';

class CoursesForm extends StatefulWidget {
  final Function() notifyParent;
  const CoursesForm({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<CoursesForm> createState() => _CoursesFormState();
}

String SelectedCourse = '';

class _CoursesFormState extends State<CoursesForm> {
  User? user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String Course1 = 'Information Technology';
  String Course2 = 'Business';
  String Course3 = 'English Literature';

  Future<void> CourseSelect() async {
    if (selectcourse1) {
      SelectedCourse = Course1;
      firestore
          .collection('Courses')
          .doc(Course1)
          .collection(user!.uid)
          .doc('1')
          .set({
        'enrollment': true,
        'verified': false,
        'payment': false,
      });
    } else if (selectcourse2) {
      SelectedCourse = Course2;
      firestore
          .collection('Courses')
          .doc(Course2)
          .collection(user!.uid)
          .doc('1')
          .set({
        'enrollment': true,
        'verified': false,
        'payment': false,
      });
    } else if (selectcourse3) {
      SelectedCourse = Course3;
      firestore
          .collection('Courses')
          .doc(Course3)
          .collection(user!.uid)
          .doc('1')
          .set({
        'enrollment': true,
        'verified': false,
        'payment': false,
      });
    }
  }

  FocusNode focusNode = FocusNode();
  bool course1 = false;
  bool course2 = false;
  bool course3 = false;
  bool selectcourse1 = false;
  bool selectcourse2 = false;
  bool selectcourse3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (!selectcourse1) {
                selectcourse1 = true;
                selectcourse2 = false;
                selectcourse3 = false;
              } else {
                selectcourse1 = false;
                selectcourse2 = false;
                selectcourse3 = false;
              }
            });
          },
          child: Container(
            height: course1 ? 200 : 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: selectcourse1
                  ? Border.all(color: Colors.blueAccent.shade700, width: 4)
                  : Border.all(color: Colors.black12, width: 2),
            ),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: course1
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 270,
                    maxHeight: 190,
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  margin: const EdgeInsets.all(5),
                  child: !course1
                      ? Center(
                          child: Text(
                            Course1,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                            'Introduction to IT will cover content such as:\nGetting Started with IT \nComputer Basics \nNetworking and the Internet \nOperating Systems and Applications \nSoftware Development \nBasics Databases \nCybersecurity',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 35,
                    maxHeight: 35,
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  margin: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (!course1) {
                            course1 = true;
                          } else {
                            course1 = false;
                          }
                        },
                      );
                    },
                    child: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (!selectcourse2) {
                selectcourse1 = false;
                selectcourse2 = true;
                selectcourse3 = false;
              } else {
                selectcourse1 = false;
                selectcourse2 = false;
                selectcourse3 = false;
              }
            });
          },
          child: Container(
            height: course2 ? 200 : 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: selectcourse2
                  ? Border.all(color: Colors.blueAccent.shade700, width: 4)
                  : Border.all(color: Colors.black12, width: 2),
            ),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: course2
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 270,
                    maxHeight: 190,
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  margin: const EdgeInsets.only(left: 10, top: 9),
                  child: !course2
                      ? Center(
                          child: Text(
                            Course2,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                            'Introduction to IT will cover content such as:\nGetting Started with IT \nComputer Basics \nNetworking and the Internet \nOperating Systems and Applications \nSoftware Development \nBasics Databases \nCybersecurity',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 35,
                    maxHeight: 35,
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  margin: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (!course2) {
                            course2 = true;
                          } else {
                            course2 = false;
                          }
                        },
                      );
                    },
                    child: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (!selectcourse3) {
                selectcourse1 = false;
                selectcourse2 = false;
                selectcourse3 = true;
              } else {
                selectcourse1 = false;
                selectcourse2 = false;
                selectcourse3 = false;
              }
            });
          },
          child: Container(
            height: course3 ? 200 : 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: selectcourse3
                  ? Border.all(color: Colors.blueAccent.shade700, width: 4)
                  : Border.all(color: Colors.black12, width: 2),
            ),
            margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: course3
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 270,
                    maxHeight: 190,
                    minWidth: 100,
                    minHeight: 100,
                  ),
                  margin: const EdgeInsets.only(left: 10, top: 9),
                  child: !course3
                      ? Center(
                          child: Text(
                            Course3,
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(top: 15),
                          child: const Text(
                            'Introduction to IT will cover content such as:\nGetting Started with IT \nComputer Basics \nNetworking and the Internet \nOperating Systems and Applications \nSoftware Development \nBasics Databases \nCybersecurity',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                ),
                Container(
                  constraints: const BoxConstraints(
                    maxWidth: 35,
                    maxHeight: 35,
                    minWidth: 10,
                    minHeight: 10,
                  ),
                  margin: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (!course3) {
                            course3 = true;
                          } else {
                            course3 = false;
                          }
                        },
                      );
                    },
                    child: const Icon(
                      Icons.arrow_drop_down_circle_outlined,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (user != null) {
              if (selectcourse1 || selectcourse2 || selectcourse3) {
                await CourseSelect().then((value) => (widget.notifyParent()));
                formnumber = 4;

                print('Going to payment');
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      content: Text('Please select atleast one course'),
                    );
                  },
                );
              }
            } else {
              formnumber--;
              widget.notifyParent();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: 340,
            height: 50,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFC5B7B7),
                  offset: Offset(2, 1),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFF6F6DD2)),
              color: const Color(0xFF6F6DD2),
            ),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
