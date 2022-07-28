import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class InitStudentAttendance {
  static Future<void> initializeITAttendance({required userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Compulsory')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Advanced')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Basic Computer')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Self Learning Skill')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
  }

  static Future<void> initializeBusinessAttendance({userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Compulsory')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Advanced')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Basic Computer')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Self Learning Skill')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
  }

  static Future<void> initializeEnglishLiteratureAttendance(
      {required userid}) async {
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Compulsory')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('English Advanced')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Basic Computer')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
    db
        .collection('Courses')
        .doc('Information Technology')
        .collection(userid)
        .doc('1')
        .collection('Attendance')
        .doc('Self Learning Skill')
        .set({
      'week 1': {'Class 1': false, 'Class 2': false},
      'week 2': {'Class 1': false, 'Class 2': false},
      'week 3': {'Class 1': false, 'Class 2': false},
      'week 4': {'Class 1': false, 'Class 2': false},
      'week 5': {'Class 1': false, 'Class 2': false},
      'week 6': {'Class 1': false, 'Class 2': false},
      'week 7': {'Class 1': false, 'Class 2': false},
      'week 8': {'Class 1': false, 'Class 2': false},
      'week 9': {'Class 1': false, 'Class 2': false},
      'week 10': {'Class 1': false, 'Class 2': false},
      'week 11': {'Class 1': false, 'Class 2': false},
      'week 12': {'Class 1': false, 'Class 2': false},
      'week 13': {'Class 1': false, 'Class 2': false},
      'week 14': {'Class 1': false, 'Class 2': false},
      'week 15': {'Class 1': false, 'Class 2': false},
      'week 16': {'Class 1': false, 'Class 2': false},
    });
  }
}
