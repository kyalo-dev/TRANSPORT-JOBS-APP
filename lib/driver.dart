import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Driver extends StatefulWidget {
  const Driver({super.key});

  @override
  State<Driver> createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Driver Page'),
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
                    Expanded(child: Text('Enter ID NO')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(hintText: 'ID NO'),
                    )),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                width: 300,
                child: Row(
                  children: [
                    Expanded(child: Text('Enter Phone NO')),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(hintText: 'Phone NO'),
                    )),
                  ],
                ),
              ),
              TextButton(onPressed: () {}, child: Text('Register')),
              // TextButton(onPressed: () {}, child: Text('Forgot Password?')),
              // TextButton(onPressed: () =>Navigator.of(context).push(MaterialPageRoute(builder:((context) => Register()))), child: Text('No Account?Register now'))
            ]))
    );
  }
}