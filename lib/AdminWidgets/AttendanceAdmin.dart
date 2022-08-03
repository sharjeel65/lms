import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/AdminWidgets/AdminDetailDashAttendance.dart';
import 'package:lms/UserdashboardWidgets/DetailAttendance.dart';

class attendanceAdmin extends StatefulWidget {
  late final DocumentSnapshot doc;
  late final String name;
  late final String courseName;
  late final String userid;
  late final String semester;
   attendanceAdmin(
      {Key? key,
        required this.name,
        required this.courseName,
        required this.doc,
        required this.semester,
        required this.userid})
      : super(key: key);

  @override
  State<attendanceAdmin> createState() => _attendanceAdminState();
}

class _attendanceAdminState extends State<attendanceAdmin> {
  @override
  Widget build(BuildContext context) {
    double AttendanceCalculator(DocumentSnapshot doc) {
      int a = 0;
      for (int i = 1; i <= 16; i++) {
        int b = 1;
        a = a + (doc['week $i']['Class $b'] ? 1 : 0);
        a = a + (doc['week $i']['Class ${b + 1}'] ? 1 : 0);
      }
      print(a / 32 * 100);
      return (a / 32) * 100;
    }

    double width = 300 * (AttendanceCalculator(widget.doc) / 100);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AdminDashDetailAttendance(doc: widget.doc,
              semester: widget.semester,
              subject: widget.name,
              coursename: widget.courseName,
              userid: widget.userid,),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
        height: MediaQuery.of(context).size.height / 100 * 8,
        margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('subjectInfo')
                    .doc(widget.name)
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: 100,
                      height: 50,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Container(
                      width: 50,
                      height: 40,
                      child: CachedNetworkImage(
                        fit: BoxFit.contain,
                        imageUrl: snapshot.data!['url'],
                      ),
                    );
                  }
                }),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 12,
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 300,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      Container(
                        width: width,
                        height: 20,
                        decoration: BoxDecoration(
                          color: width < 210
                              ? Colors.red
                              : width <= 240
                              ? Colors.yellow
                              : width > 241
                              ? Colors.green
                              : Colors.yellow,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
