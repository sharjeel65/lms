import 'package:flutter/material.dart';
import 'package:lms/AdminWidgets/AdminDashGrades.dart';
import 'package:lms/UserdashboardWidgets/UserDashGrades.dart';
class AdminGradesDetails extends StatefulWidget {
  var doc;
   AdminGradesDetails({Key? key, required this.doc}) : super(key: key);

  @override
  State<AdminGradesDetails> createState() => _AdminGradesDetailsState();
}

class _AdminGradesDetailsState extends State<AdminGradesDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: AdminDashGrade(snapshotu: widget.doc,
          )
        ),
      ),
    );
  }
}
