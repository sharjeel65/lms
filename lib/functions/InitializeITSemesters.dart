import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;
Map<String, List> subjects = {
  'subjects1': [
    'ICT',
    'ICT Lab',
    'English Comprehension and Composition',
    'Islamic Studies',
    'Pakistan Studies',
    'Applied Physics',
    'Calculus and Analytical Geometry'
  ],
  'subjects2': [
    'Programming Fundamentals',
    'Discrete Structures',
    'Economics',
    'Communications and Presentation skills',
    'Arabic/Chinese',
    'Programming Fundamentals Lab'
  ],
  'subjects3': [
    'Object Oriented Programming',
    'Computer Networks',
    'Computer Organization and Design',
    'Introduction to Psychology',
    'Computer Networks Lab',
    'Object Oriented Programming Lab',
    'Probability and Statistics'
  ],
  'subjects4': [
    'Data Structures and Algorithms',
    'Data Structures and Algorithms Lab',
    'Database Systems',
    'Database Systems Lab',
    'Software Engineering',
    'Modeling and Simulation',
    'Linear Algebra'
  ],
  'subjects5': [
    'Operating Systems',
    'Operating Systems Lab',
    'Information Security',
    'Web Technologies',
    'Web Technologies Lab',
    'Design and Analysis of Algorithm',
    'Software Requirement Engineering'
  ],
  'subjects6': [
    'System and Network Administration',
    'System and Network Administration Lab',
    'Artificial Intelligence',
    'Enterprise Systems',
    'Principal of Management',
    'Mobile Application Development'
  ],
  'subjects7': [
    'Final Year Project1',
    'Database Admin and Management',
    'Database Admin and Management Lab',
    'Cyber Security',
    'IT Project Management',
    'Data Science'
  ],
  'subjects8': [
    'Final Year Project2',
    'Virtual Systems and Services',
    'Virtual Systems and Services Lab',
    'Technical and Business Writing',
    'Professional Practises',
    'Software Quality Assurance',
    'Social Service'
  ],
};
Map<String, List> crh = {
  'subjects1': [3, 1, 3, 2, 2, 3, 3],
  'subjects2': [3, 3, 3, 3, 2, 1],
  'subjects3': [3, 3, 3, 3, 1, 1, 3],
  'subjects4': [3, 1, 3, 1, 3, 3, 3],
  'subjects5': [3, 1, 3, 3, 1, 3, 3],
  'subjects6': [3, 1, 3, 3, 3, 3],
  'subjects7': [3, 3, 1, 3, 3, 3],
  'subjects8': [3, 3, 1, 3, 3, 3, 3],
};
Map<String, List> id = {
  'subjects1': [
    'GE-161',
    'GE-161-L',
    'GE-162',
    'GE-163',
    'GE-165',
    'MS-151',
    'MS-151'
  ],
  'subjects2': ['CC-112', 'CC-111', 'UE-17X3', 'GE-164', 'UE-17X2', 'CC-112-L'],
  'subjects3': [
    'CC-211',
    'CC-214',
    'EI-231',
    'UE-271',
    'CC-214-L',
    'CC-211-L',
    'MS-251'
  ],
  'subjects4': [
    'CC-213',
    'CC-213-L',
    'CC-215-L',
    'CC-215-L',
    'CC-212',
    'SL-241',
    'MS-252'
  ],
  'subjects5': [
    'CC-311',
    'CC-311-L',
    'CC-312',
    'DI-322',
    'DI-322-L',
    'EI-331',
    'SI-341'
  ],
  'subjects6': ['DI-323', 'DI-323-L', 'EI-326', 'SI-342', 'UE-272', 'EI-333'],
  'subjects7': ['CC-411', 'DI-324', 'DI-324-L', 'DI-325', 'DI-321', 'EI-334'],
  'subjects8': [
    'CC-412',
    'DI-421',
    'DI-421-L',
    'GE-261',
    'GE-166',
    'EI-337',
    'UE-371'
  ]
};

class InitSemesters {
  static Future<void> initializeIT({required userid}) async {
    for (int i = 1; i <= 8; i++) {
      for (int j = 0; j <= subjects['subjects$i']!.length - 1; j++) {
        print('i = $i \n j= $j');
        print('This is semester:$i\n subject number = ${j + 1}\n' +
            subjects['subjects$i']![j]);
        db
            .collection('Courses')
            .doc('Information Technology')
            .collection(userid)
            .doc(i.toString())
            .collection('Attendance')
            .doc(subjects['subjects$i']![j])
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
            .doc(i.toString())
            .collection('Grades')
            .doc(subjects['subjects$i']![j])
            .set({
          'Quizes': {'1': null, '2': null, '3': null, '4': null},
          'Assignments': {'1': null, '2': null, '3': null, '4': null},
          'Presentation': null,
          'Midterm': null,
          'Finalterm': null,
        });
      }
    }
  }

  static Future<void> initializeITInfo() async {
    for (int i = 1; i <= 8; i++) {
      for (int j = 0; j <= subjects['subjects$i']!.length - 1; j++) {
        print('i = $i \n j= $j');
        print('This is semester:$i\n subject number = ${j + 1}\n' +
            subjects['subjects$i']![j]);

        db.collection('subjectInfo').doc(subjects['subjects$i']![j]).set({
          'credithour': crh['subjects$i']![j],
          'url':
              'https://firebasestorage.googleapis.com/v0/b/lmsapp-44b29.appspot.com/o/subjects%2Fbook-stack.png?alt=media&token=e7f6381e-ebb9-47c2-92b4-996ac7d7f079',
          'id': id['subjects$i']![j],
        });
      }
    }
  }
}
