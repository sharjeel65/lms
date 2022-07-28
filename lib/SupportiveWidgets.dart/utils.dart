import 'package:intl/intl.dart';
import 'package:lms/SupportiveWidgets.dart/TranscriptApiModel/transcript.dart';

class Utils {
  static formatDate(DateTime date) => DateFormat.yMd().format(date);
  static GetSGPA(Transcript transcript, int s) {
    List Sem = s == 1
        ? transcript.semester1.map((semester) {
            return [
              semester.crh,
              semester.grade,
              semester.gradePoint,
            ];
          }).toList()
        : s == 2
            ? transcript.semester2.map((semester) {
                return [
                  semester.crh,
                  semester.grade,
                  semester.gradePoint,
                ];
              }).toList()
            : s == 3
                ? transcript.semester3.map((semester) {
                    return [
                      semester.crh,
                      semester.grade,
                      semester.gradePoint,
                    ];
                  }).toList()
                : s == 4
                    ? transcript.semester4.map((semester) {
                        return [
                          semester.crh,
                          semester.grade,
                          semester.gradePoint,
                        ];
                      }).toList()
                    : s == 5
                        ? transcript.semester5.map((semester) {
                            return [
                              semester.crh,
                              semester.grade,
                              semester.gradePoint,
                            ];
                          }).toList()
                        : s == 6
                            ? transcript.semester6.map((semester) {
                                return [
                                  semester.crh,
                                  semester.grade,
                                  semester.gradePoint,
                                ];
                              }).toList()
                            : s == 7
                                ? transcript.semester7.map((semester) {
                                    return [
                                      semester.crh,
                                      semester.grade,
                                      semester.gradePoint,
                                    ];
                                  }).toList()
                                : transcript.semester8.map((semester) {
                                    return [
                                      semester.crh,
                                      semester.grade,
                                      semester.gradePoint,
                                    ];
                                  }).toList();
    int crh = 0;
    double score = 0;
    for (int i = 0; i < Sem.length; i++) {
      crh = crh + int.parse(Sem[i][0].toString());
      score = score + Sem[i][2];
    }
    double gpa = score / crh;
    print(gpa);
    return gpa;
  }

  static GetTotalCRH(Transcript transcript) {
    List Sem1 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem2 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem3 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem4 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem5 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem6 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem7 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    List Sem8 = transcript.semester1.map((semester) {
      return [
        semester.crh,
      ];
    }).toList();
    int crh1 = 0;
    int crh2 = 0;
    int crh3 = 0;
    int crh4 = 0;
    int crh5 = 0;
    int crh6 = 0;
    int crh7 = 0;
    int crh8 = 0;
    for (int i = 0; i < Sem1.length; i++) {
      crh1 = crh1 + int.parse(Sem1[i][0].toString());
    }
    for (int i = 0; i < Sem2.length; i++) {
      crh2 = crh2 + int.parse(Sem2[i][0].toString());
    }
    for (int i = 0; i < Sem3.length; i++) {
      crh3 = crh3 + int.parse(Sem3[i][0].toString());
    }
    for (int i = 0; i < Sem4.length; i++) {
      crh4 = crh4 + int.parse(Sem4[i][0].toString());
    }
    for (int i = 0; i < Sem5.length; i++) {
      crh5 = crh5 + int.parse(Sem5[i][0].toString());
    }
    for (int i = 0; i < Sem6.length; i++) {
      crh6 = crh6 + int.parse(Sem6[i][0].toString());
    }
    for (int i = 0; i < Sem7.length; i++) {
      crh7 = crh7 + int.parse(Sem7[i][0].toString());
    }
    for (int i = 0; i < Sem8.length; i++) {
      crh8 = crh8 + int.parse(Sem8[i][0].toString());
    }
    return crh1 + crh2 + crh3 + crh4 + crh5 + crh6 + crh7 + crh8;
  }

  static GetTotalPoints(Transcript transcript) {
    List Sem1 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem2 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem3 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem4 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem5 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem6 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem7 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    List Sem8 = transcript.semester1.map((semester) {
      return [
        semester.gradePoint,
      ];
    }).toList();
    double gradePoint1 = 0;
    double gradePoint2 = 0;
    double gradePoint3 = 0;
    double gradePoint4 = 0;
    double gradePoint5 = 0;
    double gradePoint6 = 0;
    double gradePoint7 = 0;
    double gradePoint8 = 0;
    for (int i = 0; i < Sem1.length; i++) {
      gradePoint1 = gradePoint1 + Sem1[i][0];
    }
    for (int i = 0; i < Sem2.length; i++) {
      gradePoint2 = gradePoint2 + Sem2[i][0];
    }
    for (int i = 0; i < Sem3.length; i++) {
      gradePoint3 = gradePoint3 + Sem3[i][0];
    }
    for (int i = 0; i < Sem4.length; i++) {
      gradePoint4 = gradePoint4 + Sem4[i][0];
    }
    for (int i = 0; i < Sem5.length; i++) {
      gradePoint5 = gradePoint5 + Sem5[i][0];
    }
    for (int i = 0; i < Sem6.length; i++) {
      gradePoint6 = gradePoint6 + Sem6[i][0];
    }
    for (int i = 0; i < Sem7.length; i++) {
      gradePoint7 = gradePoint7 + Sem7[i][0];
    }
    for (int i = 0; i < Sem8.length; i++) {
      gradePoint8 = gradePoint8 + Sem8[i][0];
    }
    return gradePoint1 +
        gradePoint2 +
        gradePoint3 +
        gradePoint4 +
        gradePoint5 +
        gradePoint6 +
        gradePoint7 +
        gradePoint8;
  }
}
