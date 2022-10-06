// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class DriverReg extends StatefulWidget {
  const DriverReg({super.key});

  @override
  State<DriverReg> createState() => _DriverRegState();
}

class _DriverRegState extends State<DriverReg> {
  XFile? cameraFile;
  XFile? id;
  XFile? dl;
  XFile? logbook;
  XFile? vehicle;

  selectFromCamera() async {
    cameraFile = (await ImagePicker().pickImage(
      source: ImageSource.camera,
      // maxHeight: 50.0,
      // maxWidth: 50.0,
    ));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              child: TextField(
                  decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Charges per KM ',
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
                onTap: () async {
                  id = (await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    // maxHeight: 50.0,
                    // maxWidth: 50.0,
                  ));
                  setState(() {});
                },
                leading: Icon(Icons.perm_identity),
                title: Text('Upload ID')),
            id == null
                ? SizedBox()
                : Image.file(
                    File(id!.path),
                    height: 120,
                    width: 120,
                  ),
            ListTile(
                onTap: () async {
                  logbook = (await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    // maxHeight: 50.0,
                    // maxWidth: 50.0,
                  ));
                  setState(() {});
                },
                leading: Icon(Icons.picture_in_picture_sharp),
                title: Text('Upload  Vehicle Logbook')),
            logbook == null
                ? SizedBox()
                : Image.file(
                    File(id!.path),
                    height: 120,
                    width: 120,
                  ),
            ListTile(
                onTap: () async {
                  vehicle = (await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    // maxHeight: 50.0,
                    // maxWidth: 50.0,
                  ));
                  setState(() {});
                },
                leading: Icon(Icons.car_rental),
                title: Text('Upload vehicle Image')),
            vehicle == null
                ? SizedBox()
                : Image.file(
                    File(id!.path),
                    height: 120,
                    width: 120,
                  ),
            ListTile(
                onTap: () async {
                  logbook = (await ImagePicker().pickImage(
                    source: ImageSource.camera,
                    // maxHeight: 50.0,
                    // maxWidth: 50.0,
                  ));
                  setState(() {});
                },
                leading: Icon(Icons.picture_in_picture_alt_sharp),
                title: Text('Upload  Driving License')),
            vehicle == null
                ? SizedBox()
                : Image.file(
                    File(id!.path),
                    height: 120,
                    width: 120,
                  ),
            TextButton(
              onPressed: () {},
              child: Text('SUBMIT',style: TextStyle(color: Colors.blue),),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Welcome to Driver Registration'),
      ),
    );
  }
}
