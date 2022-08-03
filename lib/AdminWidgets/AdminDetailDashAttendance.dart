import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDashDetailAttendance extends StatefulWidget {
  final DocumentSnapshot doc;
  final String coursename;
  final String userid;
  final String semester;
  final String subject;
  const AdminDashDetailAttendance({Key? key,  required this.doc,
    required this.coursename,
    required this.userid,
    required this.semester,
    required this.subject}) : super(key: key);

  @override
  State<AdminDashDetailAttendance> createState() => _AdminDashDetailAttendanceState();
}

class _AdminDashDetailAttendanceState extends State<AdminDashDetailAttendance> {
  TextEditingController controller = TextEditingController();

  void dialog(
      {required BuildContext context,
        required GlobalKey<FormState> formKey,
        required path}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Stack(
              children: <Widget>[
                Positioned(
                  right: -40.0,
                  top: -40.0,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.close),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed:  () async {
                          print(
                              'Courses/${widget.coursename}/${widget.userid}/${widget.semester}/Attendance/${widget.subject}/}');
                            await FirebaseFirestore.instance
                                .collection('Courses')
                                .doc(widget.coursename)
                                .collection(widget.userid)
                                .doc(widget.semester)
                                .collection('Attendance')
                                .doc(widget.subject)
                                .update({
                              path: false,
                            });
                            Navigator.pop(context);
                        },
                        child: Text(
                          'Absent'
                        ),)
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text("Present"),
                          onPressed: () async {
                            print(
                                'Courses/${widget.coursename}/${widget.userid}/${widget.semester}/Attendance/${widget.subject}/}');
                              await FirebaseFirestore.instance
                                  .collection('Courses')
                                  .doc(widget.coursename)
                                  .collection(widget.userid)
                                  .doc(widget.semester)
                                  .collection('Attendance')
                                  .doc(widget.subject)
                                  .update({
                                path: true,
                              });
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 18),
        padding: EdgeInsets.all(20),
        color: Colors.white,
        constraints: BoxConstraints(
          minHeight: 100,
          maxWidth: double.maxFinite,
          maxHeight: double.maxFinite,
          minWidth: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 1',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 1']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 1.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 1']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 1.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 2',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 2']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 2.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 2']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 2.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 3',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 3']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 3.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 3']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 3.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 4',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 4']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 4.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 4']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 4.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 5',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 5']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 5.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 5']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 5.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 6',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 6']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 6.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 6']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 6.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 7',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 7']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 7.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 7']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 7.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 8',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 8']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 8.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 8']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 8.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 9',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 9']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 9.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 9']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 9.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 10',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 10']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 10.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 10']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 10.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 11',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 11']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 11.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 11']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 11.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 12',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 12']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 12.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 12']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 12.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 13',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 13']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 13.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 13']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 13.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 14',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 14']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 14.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 14']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 14.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 15',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 15']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 15.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 15']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 15.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Week 16',
                  style: TextStyle(
                    color: Color(0xff969191),
                    fontFamily: 'Arial',
                    fontSize: 20,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.doc['week 16']['Class 1'] ? 'Present ;' : 'Absent ;',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 16.Class 1');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.doc['week 16']['Class 2'] ? 'Present' : 'Absent',
                          style: TextStyle(
                            color: Color(0xff969191),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            dialog(
                                context: context,
                                formKey: _formKey,
                                path: 'week 16.Class 2');
                          },
                          child: Icon(Icons.edit),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
