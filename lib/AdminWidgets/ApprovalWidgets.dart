import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:lms/SupportiveWidgets.dart/ImageViewer.dart';
import 'package:lms/functions/InitializeITSemesters.dart';

import '../functions/InitializeStudentAttendance.dart';
import '../functions/InitializeStudentGrades.dart';

class Approvals extends StatefulWidget {
  const Approvals({Key? key}) : super(key: key);

  @override
  State<Approvals> createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  Future<String> getuseremail(AsyncSnapshot snapshot, int index) async {
    late String string;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(snapshot.data!.docs[index].id)
        .get()
        .then((value) => (string = value.data()!['email']))
        .then((value) => print(string));
    return string;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .where('verified', isEqualTo: false)
              .get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 100 * 78,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(20),
                      width: 100,
                      height: 300,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: Offset(2, 1),
                              blurRadius: 8,
                              spreadRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(snapshot.data!.docs[index]['email'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                )),
                            Text(
                                'User Id: ${snapshot.data!.docs[index]['uid']}',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                )),
                            Text(snapshot.data!.docs[index]['nickname'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                )),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ImageViewer(
                                              url: snapshot.data!.docs[index]
                                                  ['1']),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                      margin: EdgeInsets.all(10),
                                      width: 100,
                                      height: 150,
                                      child: Image.network(
                                        snapshot.data!.docs[index]['1'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ImageViewer(
                                            url: snapshot.data!.docs[index]
                                                ['2'],
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                      margin: EdgeInsets.all(10),
                                      width: 100,
                                      height: 150,
                                      child: Image.network(
                                        snapshot.data!.docs[index]['2'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) => ImageViewer(
                                                  url: snapshot.data!
                                                      .docs[index]['3'])));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                      margin: EdgeInsets.all(10),
                                      width: 100,
                                      height: 150,
                                      child: Image.network(
                                        snapshot.data!.docs[index]['3'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(snapshot.data!.docs[index].id)
                                        .get()
                                        .then((value) {
                                      String course =
                                          value.data()!['appliedTo'];
                                      print(course);
                                      if (course == 'Information Technology') {
                                        InitSemesters.initializeIT(
                                            userid:
                                                snapshot.data!.docs[index].id);
                                      } else if (course == 'Business') {
                                        InitStudentAttendance
                                            .initializeBusinessAttendance(
                                                userid: snapshot
                                                    .data!.docs[index].id);
                                        InitStudentGrades
                                            .initializeBusinessGrade(
                                                userid: snapshot
                                                    .data!.docs[index].id);
                                      } else if (course ==
                                          'English Literature') {
                                        InitStudentAttendance
                                            .initializeEnglishLiteratureAttendance(
                                                userid: snapshot
                                                    .data!.docs[index].id);
                                        InitStudentGrades
                                            .initializeEnglishLiteratureGrade(
                                                userid: snapshot
                                                    .data!.docs[index].id);
                                      }
                                      print(course);
                                    });

                                    String emailto =
                                        await getuseremail(snapshot, index);
                                    final Email sendEmailVerified = Email(
                                      body:
                                          'Your profile has been verified. \n Thank You \n LMS ',
                                      subject: ' Verification for LMS',
                                      recipients: [emailto],
                                      isHTML: false,
                                    );
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(snapshot.data!.docs[index].id)
                                          .update({'verified': true});
                                    });
                                    await FlutterEmailSender.send(
                                        sendEmailVerified);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: const Color(0xFF6F6DD2)),
                                      color: const Color(0xFF6F6DD2),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Verify Profile',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    String emailto =
                                        await getuseremail(snapshot, index);
                                    final Email sendEmailVerified = Email(
                                      body:
                                          'Your profile has been declines. \n Thank You \n LMS ',
                                      subject: ' Verification for LMS Declines',
                                      recipients: [emailto],
                                      isHTML: false,
                                    );
                                    setState(() {
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(snapshot.data!.docs[index].id)
                                          .update({'verified': false});
                                    });
                                    print(getuseremail(snapshot, index)
                                        .toString());
                                    await FlutterEmailSender.send(
                                        sendEmailVerified);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 30),
                                    width: 130,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Colors.red),
                                      color: Colors.red,
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Decline Profile',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
              //return Text(snapshot.data.docs[0].id);
            }
          }),
    );
  }
}
