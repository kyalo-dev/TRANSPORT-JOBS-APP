// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/chatroom.dart';
import 'package:index2/main.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  List<String> images = [
    'kcv.jpg',
    'kdb.jpg',
  ];
  List<String> title = [
    'KCV.jpg,Mercedes Box Body ,30Tonne',
    'KDB,Faw Tipper Body, 28Tonne',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available Drivers',
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
      body: ListView.builder(
          itemCount: images.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: ((context) => chatroom()))),
                child: Card(
                  child: Column(
                    children: [
                      Text(title[index]),
                      Image.asset('images/${images[index]}'),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }
}
