import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailGradesAdminDash extends StatefulWidget {
  final DocumentSnapshot doc;
  final String coursename;
  final String userid;
  final String semester;
  final String subject;

  const DetailGradesAdminDash(
      {Key? key,
      required this.doc,
      required this.coursename,
      required this.userid,
      required this.semester,
      required this.subject})
      : super(key: key);

  @override
  State<DetailGradesAdminDash> createState() => _DetailGradesAdminDashState();
}

class _DetailGradesAdminDashState extends State<DetailGradesAdminDash> {
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
                        child: TextFormField(
                          controller: controller,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          child: Text("Submit"),
                          onPressed: () async {
                            print(
                                'Courses/${widget.coursename}/${widget.userid}/${widget.semester}/Grades/${widget.subject}/}');
                            formKey.currentState!.save();
                            if (controller.text.isNotEmpty) {
                              await FirebaseFirestore.instance
                                  .collection('Courses')
                                  .doc(widget.coursename)
                                  .collection(widget.userid)
                                  .doc(widget.semester)
                                  .collection('Grades')
                                  .doc(widget.subject)
                                  .update({
                                path: int.parse(controller.text)
                              });
                            }
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
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 18),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            constraints: BoxConstraints(
              minHeight: 100,
              maxWidth: double.maxFinite,
              maxHeight: double.maxFinite,
              minWidth: 100,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue.withOpacity(0.1)),
                  width: double.maxFinite,
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Assignment 1',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Assignments']['1'].toString(),
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
                                       path: 'Assignments.1');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Assignment 2',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Assignments']['2'].toString(),
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
                                      path: 'Assignments.2');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Assignment 3',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Assignments']['3'].toString(),
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
                                      path: 'Assignments.3');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Assignment 4',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Assignments']['4'].toString(),
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
                                      path: 'Assignments.4');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue.withOpacity(0.1)),
                  width: double.maxFinite,
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Quiz 1',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Quizes']['1'].toString(),
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
                                      path: 'Quizes.1');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Quiz 2',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Quizes']['2'].toString(),
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
                                      path: 'Quizes.2');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Quiz 3',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Quizes']['3'].toString(),
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
                                      path: 'Quizes.3');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Quiz 4',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Quizes']['4'].toString(),
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
                                      path: 'Quizes.4');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.blue.withOpacity(0.1)),
                  width: double.maxFinite,
                  height: 170,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Presentation',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Presentation'].toString(),
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
                                      path: 'Presentation');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'MidTerm',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Midterm'].toString(),
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
                                      path: 'Midterm');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Final Term',
                            style: TextStyle(
                              color: Color(0xff969191),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                widget.doc['Finalterm'].toString(),
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
                                      path: 'Finalterm');
                                },
                                child: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
