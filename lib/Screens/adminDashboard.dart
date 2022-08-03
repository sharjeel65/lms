import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lms/AdminWidgets/AllSubjects.dart';
import 'package:lms/AdminWidgets/CoursesWidget.dart';

import '../AdminWidgets/ApprovalWidgets.dart';
import '../Services/validation.dart';
import '../functions/StringProcess.dart';
import 'loginPage.dart';

class adminDashboard extends StatefulWidget {
  const adminDashboard({Key? key}) : super(key: key);

  @override
  State<adminDashboard> createState() => _adminDashboardState();
}

late String url;

class _adminDashboardState extends State<adminDashboard> {
  Future<void> uploadimage(File path) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('subjects/${_NameTextController.text}');
    UploadTask uploadTask = ref.putFile(path);
    uploadTask.then((res) async {
      url = await res.ref.getDownloadURL();
      if (kDebugMode) {
        print('this is url$url');
      }
    }).then(
      (value) => (FirebaseFirestore.instance
          .collection('subjectInfo')
          .doc(_NameTextController.text)
          .set({'url': url, 'creditHour': _ChTextController.text})),
    );
  }

  dynamic imagePath;
  bool imageBool = false;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _NameTextController = TextEditingController();
  final TextEditingController _ChTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  User? user = FirebaseAuth.instance.currentUser;
  bool approval = false;
  bool courses = false;
  bool subjects = false;
  bool settings = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 17),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      constraints: BoxConstraints(
                          minWidth: 30,
                          maxWidth: 200,
                          minHeight: 30,
                          maxHeight: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello ',
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.7),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '${user!.displayName?.toUpperCase()}',
                            style: TextStyle(
                              color: Color(0xff5670F0),
                              fontFamily: 'Arial',
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 38),
                      child: CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(user!.photoURL!),
                        maxRadius: 30,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        StringProcess.stringProcess(user?.uid),
                        style: TextStyle(
                          color: Color(0xff5670F0),
                          fontFamily: 'Arial',
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(6),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        approval = true;
                        courses = false;
                        subjects = false;
                        settings = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: approval
                            ? Colors.blue.shade200
                            : Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                                child: Text(
                              'Approvals',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.purple),
                            )),
                            FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('users')
                                    .where('verified', isEqualTo: false)
                                    .get(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                    );
                                  } else {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                      child: Center(
                                          child: Text(snapshot.data.docs.length
                                              .toString())),
                                    );
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        approval = false;
                        courses = true;
                        subjects = false;
                        settings = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 90,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                        color: courses
                            ? Colors.blue.shade200
                            : Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Text(
                                'Courses',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.purple),
                              ),
                            ),
                            FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('Courses')
                                    .get(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                    );
                                  } else {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                      child: Center(
                                          child: Text(snapshot.data.docs.length
                                              .toString())),
                                    );
                                  }
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        approval = false;
                        courses = false;
                        subjects = true;
                        settings = false;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: subjects
                            ? Colors.blue.shade200
                            : Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                                child: Text(
                              'Subjects',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.purple),
                            )),
                            FutureBuilder(
                                future: FirebaseFirestore.instance
                                    .collection('subjectInfo')
                                    .get(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                    );
                                  } else {
                                    return Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.white),
                                          shape: BoxShape.circle,
                                          color: Colors.blue.shade200),
                                      child: Center(
                                          child: Text(snapshot.data.docs.length
                                              .toString())),
                                    );
                                  }
                                }),
                            GestureDetector(
                              onTap: () {
                                approval = false;
                                courses = false;
                                subjects = true;
                                settings = false;
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Stack(
                                          clipBehavior: Clip.none,
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
                                              key: _formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller:
                                                          _NameTextController,
                                                      validator: (value) =>
                                                          Validator
                                                              .validateNumber(
                                                        number: value,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                19, 15, 0, 14),
                                                        hintText:
                                                            'Enter Name of subject',
                                                        hintStyle:
                                                            const TextStyle(
                                                          color:
                                                              Color(0xFF9B9595),
                                                          fontSize: 17,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(1),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          height: 1,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: TextFormField(
                                                      controller:
                                                          _ChTextController,
                                                      validator: (value) =>
                                                          Validator.validatech(
                                                        ch: value,
                                                      ),
                                                      keyboardType:
                                                          TextInputType.text,
                                                      textDirection:
                                                          TextDirection.ltr,
                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                19, 15, 0, 14),
                                                        hintText:
                                                            'Enter Credit Hour',
                                                        hintStyle:
                                                            const TextStyle(
                                                          color:
                                                              Color(0xFF9B9595),
                                                          fontSize: 17,
                                                        ),
                                                        errorBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(1),
                                                          borderSide:
                                                              const BorderSide(
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        errorStyle:
                                                            const TextStyle(
                                                          height: 1,
                                                        ),
                                                        border:
                                                            InputBorder.none,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      XFile? image =
                                                          await _picker.pickImage(
                                                              source:
                                                                  ImageSource
                                                                      .gallery,
                                                              imageQuality: 40);
                                                      dynamic myFile =
                                                          File(image!.path);
                                                      imagePath = myFile;
                                                      print(imagePath);
                                                      imageBool = true;
                                                      print(imageBool);
                                                    },
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        Text(
                                                          'Upload Image',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFF9B9595),
                                                            fontSize: 17,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.add_a_photo,
                                                          color: Colors
                                                              .purple.shade200,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: ElevatedButton(
                                                      child: Text("Submit"),
                                                      onPressed: () async {
                                                        if (_formKey
                                                                .currentState!
                                                                .validate() &&
                                                            imageBool) {
                                                          _formKey.currentState
                                                              ?.save();
                                                          print('started');
                                                          await uploadimage(
                                                                  imagePath)
                                                              .then((value) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        }
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
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: Colors.white),
                                      color: Colors.blue.withOpacity(0.1)),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.purple,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        approval = false;
                        courses = false;
                        subjects = false;
                        settings = true;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      margin: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: settings
                            ? Colors.blue.shade200
                            : Colors.blue.withOpacity(0.1),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                                child: Text(
                              'Settings',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.purple),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          approval
              ? Approvals()
              : courses
                  ? Expanded(child: Courses())
                  : subjects
                      ? AllSubjects()
                      : settings
                          ? Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height /
                                    100 *
                                    78,
                                width: MediaQuery.of(context).size.width,
                                child: Center(
                                  child: Container(
                                    width: 150,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade300,
                                          offset: Offset(2, 1),
                                          blurRadius: 8,
                                          spreadRadius: 2,
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () async {
                                        await FirebaseAuth.instance
                                            .signOut()
                                            .then((value) {
                                          Navigator.of(context).popUntil(
                                              (route) => route.isFirst);
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));
                                        });
                                      },
                                      child: Center(
                                        child: Text('Log Out'),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
        ],
      ),
    );
  }
}
