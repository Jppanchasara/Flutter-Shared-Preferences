import 'dart:async';

import 'package:chapter9/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:chapter9/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    isLogin();
    
  }

  void isLogin()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin=sp.getBool('isLogin') ?? false;
    //getbool is null hoy to ?? false thai jay

    if(isLogin)
    {
      Timer(const Duration(seconds:6), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
      });

    }else{
      Timer(const Duration(seconds:6), (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
    });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
        child: Container(
          
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            border: Border.all( color: Colors.black,width:2.0,style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Image(
              
              image: AssetImage('Image/logo.png')),
        ),
      ),
      const SizedBox(height: 15,),
      const Text('Maintence Box',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),)
    
        ],
      ));
  }
}
