import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/AdminWidgets/AdminDashAttendance.dart';

import 'UsersDetail.dart';

class Users extends StatelessWidget {
  const Users({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('users').get(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Container(
                  width: 100,
                  height: 100,
                  child: Center(child: CircularProgressIndicator()),
                ),
              );
            } else {
              return SizedBox(
                height: MediaQuery.of(context).size.height / 100 * 78,
                width: double.maxFinite,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.size,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (_) => Center(
                                child: Container(
                                  width: 250,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width: 140,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => AdminGradesDetails(
                                                      doc: snapshot.data.docs[index])));
                                            },
                                            child: Center(
                                              child: Text('Grades'),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 140,
                                          child: ElevatedButton(
                                            onPressed: () { Navigator.of(context).push(MaterialPageRoute(
                                                builder: (context) => AdminDashAttendance(
                                                    doc: snapshot.data.docs[index])));},
                                            child: Center(
                                              child: Text('Attendance'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );

                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(3),
                            width: MediaQuery.of(context).size.width / 100 * 90,
                            height:
                                MediaQuery.of(context).size.height / 100 * 15,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(2, 1),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Department: ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.docs[index]['appliedTo'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Name: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]['nickname'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Gender: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black54,
                                          ),
                                        ),
                                        Text(
                                          snapshot.data.docs[index]['gender']
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Verification: ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.docs[index]['verified']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Date of Birth: ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.docs[index]['dob']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Email: ',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.docs[index]['email']
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            }
          }),
    );
  }
}
