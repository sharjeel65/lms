import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CalculateMarks {
  static late Map<String, List> grades = {};
  static late Map<dynamic, dynamic> semesters;
  static late var allData;
  static Semesters(
      {required AsyncSnapshot snapshotu, required User? user}) async {
    for (int i = 1; i <= 8; i++) {
      var snapshot = await FirebaseFirestore.instance
          .collection('Courses')
          .doc(snapshotu.data['appliedTo'])
          .collection(user!.uid)
          .doc(i.toString())
          .collection('Grades')
          .get();
      // grades[snapshot.docs[i].id] = grade(snapshot.docs[i]);
      final allData = snapshot.docs.map(
        (doc) => {doc.id: grade(doc)},
      );
      grades[i.toString()] = allData.toList();
    }
    return grades;
  }
/*
  static Calculate({required AsyncSnapshot snapshot}) {
    for (int i = 1; i < snapshot.data.docs.length; i++) {
      grades[snapshot.data.docs[i].id] = grade(snapshot.data.docs[i]);
    }
    print(grades);
    return grades;
  }*/

  static String grade(DocumentSnapshot doc) {
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
    double Grade = (AllAssignment / 4) +
        (AllQuizes / 4) +
        (midterm / 4) +
        (finalterm / 2) +
        presentation;
    return Grade > 90 && Grade < 100
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
}
