// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:index2/main.dart';
import 'package:index2/upload.dart';

class DriverReg extends StatefulWidget {
  const DriverReg({super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<DriverReg> createState() => _DriverRegState();
}

class _DriverRegState extends State<DriverReg> {

  XFile? id;
  XFile? dl;
  XFile? logbook;
  XFile? vehicle;
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  List<Map<String,dynamic>> files = [];
  addfiles() async {
     List<Map<String,dynamic>>  temp=[];
    temp.clear();
    temp.add({
      'name':'id',
      'path':(id!.path)});
       files.add({
      'name':'dl',
      'path':(dl!.path)});
       files.add({
      'name':'logbook',
      'path':(logbook!.path)});
       files.add({
      'name':'vehicle',
      'path':(vehicle!.path)});
   await Future.delayed(Duration(milliseconds: 200),(() {
     setState(() {
     files=temp;
   });
   }));
  }

  Future< List<Map<String,dynamic>> > upload() async {
    addfiles();
    List<Map<String,dynamic>> urls = [];
    setState(() {
      isuploading=true;
    });
    await Future.delayed(Duration(milliseconds: 200), (() async {
      urls = await UploadImages().uploadFiles(files);
    }));
    return urls;
  }

 
bool isuploading=false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController idNumberController = TextEditingController();
  TextEditingController vehicleRegistrationNumberController =
      TextEditingController();
  TextEditingController vehicleTonnageController = TextEditingController();
  TextEditingController vehicleBodyTypeController = TextEditingController();
  TextEditingController chargesPerKmController = TextEditingController();
  final GlobalKey<FormState>_formKey=GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        
        child:isuploading? Center(child: CircularProgressIndicator(),):Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: ((value) {
                    return value!.isEmpty?'Email cannot be Empty!':null;
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
                    return value!.isEmpty?'Password cannot be Empty!':null;
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
                    return value!.isEmpty?'Cannot be Empty!':null;
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
                    return value!.isEmpty?' cannot be Empty!':null;
                  }),
                  controller: idNumberController,
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
                    return value!.isEmpty?'Cannot be Empty!':null;
                  }),
                  controller: vehicleRegistrationNumberController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Vehicle Registration number ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: ((value) {
                    return value!.isEmpty?' cannot be Empty!':null;
                  }),
                    controller: vehicleTonnageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Vehicle Tonnage ',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: ((value) {
                    return value!.isEmpty?'Cannot be Empty!':null;
                  }),
                    controller: vehicleBodyTypeController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Vehicle Body type ',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: ((value) {
                    return value!.isEmpty?'Cannot be Empty!':null;
                  }),
                    controller: chargesPerKmController,
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
                
                       id = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      // maxHeight: 50.0,
                      // maxWidth: 50.0,
                    );
                    setState(() {
                      
                    });
                  
                    
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
                    
                       logbook = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      // maxHeight: 50.0,
                      // maxWidth: 50.0,
                    );
                   
                   setState(() {
                     
                   });
                   
                  },
                  leading: Icon(Icons.picture_in_picture_sharp),
                  title: Text('Upload  Vehicle Logbook')),
              logbook == null
                  ? SizedBox()
                  : Image.file(
                      File(logbook!.path),
                      height: 120,
                      width: 120,
                    ),
              ListTile(
                  onTap: () async {
              
                      vehicle = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      // maxHeight: 50.0,
                      // maxWidth: 50.0,
                    );
                    setState(() {
                      
                    });
                    
                
                  },
                  leading: Icon(Icons.car_rental),
                  title: Text('Upload vehicle Image')),
              vehicle == null
                  ? SizedBox()
                  : Image.file(
                      File(vehicle!.path),
                      height: 120,
                      width: 120,
                    ),
              ListTile(
                  onTap: () async {
                    
                       dl = await ImagePicker().pickImage(
                      source: ImageSource.camera,
                      // maxHeight: 50.0,
                      // maxWidth: 50.0,
                    );
                  setState(() {
                    
                  });
                   
                  },
                  leading: Icon(Icons.picture_in_picture_alt_sharp),
                  title: Text('Upload  Driving License')),
              dl == null
                  ? SizedBox()
                  : Image.file(
                      File(dl!.path),
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
                        'email':creds?.user?.email,
                        'idnumber':idNumberController.text.trim(),
                        'vehiclereg':vehicleRegistrationNumberController.text.trim(),
                        'vehiclebodytype':vehicleBodyTypeController.text.trim(),
                        'vehicletonnage':vehicleTonnageController.text.trim(),
                        'chargesperkm':chargesPerKmController.text.trim(),
                        'images':images,
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
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Welcome to Driver Registration'),
      ),
    );
  }
}
