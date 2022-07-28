import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lms/Screens/adminDashboard.dart';
import 'package:lms/Screens/dashboardUser.dart';
import 'package:lms/Screens/loginPage.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: MediaQuery.of(context).size.width),
        child: IntrinsicHeight(
          child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .doc(user?.uid)
                  .get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: 100,
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return snapshot.data.get('admin')
                      ? adminDashboard()
                      : snapshot.data.get('verified')
                          ? userDashboard()
                          : AlertDialog(
                              title: Text('Await Verification'),
                              content: Text(
                                  'You will be contacted once your document and profile is verified'),
                              actions: <Widget>[
                                IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () async {
                                      await FirebaseAuth.instance
                                          .signOut()
                                          .then((value) {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      });
                                    })
                              ],
                            );
                }
              }),
        ),
      ),
    );
  }
}
