// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Stack(
        children: [Image.asset('images/bgi.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(hintText: 'Enter your Email Address',hintStyle: TextStyle(color: Colors.white),border: OutlineInputBorder(),),
                 
                ),
              ),
               TextButton(onPressed:(){} ,child: Text('Reset Password',style: TextStyle(color: Colors.white),)),
                  
            ],
          )),
        ],
      ),
    );
  }
}
