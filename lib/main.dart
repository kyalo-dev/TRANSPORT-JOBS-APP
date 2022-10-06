// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:index2/client.dart';
import 'package:index2/defaultpage.dart';
import 'package:index2/register.dart';
import 'package:index2/resetpassword.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TRANSPORTATION JOBS APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Auth().handleAuth(),
      //home:const MyHomePage(title: 'TRANSPORTATON JOBS MOBILE APP'),
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blueAccent,
          title: Text(widget.title),
          
        ),
        body: Stack(
          children: [
            Image.asset('images/bgi.jpg',height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
            Center(
                child: Form(
              key: _formKey,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                  Widget>[
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
                      Expanded(child: Text('Email Address',style: TextStyle(color: Colors.white),)),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextFormField(
                            style: TextStyle(color: Colors.white),
                        controller: emailController,
                        decoration: InputDecoration(hintText: 'Email',hintStyle: TextStyle(color: Colors.white,)),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty!';
                          }
                          return null;
                        },
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(child: Text('Password',style: TextStyle(color: Colors.white),)),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: TextFormField(
                              style: TextStyle(color: Colors.white),
                        controller: passwordController,
                        decoration: InputDecoration(hintText: 'Password',hintStyle: TextStyle(color: Colors.white)),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty!';
                          }
                          return null;
                        },
                      )),
                    ],
                  ),
                ),
                TextButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Auth().SignIn(emailController.text.trim(),
                            passwordController.text.trim());
                      } else {}
                    },
                    icon: Icon(Icons.person),
                    label: Text('Login',style: TextStyle(color: Colors.white),)),
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => ResetPassword()))),
                    child: Text('Forgot Password?',style: TextStyle(color: Colors.white),)),
                TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: ((context) => Register()))),
                    child: Text('No Account?Register now',style: TextStyle(color: Colors.white),))
              ]),
            )),
          ],
        ));
  }
}

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  handleAuth() {
   
    return StreamBuilder(
        stream: _auth.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return DefaultPage();
          } else {
            return MyHomePage(title: 'TRANSPORTATON JOBS MOBILE APP');
          }
        }));
  }

  Future SignIn(String email, String password) async {

    await _auth.signInWithEmailAndPassword(email: email, password: password).then((creds) => //debugPrint(user.toString())
     Fluttertoast.showToast(msg: 'logged in as ${creds.user!.email}')
     );
  }
  Future SignOut()async{
    await _auth.signOut();
  }
}
