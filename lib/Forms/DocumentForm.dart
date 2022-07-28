import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Screens/signupPage.dart';

class DocumentForm extends StatefulWidget {
  final Function notifyParent;

  const DocumentForm({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<DocumentForm> createState() => _DocumentFormState();
}

class _DocumentFormState extends State<DocumentForm> {
  Future<void> uploadimage(File path, String number) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child('users/${user!.uid}$number');
    UploadTask uploadTask = ref.putFile(path);
    uploadTask.then((res) async {
      url = await res.ref.getDownloadURL();
      if (kDebugMode) {
        print('this is url$url');
      }
    }).then(
      (value) => (FirebaseFirestore.instance
          .collection('users')
          .doc(user?.uid)
          .update({number: url})),
    );
  }

  User? user = FirebaseAuth.instance.currentUser;
  bool imageuploadloading = false;
  bool imageBool1 = false;
  bool imageBool2 = false;
  bool imageBool3 = false;
  final ImagePicker _picker = ImagePicker();
  late String url;
  dynamic imagePath1;
  dynamic imagePath2;
  dynamic imagePath3;

  Future<void> Upload() async {
    await uploadimage(imagePath1, '1');
    await uploadimage(imagePath2, '2');
    await uploadimage(imagePath3, '3');
  }

  void displayBottomSheet(BuildContext context, String number) async {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          imageuploadloading = true;
                        });
                        XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery, imageQuality: 40);
                        dynamic myFile = File(image!.path);
                        if (number == '1') {
                          imagePath1 = myFile;
                          imageBool1 = true;
                          print("this is imagepath$imagePath1");
                        } else if (number == '2') {
                          imagePath2 = myFile;
                          imageBool2 = true;
                          print("this is imagepath$imagePath2");
                        } else if (number == '3') {
                          imagePath3 = myFile;
                          print("this is imagepath$imagePath3");
                          imageBool3 = true;
                        }
                        setState(() {
                          imageuploadloading = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            )),
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/picture.png'),
                              fit: BoxFit.fitWidth,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Gallery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          imageuploadloading = true;
                        });
                        XFile? image = await _picker.pickImage(
                            source: ImageSource.camera, imageQuality: 40);
                        dynamic myFile = File(image!.path);
                        if (number == '1') {
                          imagePath1 = myFile;
                          imageBool1 = true;
                          print("this is imagepath$imagePath1");
                        } else if (number == '2') {
                          imagePath2 = myFile;
                          imageBool2 = true;
                          print("this is imagepath$imagePath2");
                        } else if (number == '3') {
                          imagePath3 = myFile;
                          imageBool3 = true;
                          print("this is imagepath$imagePath3");
                        }

                        setState(() {
                          imageuploadloading = false;
                        });
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2,
                              color: Colors.grey,
                            )),
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/camera.png'),
                              fit: BoxFit.fitWidth,
                            ),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Camera',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              'Upload your DMC',
              style: TextStyle(
                color: Color(0xff746E6E),
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            )),
        Container(
          margin: const EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffCCCCCC), width: 1)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  displayBottomSheet(context, '1');
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: 100,
                  height: 40,
                  color: const Color(0xff567AE5),
                  child: const Center(
                    child: Text(
                      'Choose',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              !imageBool1
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: const Center(
                          child: Text(
                        'No file Selected',
                        style: TextStyle(
                          color: Color(0xff746E6E),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      )),
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        children: const [
                          Icon(Icons.image),
                          Center(
                              child: Text(
                            '1 file Selected',
                            style: TextStyle(
                              color: Color(0xff746E6E),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          )),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              'Upload your Certificate',
              style: TextStyle(
                color: Color(0xff746E6E),
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            )),
        Container(
          margin: const EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffCCCCCC), width: 1)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  displayBottomSheet(context, '2');
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: 100,
                  height: 40,
                  color: const Color(0xff567AE5),
                  child: const Center(
                      child: Text(
                    'Choose',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Arial',
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
              !imageBool2
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: const Center(
                          child: Text(
                        'No file Selected',
                        style: TextStyle(
                          color: Color(0xff746E6E),
                          fontFamily: 'Arial',
                          fontSize: 20,
                        ),
                      )),
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        children: const [
                          Icon(Icons.image),
                          Center(
                              child: Text(
                            '1 file Selected',
                            style: TextStyle(
                              color: Color(0xff746E6E),
                              fontFamily: 'Arial',
                              fontSize: 20,
                            ),
                          )),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: const Text(
              'Upload your Document',
              style: TextStyle(
                color: Color(0xff746E6E),
                fontFamily: 'Arial',
                fontSize: 20,
              ),
            )),
        Container(
          margin: const EdgeInsets.all(10),
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffCCCCCC), width: 1)),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  displayBottomSheet(context, '3');
                },
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  width: 100,
                  height: 40,
                  color: const Color(0xff567AE5),
                  child: const Center(
                    child: Text(
                      'Choose',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Arial',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              !imageBool3
                  ? Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: const Center(
                        child: Text(
                          'No file Selected',
                          style: TextStyle(
                            color: Color(0xff746E6E),
                            fontFamily: 'Arial',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                      width: 150,
                      height: 30,
                      color: Colors.transparent,
                      child: Row(
                        children: const [
                          Icon(Icons.image),
                          Center(
                            child: Text(
                              '1 file Selected',
                              style: TextStyle(
                                color: Color(0xff746E6E),
                                fontFamily: 'Arial',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (user != null) {
              if (imagePath1 != null &&
                  imagePath2 != null &&
                  imagePath3 != null) {
                print('all selected');
                print(user?.uid);
                await Upload().then((value) => widget.notifyParent());
                formnumber = 3;
                print(formnumber);
              } else {
                if (!imageBool1 || !imagePath2 || !imagePath3) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Text('Please select all fields'),
                      );
                    },
                  );
                }
              }
            } else {
              formnumber = 1;
              widget.notifyParent();
            }
          },
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            width: 340,
            height: 50,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFC5B7B7),
                  offset: Offset(2, 1),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: const Color(0xFF6F6DD2)),
              color: const Color(0xFF6F6DD2),
            ),
            child: const Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
