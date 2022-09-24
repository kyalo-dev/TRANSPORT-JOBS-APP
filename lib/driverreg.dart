// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DriverReg extends StatefulWidget {
  const DriverReg({super.key});

  @override
  State<DriverReg> createState() => _DriverRegState();
}

class _DriverRegState extends State<DriverReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'ID NUMBER',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Vehicle Registration number ',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vehicle Tonnage ',
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Vehicle Body type ',
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'UPLOAD THE REQUIRED DOCUMENTS',
              style: TextStyle(color: Colors.blue),
            ),
          ),
          ListTile(
              leading: Icon(Icons.perm_identity), title: Text('Upload ID')),
               ListTile(
                leading: Icon(Icons.rectangle),
                title: Text('Upload  Vehicle Logbook')),
                 ListTile(
              leading: Icon(Icons.car_rental), title: Text('Upload vehicle Image')),
               ListTile(
                leading: Icon(Icons.rectangle_sharp),
                title: Text('Upload  Driving License')),
        ],
      ),
      appBar: AppBar(
        title: Text('Welcome to Driver Registration'),
      ),
    );
  }
}
