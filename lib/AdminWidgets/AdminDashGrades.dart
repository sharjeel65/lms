import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'GradesAdmin.dart';

class AdminDashGrade extends StatefulWidget {
  var snapshotu;

  AdminDashGrade({Key? key, required this.snapshotu}) : super(key: key);

  @override
  State<AdminDashGrade> createState() => _AdminDashGradeState();
}

class _AdminDashGradeState extends State<AdminDashGrade> {
  @override
  initState() {
    super.initState();
  }

  String dropdownvalue = 'Semester 1';
  User? user = FirebaseAuth.instance.currentUser;

  // List of items in our dropdown menu
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Grades',
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
                        'A+ = 80 to 90 percent;\t',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: 'Arial',
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        '\tF = fail',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.6),
                          fontFamily: 'Arial',
                          fontSize: 14,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: Offset(2, 1),
                      blurRadius: 8,
                      spreadRadius: 2,
                    )
                  ],
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 110,
                      height: 19,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),
                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(
                                items,
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
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 100 * 100,
            child: FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('Courses')
                    .doc(widget.snapshotu['appliedTo'])
                    .collection(widget.snapshotu.id)
                    .doc(dropdownvalue == 'Semester 1'
                        ? '1'
                        : dropdownvalue == 'Semester 2'
                            ? '2'
                            : dropdownvalue == 'Semester 3'
                                ? '3'
                                : dropdownvalue == 'Semester 4'
                                    ? '4'
                                    : dropdownvalue == 'Semester 5'
                                        ? '5'
                                        : dropdownvalue == 'Semester 6'
                                            ? '6'
                                            : dropdownvalue == 'Semester 7'
                                                ? '7'
                                                : dropdownvalue == 'Semester 8'
                                                    ? '8'
                                                    : '')
                    .collection('Grades')
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: 100,
                      height: 100,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return GradesAdmin(
                            name: snapshot.data.docs[index].id,
                            courseName: widget.snapshotu['appliedTo'],
                            doc: snapshot.data.docs[index],
                            semester: dropdownvalue == 'Semester 1'
                                ? '1'
                                : dropdownvalue == 'Semester 2'
                                    ? '2'
                                    : dropdownvalue == 'Semester 3'
                                        ? '3'
                                        : dropdownvalue == 'Semester 4'
                                            ? '4'
                                            : dropdownvalue == 'Semester 5'
                                                ? '5'
                                                : dropdownvalue == 'Semester 6'
                                                    ? '6'
                                                    : dropdownvalue ==
                                                            'Semester 7'
                                                        ? '7'
                                                        : dropdownvalue ==
                                                                'Semester 8'
                                                            ? '8'
                                                            : '',
                            userid: widget.snapshotu.id,
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
