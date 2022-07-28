import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Screens/loginPage.dart';

import '../Screens/signupPage.dart';
import '../Services/authentication.dart';
import '../Services/validation.dart';

class BasicForm extends StatefulWidget {
  final Function notifyParent;
  const BasicForm({Key? key, required this.notifyParent}) : super(key: key);

  @override
  State<BasicForm> createState() => _BasicFormState();
}

final _focusEmail = FocusNode();
final _focususername = FocusNode();
final _focusPassword = FocusNode();
final _focusDob = FocusNode();
bool male = false;
bool female = false;
final TextEditingController _emailTextController = TextEditingController();
final TextEditingController _passwordTextController = TextEditingController();
final TextEditingController _usernameTextController = TextEditingController();
final TextEditingController _dobTextController = TextEditingController();
final _formkey = GlobalKey<FormState>();
bool _isProcessing = false;

class _BasicFormState extends State<BasicForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: [
          Container(
            width: 340,
            height: 70,
            padding: const EdgeInsets.only(bottom: 0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 1),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  height: 50,
                  width: 340,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.ltr,
                  controller: _usernameTextController,
                  focusNode: _focususername,
                  validator: (value) => Validator.validateName(
                    name: value,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(19, 15, 0, 14),
                    hintText: 'Enter Full Name',
                    hintStyle: const TextStyle(
                      color: Color(0xff9b9595),
                      fontSize: 17,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorStyle: const TextStyle(
                      height: 1,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 70,
            padding: const EdgeInsets.only(bottom: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      male = true;
                      female = false;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 1),
                        )
                      ],
                      color: male ? Color(0xFF6F6DD2) : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: male
                          ? Border.all(color: const Color(0xFF6F6DD2))
                          : Border.all(color: Colors.transparent),
                    ),
                    height: 50,
                    width: 70,
                    child: Center(
                      child: Text(
                        'Male',
                        style: TextStyle(
                          color: male ? Colors.white : Color(0xff9b9595),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 1),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      male = false;
                      female = true;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                    padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 1),
                        )
                      ],
                      color: female ? Color(0xFF6F6DD2) : Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: female
                          ? Border.all(color: const Color(0xFF6F6DD2))
                          : Border.all(color: Colors.transparent),
                    ),
                    height: 50,
                    width: 70,
                    child: Center(
                      child: Text(
                        'Female',
                        style: TextStyle(
                          color: female ? Colors.white : Color(0xff9b9595),
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(flex: 6),
                Container(
                  height: 70,
                  width: 130,
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                        padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(2, 1),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        height: 50,
                        width: 130,
                      ),
                      TextFormField(
                        controller: _dobTextController,
                        focusNode: _focusDob,
                        validator: (value) => Validator.validateDOB(
                          dob: value,
                        ),
                        keyboardType: TextInputType.datetime,
                        textDirection: TextDirection.ltr,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.fromLTRB(19, 15, 0, 14),
                          hintText: 'Enter DOB',
                          hintStyle: const TextStyle(
                            color: Color(0xFF9B9595),
                            fontSize: 17,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                            borderSide: const BorderSide(
                              color: Colors.red,
                            ),
                          ),
                          errorStyle: const TextStyle(
                            height: 1,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 70,
            padding: const EdgeInsets.only(bottom: 0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 1),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  height: 50,
                  width: 340,
                ),
                TextFormField(
                  controller: _emailTextController,
                  focusNode: _focusEmail,
                  validator: (value) => Validator.validateEmail(
                    email: value,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(19, 15, 0, 14),
                    hintText: 'Enter Email',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9B9595),
                      fontSize: 17,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorStyle: const TextStyle(
                      height: 1,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 340,
            height: 70,
            padding: const EdgeInsets.only(bottom: 0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  padding: const EdgeInsets.fromLTRB(2, 0, 0, 5),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 7,
                          offset: Offset(2, 1),
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  height: 50,
                  width: 340,
                ),
                TextFormField(
                  controller: _passwordTextController,
                  focusNode: _focusPassword,
                  obscureText: true,
                  validator: (value) => Validator.validatePassword(
                    password: value,
                  ),
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(19, 15, 0, 14),
                    hintText: 'Enter Password',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9B9595),
                      fontSize: 17,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(1),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    errorStyle: const TextStyle(
                      height: 1,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () async {
              _focusEmail.unfocus();
              _focusPassword.unfocus();
              _focusPassword.unfocus();
              if (user == null) {
                if (_formkey.currentState!.validate() && (male || female)) {
                  setState(
                    () {
                      _isProcessing = true;
                    },
                  );
                  User? user = await FireAuth.registerUsingEmailPassword(
                    name: _usernameTextController.text,
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                    gender: male ? 'Male' : 'Female',
                    dob: _dobTextController.text,
                  );
                  if (user != null) {
                    formnumber = 2;
                    widget.notifyParent();
                    print('${user.uid}this is form number$formnumber');
                  } else if (user == null) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(errormessage),
                        );
                      },
                    );
                  }
                  setState(
                    () {
                      _isProcessing = false;
                      _emailTextController.clear();
                      _usernameTextController.clear();
                      _passwordTextController.clear();
                    },
                  );
                } else {
                  if (!male || !female) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text('Please select a gender'),
                        );
                      },
                    );
                  }
                }
              } else {
                print('user is not null');
                print(FirebaseAuth.instance.currentUser?.uid);
                formnumber = 2;
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
              child: Center(
                child: !_isProcessing
                    ? const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
