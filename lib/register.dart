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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REGISTER'),
      ),
      body: Stack(
        children: [
          Image.asset(
            'images/bgi.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(alignment: Alignment.topCenter,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bg2.png',height: 300, width: 600,),
            ),),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'FOR YOUR TRANSPORT SOLUTIONS',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Text(
                        'Email address',
                        style: TextStyle(color: Colors.white),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Enter email',
                            hintStyle: TextStyle(color: Colors.white)),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        controller: passwordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.white)),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Confirm Password',
                        style: TextStyle(color: Colors.white),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextField(
                        controller: confirmPasswordController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: 'ConfirmPassword',
                            hintStyle: TextStyle(color: Colors.white)),
                      )),
                    ],
                  ),
                ),
                TextButton(
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => DriverReg(
                                  password: passwordController.text.trim(),
                                  email: emailController.text,
                                )))),
                    child: Text(
                      'Register as a Driver',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => ClientReg()))),
                    child: Text(
                      'Register as a Client',
                      style: TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Already have  Account?Login now',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
