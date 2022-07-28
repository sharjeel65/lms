import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CourseSubjects extends StatelessWidget {
  final String id;
  const CourseSubjects({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Courses').doc(id).get(),
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
            return Container(child: Text((snapshot.data.data()).toString()));
          }
        });
  }
}
