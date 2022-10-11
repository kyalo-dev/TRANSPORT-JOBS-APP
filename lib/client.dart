// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/chatroom.dart';
import 'package:index2/clientadd.dart';
import 'package:index2/main.dart';

class client extends StatefulWidget {
  const client({super.key});

  @override
  State<client> createState() => _clientState();
}

class _clientState extends State<client> {
  List<String> images = [
    'coal1.jfif',
    'cont4.jfif',
  ];
  List<String> title = [
    'COAL in Songea Tanzania,Destination: Bamburi Cement, Kenya',
    'CONTAINER  in Mombasa port,Destination: Kampala,Uganda',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Jobs',
          style: TextStyle(color: Colors.greenAccent),
        ),
        actions: [
          TextButton(
              onPressed: () {
                Auth().SignOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(color: Colors.lightGreenAccent),
              ))
        ],
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: ListView.builder(
      //         itemCount: images.length,
      //         itemBuilder: ((context, index) {
      //         return Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: InkWell(
      //             onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: ((context) => chatroom()))),
      //             child: Card(
      //               child: Column(
      //                 children: [
      //                   Text(title[index]),
      //                   Image.asset('images/${images[index]}'),

      //                 ],
      //               ),
      //             ),
      //           ),
      //         );
      //       })),

      //     ),

      //   ],
      // ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('clients').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: ((context, index) {
                  final QueryDocumentSnapshot jobs = snapshot.data!.docs[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => chatroom()))),
                      child: Card(
                        child: Column(
                          children: [
                            Text(jobs['description']),
                            Image.network(
                              jobs['images'][0]['path'],
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                            Text(
                                'from ${jobs['location']} to ${jobs['destination']}')
                          ],
                        ),
                      ),
                    ),
                  );
                }));
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => clientAdd()))),
          icon: Icon(Icons.add),
          label: Text(
            'Add a new Job',
            style: TextStyle(color: Colors.black),
          )),
    );
  }
}
