import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lms/AdminWidgets/CourseSubjects.dart';

import '../Services/validation.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  final TextEditingController _PriceTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('Courses').get(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                width: 100,
                height: 100,
                child: Center(child: CircularProgressIndicator()),
              ),
            );
          } else {
            return Container(
              height: MediaQuery.of(context).size.height / 100 * 78,
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CourseSubjects(
                                id: snapshot.data!.docs[index].id)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: double.maxFinite,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: Offset(2, 1),
                              blurRadius: 8,
                              spreadRadius: 2,
                            )
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                snapshot.data!.docs[index].id,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                '${'Price: ${snapshot.data!.docs[index]['price'].toString()}'}\$',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black45,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: TextButton(
                                  onPressed: () {
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: CircleAvatar(
                                                      child: Icon(Icons.close),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ),
                                                  ),
                                                ),
                                                Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: TextFormField(
                                                          controller:
                                                              _PriceTextController,
                                                          validator: (value) =>
                                                              Validator
                                                                  .validateNumber(
                                                            number: value,
                                                          ),
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          textDirection:
                                                              TextDirection.ltr,
                                                          decoration:
                                                              InputDecoration(
                                                            contentPadding:
                                                                const EdgeInsets
                                                                        .fromLTRB(
                                                                    19,
                                                                    15,
                                                                    0,
                                                                    14),
                                                            hintText:
                                                                'Enter Price',
                                                            hintStyle:
                                                                const TextStyle(
                                                              color: Color(
                                                                  0xFF9B9595),
                                                              fontSize: 17,
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          1),
                                                              borderSide:
                                                                  const BorderSide(
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                              height: 1,
                                                            ),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: ElevatedButton(
                                                          child: Text("Submit"),
                                                          onPressed: () {
                                                            if (_formKey
                                                                .currentState!
                                                                .validate()) {
                                                              _formKey
                                                                  .currentState
                                                                  ?.save();
                                                              print('started');
                                                              FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'Courses')
                                                                  .doc(snapshot
                                                                      .data!
                                                                      .docs[
                                                                          index]
                                                                      .id)
                                                                  .update({
                                                                'price': int.parse(
                                                                    _PriceTextController
                                                                        .text)
                                                              }).then((value) {
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
                                  child: Row(
                                    children: [
                                      Center(child: Icon(Icons.edit)),
                                      Center(
                                        child: Text(
                                          'Edit Price',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black45,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
            //return Text(snapshot.data.docs[0].id);
          }
        });
  }
}
