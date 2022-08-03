import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'SemesterPayment.dart';
import 'attendance.dart';

class UserDashAttendance extends StatefulWidget {
  var snapshotu;

  UserDashAttendance({Key? key, required this.snapshotu}) : super(key: key);

  @override
  State<UserDashAttendance> createState() => _UserDashAttendanceState();
}

class _UserDashAttendanceState extends State<UserDashAttendance> {
  User? user = FirebaseAuth.instance.currentUser;

  var items = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
  ];
  String dropdown2value = 'Semester 1';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        'Attendance',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: 'Arial',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Less than 70% is shortage',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: 'Arial',
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      width: 110,
                      height: 35,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            offset: Offset(2, 1),
                            blurRadius: 8,
                            spreadRadius: 2,
                          )
                        ],
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // Initial Value
                          value: dropdown2value,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: items.map((String items2) {
                            return DropdownMenuItem(
                              value: items2,
                              child: Text(
                                items2,
                                style: TextStyle(
                                  color: Color(0xff969191),
                                  fontFamily: 'Arial',
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdown2value = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 100 * 64.5,
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('Courses')
                    .doc(widget.snapshotu.data['appliedTo'])
                    .collection(user!.uid)
                    .doc(dropdown2value == 'Semester 1'
                        ? '1'
                        : dropdown2value == 'Semester 2'
                            ? '2'
                            : dropdown2value == 'Semester 3'
                                ? '3'
                                : dropdown2value == 'Semester 4'
                                    ? '4'
                                    : dropdown2value == 'Semester 5'
                                        ? '5'
                                        : dropdown2value == 'Semester 6'
                                            ? '6'
                                            : dropdown2value == 'Semester 7'
                                                ? '7'
                                                : dropdown2value == 'Semester 8'
                                                    ? '8'
                                                    : '')
                    .collection('Attendance')
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return FutureBuilder<DocumentSnapshot>(
                        future: FirebaseFirestore.instance
                            .collection('Courses')
                            .doc(widget.snapshotu.data['appliedTo'])
                            .collection(user!.uid)
                            .doc(dropdown2value == 'Semester 1'
                                ? '1'
                                : dropdown2value == 'Semester 2'
                                    ? '2'
                                    : dropdown2value == 'Semester 3'
                                        ? '3'
                                        : dropdown2value == 'Semester 4'
                                            ? '4'
                                            : dropdown2value == 'Semester 5'
                                                ? '5'
                                                : dropdown2value == 'Semester 6'
                                                    ? '6'
                                                    : dropdown2value ==
                                                            'Semester 7'
                                                        ? '7'
                                                        : dropdown2value ==
                                                                'Semester 8'
                                                            ? '8'
                                                            : '')
                            .get(),
                        builder: (context, values) {
                          if (values.hasData) {
                            var data = values.data!;
                            print('${widget.snapshotu.data['appliedTo']}'
                                '${snapshot.data.docs[0].id}');
                            if (data['enrollment'] == true &&
                                data['payment'] == true) {
                              return ListView.builder(
                                  itemCount: snapshot.data.docs.length,
                                  itemBuilder: (context, index) {
                                    return attendance(
                                      name: snapshot.data.docs[index].id,
                                      courseName:
                                          widget.snapshotu.data['appliedTo'],
                                      doc: snapshot.data.docs[index],
                                    );
                                  });
                            } else {
                              return Center(
                                child: Container(
                                  width: 250,
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                            'Please enroll or pay semester fee'),
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SemesterPayment(
                                                        Course: widget.snapshotu
                                                            .data['appliedTo'],
                                                        semester: dropdown2value ==
                                                                'Semester 1'
                                                            ? '1'
                                                            : dropdown2value ==
                                                                    'Semester 2'
                                                                ? '2'
                                                                : dropdown2value ==
                                                                        'Semester 3'
                                                                    ? '3'
                                                                    : dropdown2value ==
                                                                            'Semester 4'
                                                                        ? '4'
                                                                        : dropdown2value ==
                                                                                'Semester 5'
                                                                            ? '5'
                                                                            : dropdown2value == 'Semester 6'
                                                                                ? '6'
                                                                                : dropdown2value == 'Semester 7'
                                                                                    ? '7'
                                                                                    : dropdown2value == 'Semester 8'
                                                                                        ? '8'
                                                                                        : ''),
                                              ),
                                            );
                                          },
                                          child: Text('Enroll')),
                                    ],
                                  ),
                                ),
                              );
                            }
                          } else {
                            return Container();
                          }
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
