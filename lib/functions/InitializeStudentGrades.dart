import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class InitStudentGrades {
  static Future<void> initializeITGrade({required userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Compulsory')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Advanced')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Basic Computer')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Self Learning Skill')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
  }

  static Future<void> initializeBusinessGrade({required userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Compulsory')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Advanced')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Basic Computer')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Self Learning Skill')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
  }

  static Future<void> initializeEnglishLiteratureGrade(
      {required userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Compulsory')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('English Advanced')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Basic Computer')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Grades')
        .doc('Self Learning Skill')
        .set({
      'Quizes': {'1': null, '2': null, '3': null, '4': null},
      'Assignments': {'1': null, '2': null, '3': null, '4': null},
      'Presentation': null,
      'Midterm': null,
      'Finalterm': null,
    });
  }
}
