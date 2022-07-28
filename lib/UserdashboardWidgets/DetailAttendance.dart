import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailAttendance extends StatelessWidget {
  final DocumentSnapshot doc;
  const DetailAttendance({Key? key, required this.doc}) : super(key: key);

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
                  Text(
                    doc['week 1']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 1']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 2']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 2']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 3']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 3']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 4']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 4']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 5']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 5']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 6']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 6']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 7']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 7']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 8']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 8']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 9']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 9']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 10']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 10']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 11']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 11']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 12']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 12']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 13']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 13']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 14']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 14']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 15']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 15']['Class 2'] ? 'Present' : 'Absent',
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
                  Text(
                    doc['week 16']['Class 1'] ? 'Present ;' : 'Absent ;',
                    style: TextStyle(
                      color: Color(0xff969191),
                      fontFamily: 'Arial',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    doc['week 16']['Class 2'] ? 'Present' : 'Absent',
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
        ],
      ),
    );
  }
}
