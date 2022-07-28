import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailGrades extends StatelessWidget {
  final DocumentSnapshot doc;
  const DetailGrades({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    Text(
                      doc['Assignments']['1'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Assignments']['2'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Assignments']['3'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Assignments']['4'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Quizes']['1'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Quizes']['2'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Quizes']['3'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Quizes']['4'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Presentation'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'MideTerm',
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      doc['Midterm'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
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
                    Text(
                      doc['Finalterm'].toString(),
                      style: TextStyle(
                        color: Color(0xff969191),
                        fontFamily: 'Arial',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
