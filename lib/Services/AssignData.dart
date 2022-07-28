class AssignData {
  static assignSubjects({required var data}) {
    List list = data;
    String num = "2";
    List subjects = [];
    for (int i = 0; i < list.length; i++) {
      num = list[i].keys.toString();
      subjects.add(num.replaceAll(RegExp(r"\p{P}", unicode: true), ""));
    }
    return subjects;
  }

  static assignGrades({required var data}) {
    List list = data;
    String num;
    List grades = [];
    for (int i = 0; i < list.length; i++) {
      num = list[i].values.toString();
      grades.add(num.replaceAll(RegExp(r"\p{P}", unicode: true), ""));
    }
    return grades;
  }
}
