import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Screens/signupPage.dart';
import 'package:lms/Services/validation.dart';

import '../Services/authentication.dart';
import '../SupportiveWidgets.dart/ellipseshape.dart';
import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => LoginPageState();
}

bool _isProcessing = false;
User? user = FirebaseAuth.instance.currentUser;

class LoginPageState extends State<LoginPage> {
  void Login() {
    if (user != null) {
      FireAuth.refreshUser(user!);
      print('loggin in\n$user');
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => dashboard()));
    }
  }

  FirebaseFirestore db = FirebaseFirestore.instance;
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPassword = FocusNode();
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    print(user?.uid);
    if (user != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => Login());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: GestureDetector(
        onTap: () {
          _focusEmail.unfocus();
          _focusPassword.unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                  minWidth: MediaQuery.of(context).size.width),
              child: IntrinsicHeight(
                child: CustomPaint(
                  size: Size(100, (100 * 0.5833333333333334).toDouble()),
                  painter: RPSCustomPainter(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: const [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Center(
                                child: SizedBox(
                                  width: 120,
                                  height: 120,
                                  child: Text(
                                    'LMS',
                                    style: TextStyle(
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.w900,
                                        color: Color(0xFF6F6DD2),
                                        fontSize: 50,
                                        fontFamily: 'rockwell'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Form(
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 0, 5),
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
                                    controller: _emailTextController,
                                    focusNode: _focusEmail,
                                    validator: (value) =>
                                        Validator.validateEmail(
                                      email: value,
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          19, 15, 0, 14),
                                      hintText: 'Enter email',
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
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                    padding:
                                        const EdgeInsets.fromLTRB(2, 0, 0, 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(2, 1),
                                        )
                                      ],
                                    ),
                                    height: 50,
                                    width: 340,
                                  ),
                                  TextFormField(
                                    controller: _passwordTextController,
                                    focusNode: _focusPassword,
                                    obscureText: true,
                                    validator: (value) =>
                                        Validator.validatePassword(
                                      password: value,
                                    ),
                                    keyboardType: TextInputType.text,
                                    textDirection: TextDirection.ltr,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.fromLTRB(
                                          19, 15, 0, 14),
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          color: Color(0xFF9B9595),
                                          fontSize: 17),
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
                      Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  _focusEmail.unfocus();
                                  _focusPassword.unfocus();

                                  if (_formkey.currentState!.validate()) {
                                    setState(() {
                                      _isProcessing = true;
                                    });
                                    User? user =
                                        await FireAuth.signInUsingEmailPassword(
                                      email: _emailTextController.text,
                                      password: _passwordTextController.text,
                                    );
                                    setState(() {
                                      _isProcessing = false;
                                    });
                                    if (user != null) {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const dashboard(),
                                        ),
                                      );
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
                                    border: Border.all(
                                        color: const Color(0xFF6F6DD2)),
                                    color: const Color(0xFF6F6DD2),
                                  ),
                                  child: Center(
                                    child: !_isProcessing
                                        ? Text(
                                            'Sign in',
                                            style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          )
                                        : CircularProgressIndicator(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: _emailTextController.text);
                            },
                            child: const SizedBox(
                              height: 30,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                      color: Colors.blue, fontFamily: 'Arial'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Center(
                              child: SizedBox(
                                height: 30,
                                child: Text(
                                  'Or Sign in with',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xff5B5B5B),
                                      fontFamily: 'Arial'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/facebook.png'),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: null,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/google.png'),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                color: Color(0xff5B5B5B),
                                fontSize: 15,
                                fontFamily: 'Arial'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SignupPage()));
                            },
                            child: const Text(
                              ' Sign up',
                              style: TextStyle(
                                  color: Color(0xff6F6DD2),
                                  fontSize: 15,
                                  fontFamily: 'Arial'),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
