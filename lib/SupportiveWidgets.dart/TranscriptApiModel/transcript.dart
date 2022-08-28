import 'package:lms/SupportiveWidgets.dart/TranscriptApiModel/lms.dart';

import 'student.dart';

class Transcript {
  final ProgramInfo Details;
  final LMS lms;
  final Student student;
  final List<Subject> semester1;
  final List<Subject> semester2;
  final List<Subject> semester3;
  final List<Subject> semester4;
  final List<Subject> semester5;
  final List<Subject> semester6;
  final List<Subject> semester7;
  final List<Subject> semester8;

  const Transcript({
    required this.semester2,
    required this.semester3,
    required this.semester4,
    required this.semester5,
    required this.semester6,
    required this.semester7,
    required this.semester8,
    required this.Details,
    required this.lms,
    required this.student,
    required this.semester1,
  });
}

class Subject {
  final String semesterNo;
  final String code;
  final String name;
  final String grade;
  final int crh;
  final num gradePoint;
  final String SGPA;

  const Subject({
    required this.semesterNo,
    required this.code,
    required this.name,
    required this.grade,
    required this.crh,
    required this.gradePoint,
    required this.SGPA,
  });
}

class ProgramInfo {
  final String degree;
  final String program;
  final DateTime date;
  final String major;

  const ProgramInfo({
    required this.degree,
    required this.program,
    required this.date,
    required this.major,
  });
}
