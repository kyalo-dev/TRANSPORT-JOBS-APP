// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/client.dart';
import 'package:index2/driver.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({super.key});

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
          'Transportation Jobs Mobile Application',
           style: TextStyle(color: Colors.greenAccent),
          )
 ),
 body: Center(
   child: Column(mainAxisAlignment: MainAxisAlignment.center,
    
    children: [
       Text(
                'FOR YOUR TRANSPORT SOLUTIONS',
                style: TextStyle(color: Colors.blue),
              ),
   TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => Driver()))),
                  child: Text(
                    'See Available drivers',
                   style: TextStyle(color: Colors.black),
                  )),
                   TextButton(
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: ((context) => client()))),
                  child: Text(
                    'See Available Jobs',
                     style: TextStyle(color: Colors.black),
                    ))
    ],
   ),
 )
 
      );

    
  }
}