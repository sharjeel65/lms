import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lms/SupportiveWidgets.dart/TranscriptApiModel/transcript.dart';

import 'AssignData.dart';

class SubjectsData {
  static subjectData({required var data, required int a}) async {
    List<Subject> subjects = [];
    for (int i = 0; i < data[a.toString()].length; i++) {
      var v = data[a.toString()][i].keys.toString();
      String vafterregex = v.replaceAll(RegExp(r"\p{P}", unicode: true), "");
      String Grade = await AssignData.assignGrades(data: data[a.toString()])[i];
      subjects.add(Subject(
        semesterNo: '-',
        code: await firebaseidcrh(data: data, i: i, a: a, id: true),
        name: await AssignData.assignSubjects(data: data[a.toString()])[i],
        grade: await AssignData.assignGrades(data: data[a.toString()])[i],
        crh: await firebaseidcrh(data: data, i: i, a: a, id: false),
        gradePoint: Grade == 'A+'
            ? 4.0
            : Grade == 'A'
                ? 3.67
                : Grade == 'B+'
                    ? 3.2
                    : Grade == 'B'
                        ? 2.8
                        : Grade == 'C'
                            ? 2.4
                            : Grade == 'D'
                                ? 1.6
                                : Grade == 'E'
                                    ? 1.2
                                    : Grade == 'F'
                                        ? 0.8
                                        : 0,
        SGPA: '',
      ));
    }
    return subjects;
  }

  static firebaseidcrh(
      {required var data,
      required int i,
      required int a,
      required bool id}) async {
    print('here');
    var v = data[a.toString()][i].keys.toString();
    print(v);
    String vafterregex = v.replaceAll(RegExp(r"\p{P}", unicode: true), "");
    DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore
        .instance
        .collection('subjectInfo')
        .doc(vafterregex.toString())
        .get();
    print(doc.data()!.toString());
    return id ? await doc.data()!['id'] : await doc.data()!['credithour'];
  }
}
