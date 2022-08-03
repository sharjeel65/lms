import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Screens/loginPage.dart';
import 'package:lms/Services/CalculateMarks.dart';
import 'package:lms/UserdashboardWidgets/UserDashAttendance.dart';
import 'package:lms/UserdashboardWidgets/UserDashGrades.dart';
import 'package:lms/UserdashboardWidgets/userInfo.dart';

import '../Services/SubjectsData.dart';
import '../SupportiveWidgets.dart/PdfApi.dart';
import '../SupportiveWidgets.dart/PdfTranscriptapi.dart';
import '../SupportiveWidgets.dart/TranscriptApiModel/customer.dart';
import '../SupportiveWidgets.dart/TranscriptApiModel/supplier.dart';
import '../SupportiveWidgets.dart/TranscriptApiModel/transcript.dart';

class userDashboard extends StatefulWidget {
  const userDashboard({Key? key}) : super(key: key);

  @override
  State<userDashboard> createState() => _userDashboardState();
}

class _userDashboardState extends State<userDashboard> {
  bool _loading = false;
  User? user = FirebaseAuth.instance.currentUser;

// Initial Selected Value
  String dropdownvalue = 'Semester 1';

  // List of items in our dropdown menu
  bool _Grades = false;
  bool _transcript = false;
  bool _Attendance = true;
  bool _setting = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: UserProfile(),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _Grades = false;
                          _transcript = false;
                          _Attendance = true;
                          _setting = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _Attendance
                                ? Colors.blue.shade200
                                : Colors.blue.withOpacity(0.1)),
                        child: Center(
                          child: Center(
                              child: Text(
                            'Attendance',
                            style:
                                TextStyle(fontSize: 15, color: Colors.purple),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _Grades = true;
                          _transcript = false;
                          _Attendance = false;
                          _setting = false;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _Grades
                                ? Colors.blue.shade200
                                : Colors.blue.withOpacity(0.1)),
                        child: Center(
                          child: Center(
                              child: Text(
                            'Grades',
                            style:
                                TextStyle(fontSize: 15, color: Colors.purple),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            _Grades = false;
                            _transcript = true;
                            _Attendance = false;
                            _setting = false;
                          },
                        );
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _transcript
                                ? Colors.blue.shade200
                                : Colors.blue.withOpacity(0.1)),
                        child: Center(
                          child: Center(
                              child: Text(
                            'Transcript',
                            style:
                                TextStyle(fontSize: 15, color: Colors.purple),
                          )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _Grades = false;
                          _transcript = false;
                          _Attendance = false;
                          _setting = true;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        margin: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: _setting
                              ? Colors.blue.shade200
                              : Colors.blue.withOpacity(0.1),
                        ),
                        child: Center(
                            child: Text(
                          'Settings',
                          style: TextStyle(fontSize: 15, color: Colors.purple),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(user?.uid)
                      .get(),
                  builder: (context, AsyncSnapshot snapshotu) {
                    if (snapshotu.connectionState == ConnectionState.waiting) {
                      return Container();
                    } else {
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        _Grades
                            ? Flexible(
                                fit: FlexFit.loose,
                                child: UserDashGrade(
                                  snapshotu: snapshotu,
                                ),
                              )
                            : _Attendance
                                ? Flexible(
                                    fit: FlexFit.loose,
                                    child: UserDashAttendance(
                                      snapshotu: snapshotu,
                                    ),
                                  )
                                : _transcript
                                    ? Flexible(
                                        fit: FlexFit.loose,
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              100 *
                                              77,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Center(
                                            child: Container(
                                              width: 150,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey.shade300,
                                                    offset: Offset(2, 1),
                                                    blurRadius: 8,
                                                    spreadRadius: 2,
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),
                                              child: GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    _loading = true;
                                                  });
                                                  final date = DateTime.now();
                                                  var data =
                                                      await CalculateMarks
                                                          .Semesters(
                                                              snapshotu:
                                                                  snapshotu,
                                                              user: user);
                                                  List<Subject> subjects1 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 1);
                                                  List<Subject> subjects2 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 2);
                                                  List<Subject> subjects3 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 3);
                                                  List<Subject> subjects4 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 4);
                                                  List<Subject> subjects5 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 5);
                                                  List<Subject> subjects6 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 6);
                                                  List<Subject> subjects7 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 7);
                                                  List<Subject> subjects8 =
                                                      await SubjectsData
                                                          .subjectData(
                                                              data: data, a: 8);
                                                  final invoice = Transcript(
                                                    lms: LMS(
                                                      name:
                                                          'Learning Managemnt System',
                                                      address:
                                                          'Address of LMS, Categor, Playstore',
                                                    ),
                                                    student: Student(
                                                      name: snapshotu
                                                          .data['nickname'],
                                                      gender: 'Male',
                                                      dob: '24/12/1999',
                                                      id: snapshotu.data['uid'],
                                                    ),
                                                    Details: ProgramInfo(
                                                      date: date,
                                                      major: snapshotu
                                                          .data['appliedTo'],
                                                      degree:
                                                          'Computer Science',
                                                      program: 'Full-time',
                                                    ),
                                                    semester1: subjects1,
                                                    semester2: subjects2,
                                                    semester3: subjects3,
                                                    semester4: subjects4,
                                                    semester5: subjects5,
                                                    semester6: subjects6,
                                                    semester7: subjects7,
                                                    semester8: subjects8,
                                                  );
                                                  final pdfFile =
                                                      await pdfTranscriptApi
                                                          .generate(invoice);
                                                  setState(() {
                                                    _loading = false;
                                                  });
                                                  PdfApi.openFile(pdfFile);
                                                },
                                                child: !_loading
                                                    ? Center(
                                                        child: Text(
                                                            'Generate PDF'),
                                                      )
                                                    : Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : _setting
                                        ? Flexible(
                                            fit: FlexFit.loose,
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  100 *
                                                  77,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Center(
                                                child: Container(
                                                  width: 150,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors
                                                            .grey.shade300,
                                                        offset: Offset(2, 1),
                                                        blurRadius: 8,
                                                        spreadRadius: 2,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.white,
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await FirebaseAuth
                                                          .instance
                                                          .signOut()
                                                          .then((value) {
                                                        Navigator.of(context)
                                                            .pushReplacement(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            LoginPage()));
                                                      });
                                                    },
                                                    child: const Center(
                                                      child: Text('Log Out'),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : Container()
                      ]);
                    }
                  }),
            )
          ]),
    );
  }
}
