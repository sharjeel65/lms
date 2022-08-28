import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/AdminWidgets/DetailGradesAdminDash.dart';
import 'package:lms/UserdashboardWidgets/DetailGrade.dart';

class GradesAdmin extends StatefulWidget {
  late final DocumentSnapshot doc;
  late final String name;
  late final String courseName;
  late final String userid;
  late final String semester;

  GradesAdmin(
      {Key? key,
      required this.name,
      required this.courseName,
      required this.doc,
      required this.semester,
      required this.userid})
      : super(key: key);

  @override
  State<GradesAdmin> createState() => _GradesAdminState();
}

class _GradesAdminState extends State<GradesAdmin> {
  @override
  Widget build(BuildContext context) {
    String gradeCalculator(DocumentSnapshot doc) {
      int Quiz1 = doc['Quizes'][1] ?? 0;
      int Quiz2 = doc['Quizes'][2] ?? 0;
      int Quiz3 = doc['Quizes'][3] ?? 0;
      int Quiz4 = doc['Quizes'][4] ?? 0;
      int Assignment1 = doc['Assignments'][1] ?? 0;
      int Assignment2 = doc['Assignments'][2] ?? 0;
      int Assignment3 = doc['Assignments'][3] ?? 0;
      int Assignment4 = doc['Assignments'][4] ?? 0;
      int presentation = doc['Presentation'] ?? 0;
      int midterm = doc['Midterm'] ?? 0;
      int finalterm = doc['Finalterm'] ?? 0;
      int AllQuizes = Quiz1 + Quiz2 + Quiz3 + Quiz4;
      int AllAssignment = Assignment1 + Assignment2 + Assignment3 + Assignment4;
      double Grade = (AllAssignment/100*10) +
          (AllQuizes / 100*10) +
          (midterm / 100*25) +
          (finalterm / 100*50) +
          presentation/100*5;
      return Grade > 90
          ? 'A+'
          : Grade > 80 && Grade < 90
              ? 'A'
              : Grade > 70 && Grade < 80
                  ? 'B+'
                  : Grade > 60 && Grade < 70
                      ? 'B'
                      : Grade > 50 && Grade < 60
                          ? 'C'
                          : Grade > 40 && Grade < 50
                              ? 'D'
                              : Grade > 40 && Grade < 50
                                  ? 'E'
                                  : 'F';
    }

    Map Assignments = widget.doc['Assignments'];
    Map Quizes = widget.doc['Quizes'];
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailGradesAdminDash(
              doc: widget.doc,
              semester: widget.semester,
              subject: widget.name,
              coursename: widget.courseName,
              userid: widget.userid,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        height: MediaQuery.of(context).size.height / 100 * 12,
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
          children: [
            FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('subjectInfo')
                    .doc(widget.name)
                    .get(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      width: 50,
                      height: 40,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else {
                    return Container(
                      width: 50,
                      height: 40,
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data!['url'],
                      ),
                    );
                  }
                }),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 12,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          Assignments["1"] == null &&
                                  Assignments["2"] == null &&
                                  Assignments["3"] == null &&
                                  Assignments["4"] == null
                              ? 'No Assignments Found;'
                              : 'A1: ${Assignments["1"]},A2: ${Assignments["2"]},A3: ${Assignments["3"]},A4: ${Assignments["4"]};',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 20,
                            maxWidth: 180,
                            maxHeight: 30,
                            minHeight: 10,
                          ),
                          child: Text(
                            Quizes["1"] == null &&
                                    Quizes["2"] == null &&
                                    Quizes["3"] == null &&
                                    Quizes["4"] == null
                                ? '\tNo Quizes Found;'
                                : 'Q1: ${Quizes["1"]},Q2: ${Quizes["2"]},Q3: ${Quizes["3"]},Q4: ${Quizes["4"]};',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Grade: ${gradeCalculator(widget.doc)}',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 12,
                          ),
                        ),
                        gradeCalculator(widget.doc) == 'F'
                            ? Icon(
                                Icons.warning_rounded,
                                color: Colors.red.withOpacity(0.4),
                              )
                            : gradeCalculator(widget.doc) == 'E'
                                ? Icon(
                                    Icons.warning_rounded,
                                    color: Colors.yellow.withOpacity(0.4),
                                  )
                                : gradeCalculator(widget.doc) == 'D'
                                    ? Icon(
                                        Icons.warning_rounded,
                                        color: Colors.green.withOpacity(0.4),
                                      )
                                    : Container(),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
