// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class ClientReg extends StatefulWidget {
  const ClientReg({super.key});

  @override
  State<ClientReg> createState() => _ClientRegState();
}

class _ClientRegState extends State<ClientReg> {
  XFile? cameraFile;
  XFile? id;

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
      appBar: AppBar(
        title: Text('Welcome to Client Registration'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              hintText: 'Nature of Goods ie;Perishable/Non-perishable ',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Goods Tonnage ',
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Location of Goods ',
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'UPLOAD THE REQUIRED DOCUMENT',
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
      ]),
    );
  }
}
