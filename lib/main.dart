// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:index2/client.dart';
import 'package:index2/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRANSPORTATION JOBS APP',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: client()//const MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                    Expanded(child: Text('Name')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(hintText: 'name'),
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
              TextButton(onPressed: () {}, child: Text('Login')),
              TextButton(onPressed: () {}, child: Text('Forgot Password?')),
              TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:((context) => Register()))), child: Text('No Account?Register now'))
            ])));
  }
}
