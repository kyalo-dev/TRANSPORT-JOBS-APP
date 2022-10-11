// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:index2/upload.dart';
import 'main.dart';

class ClientReg extends StatefulWidget {
  const ClientReg({super.key});

  @override
  State<ClientReg> createState() => _ClientRegState();
}

class _ClientRegState extends State<ClientReg> {
  XFile? cameraFile;
  XFile? id;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> files = [];
  addfiles() async {
    List<Map<String, dynamic>> temp = [];
    temp.clear();
    temp.add({'name': 'id', 'path': (id!.path)});

    await Future.delayed(Duration(milliseconds: 200), (() {
      setState(() {
        files = temp;
      });
    }));
  }

  Future<List<Map<String, dynamic>>> upload() async {
    addfiles();
    List<Map<String, dynamic>> urls = [];
    setState(() {
      isuploading = true;
    });
    await Future.delayed(Duration(milliseconds: 200), (() async {
      urls = await UploadImages().uploadFiles(files);
    }));
    return urls;
  }

  bool isuploading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController goodnatureController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        body: SingleChildScrollView(
            child: isuploading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: ((value) {
                                return value!.isEmpty
                                    ? 'Email cannot be Empty!'
                                    : null;
                              }),
                              controller: emailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Email Address ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: ((value) {
                                return value!.isEmpty
                                    ? 'Password cannot be Empty!'
                                    : null;
                              }),
                              controller: passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Enter Password ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: ((value) {
                                return value!.isEmpty
                                    ? 'Cannot be Empty!'
                                    : null;
                              }),
                              controller: confirmPasswordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Confirm Password ',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: ((value) {
                                return value!.isEmpty
                                    ? 'Cannot be Empty!'
                                    : null;
                              }),
                              controller: idController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'ID NUMBER',
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              validator: ((value) {
                                return value!.isEmpty
                                    ? 'Cannot be Empty!'
                                    : null;
                              }),
                              controller: goodnatureController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    'Nature of Goods ie;Perishable/Non-perishable ',
                              ),
                            ),
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
                                id = await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                  // maxHeight: 50.0,
                                  // maxWidth: 50.0,
                                );
                                setState(() {});
                              },
                              leading: Icon(Icons.car_rental),
                              title: Text('Upload vehicle Image')),
                          id == null
                              ? SizedBox()
                              : Image.file(
                                  File(id!.path),
                                  height: 120,
                                  width: 120,
                                ),
                          TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // if (files.length!=4) {
                                //   Fluttertoast.showToast(msg: 'upload required images');

                                // }else {
                                Auth()
                                    .userRegistration(
                                        emailController.text.trim(),
                                        passwordController.text.trim())
                                    .then((creds) {
                                  upload().then((images) {
                                    firestore
                                        .collection('users')
                                        .doc(creds?.user?.uid)
                                        .set({
                                      'email': creds?.user?.email,
                                      'idnumber': idController.text.trim(),
                                      'goodnature':
                                          goodnatureController.text.trim(),
                                      'images': images,
                                    });
                                  }).then((value) {
                                    Fluttertoast.showToast(
                                        msg: "Registered Successfully");
                                    setState(() {
                                      isuploading = false;
                                    });
                                  });
                                });

                                // }
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Please fill in all details');
                              }
                            },
                            child: Text(
                              'SUBMIT',
                              style: TextStyle(color: Colors.blue),
                            ),
                          )
                        ]),
                  )));
  }
}
