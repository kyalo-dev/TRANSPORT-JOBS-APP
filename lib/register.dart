// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:index2/clientreg.dart';
import 'package:index2/driverreg.dart';
import 'package:index2/main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                  'FOR YOUR TRANSPORT SOLUTIONS',
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text('Email address')),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: 'Enter email'),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(child: Text('Password')),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                      )),
                    ],
                  ),
                ),
                 SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(child: Text('Confirm Password')),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        decoration: InputDecoration(hintText: 'ConfirmPassword'),
                      )),
                    ],
                  ),
                ),
                TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:((context) => DriverReg()))), child: Text('Register as a Driver')),
                TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:((context) => ClientReg()))), child: Text('Register as a Client')),
                
                TextButton(onPressed: () =>Navigator.of(context).pop(), child: Text('Already have  Account?Login now'))
          ],
        ),
      ),
    );
  }
}
