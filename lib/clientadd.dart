// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:index2/upload.dart';
import 'package:fluttertoast/fluttertoast.dart';

class clientAdd extends StatefulWidget {
  const clientAdd({super.key});

  @override
  State<clientAdd> createState() => _clientAddState();
}

class _clientAddState extends State<clientAdd> {
  XFile? goods;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> files = [];
  addfiles() async {
    List<Map<String, dynamic>> temp = [];
    temp.clear();
    temp.add({'name': 'goods', 'path': (goods!.path)});

    await Future.delayed(Duration(milliseconds: 200), (() {
      setState(() {
        files = temp;
      });
    }));
  }
 final FirebaseAuth _auth = FirebaseAuth.instance;
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
  TextEditingController descriptionController = TextEditingController();
  TextEditingController tonnageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADD A NEW JOB '),
        ),
        body: Form(
          key: _formKey,
          child: Stack(
            children: [
              // Image.asset(
              //   'images/bg2.png',
              //   height: MediaQuery.of(context).size.height,
              //   width: MediaQuery.of(context).size.width,
              //   fit: BoxFit.contain,
              // ),
              SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: ((value) {
                        return value!.isEmpty ? 'cannot be Empty!' : null;
                      }),
                      controller: descriptionController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Description of goods ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: ((value) {
                        return value!.isEmpty ? 'cannot be Empty!' : null;
                      }),
                      controller: tonnageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tonnage ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: ((value) {
                        return value!.isEmpty ? 'cannot be Empty!' : null;
                      }),
                      controller: locationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Location ',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: ((value) {
                        return value!.isEmpty ? 'cannot be Empty!' : null;
                      }),
                      controller: destinationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Destination ',
                      ),
                    ),
                  ),
                  ListTile(
                      onTap: () async {
                        goods = await ImagePicker().pickImage(
                          source: ImageSource.camera,
                          // maxHeight: 50.0,
                          // maxWidth: 50.0,
                        );
                        setState(() {});
                      },
                      leading: Icon(Icons.picture_in_picture_alt_sharp),
                      title: Text('Upload  picture of goods')),
                  goods == null
                      ? SizedBox()
                      : Image.file(
                          File(goods!.path),
                          height: 120,
                          width: 120,
                        ),
                  TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // if (files.length!=4) {
                        //   Fluttertoast.showToast(msg: 'upload required images');
                      
                        // }else {
                      
                        upload().then((images) {
                          firestore
                              .collection('clients')
                              .doc(_auth.currentUser?.uid)
                              .set({
                          
                            'description': descriptionController.text.trim(),
                            'tonnage': tonnageController.text.trim(),
                            'location': locationController.text.trim(),
                            'destination': destinationController.text.trim(),
                            'images': images,
                          }).then((value) {
                            setState(() {
                              isuploading = false;
                              Fluttertoast.showToast(
                                  msg: "Successfully uploaded");
                            });
                          });
                        });
                        // }
                      } else {
                        Fluttertoast.showToast(msg: 'Please fill in all details');
                      }
                    },
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
