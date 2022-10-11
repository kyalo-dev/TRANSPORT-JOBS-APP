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
  
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(widget.title),
        ),
        body:loading?Center(child: CircularProgressIndicator(),) :Stack(

          children: [
            Image.asset(
              'images/bgi.jpg',
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(alignment: Alignment.topCenter,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('images/bg1.png',height: 300, width: 600,),
            ),),
            
            Align(
              alignment: Alignment.bottomCenter,
              child: Form(
                  key: _formKey,
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'FOR YOUR TRANSPORT SOLUTIONS',
                      style: TextStyle(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 1,
                                child: Text(
                              'Email Address',
                              style: TextStyle(color: Colors.white),
                            )),
                           
                            Expanded(flex: 3,
                                child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Expanded(flex: 1,
                                child: Text(
                              'Password',
                              style: TextStyle(color: Colors.white),
                            )),
                           
                            Expanded(flex: 3,
                                child: TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      borderSide:
                                          BorderSide(color: Colors.white))),
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
                    ),
                    TextButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading=true;
                            });
                            Auth().SignIn(emailController.text.trim(),
                                passwordController.text.trim()).then((creds) =>setState((){
                                   loading=false;
                                   
                                }));
                          } else {}
                        },
                        icon: Icon(Icons.person),
                        label: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) => ResetPassword()))),
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white),
                        )),
                    TextButton(
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: ((context) => Register()))),
                        child: Text(
                          'No Account?Register now',
                          style: TextStyle(color: Colors.white),
                        ))
                  ]),
                ),
            ),
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

  Future<UserCredential?> SignIn(String email, String password) async {
   UserCredential ?userCredential;
   try {
     userCredential= await _auth
        .signInWithEmailAndPassword(email: email, password: password);
       
   }on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(msg: e.code);
   } catch(e){
     Fluttertoast.showToast(msg: e.toString());
   }
   return userCredential;
  }

  Future<UserCredential?> userRegistration(String email, String password) async {
   UserCredential ?userCredential;
   try {
     userCredential= await _auth
        .createUserWithEmailAndPassword(email: email, password: password);
       
   }on FirebaseAuthException catch (e) {
     Fluttertoast.showToast(msg: e.code);
   } catch(e){
     Fluttertoast.showToast(msg: e.toString());
   }
   return userCredential;
  }
  Future SignOut() async {
    await _auth.signOut();
  }
}
