import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllSubjects extends StatelessWidget {
  const AllSubjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
          future: FirebaseFirestore.instance.collection('subjectInfo').get(),
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
              return SizedBox(
                height: MediaQuery.of(context).size.height / 100 * 78,
                width: double.maxFinite,
                child: GestureDetector(
                  onTap: () {
                    print(snapshot.data.size);
                  },
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.size,
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  offset: Offset(2, 1),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                )
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 40,
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot.data.docs[index]['url'],
                                  ),
                                ),
                                Container(
                                    width: 150,
                                    height: 40,
                                    child: Text(
                                      snapshot.data.docs[index].id,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              );
            }
          }),
    );
  }
}
