

import 'package:chapter9/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FormData=GlobalKey<FormState>();
  final emailController =TextEditingController();
  final passwordController =TextEditingController();
  final ageController =TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Login',
            style: TextStyle(fontSize: 20),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height:20),
              TextFormField(
                controller: passwordController,
                decoration:const InputDecoration(
                  hintText: 'Password',
                ),
              ),
              const SizedBox(height:20),
               TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration:const InputDecoration(
                  hintText: 'Age',
                ),
              ),
              const SizedBox(height: 40,),
              InkWell(
                onTap: ()async {
                  SharedPreferences sp=await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('password', passwordController.text.toString());
                  sp.setString('age', ageController.text.toString());
                 
                  sp.setBool('isLogin',false);
                  // ignore: avoid_print
                  print(sp.getString('email'));
                  // ignore: avoid_print
                  print(sp.getString('password'));
                  print(sp.getString('age'));
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>HomeScreen()));



                 /*
                 //onTap:() async{....}
                 SharedPreferences sp=await SharedPreferences.getInstance();
                 sp.setString('name', 'jayesh');
                 sp.setInt('age', 20);
                 sp.setBool('isLogin',false);
                 sp.remove('name');

                 print(sp.getBool('isLogin'));

                 print(sp.getString('name'));
                 print(sp.getInt('age'));*/
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  height: 50,
                  width: double.infinity,
                  child: const Center(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
 
}
