import 'package:chapter9/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String email='',age='',password='';
  @override
  void initState() {
    
    super.initState();
    LoadData();
  }

   LoadData()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    email=sp.getString('email')??'';
    age=sp.getString('age')??'';
    password=sp.getString('password')??'';
    setState(() {
      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Center(child: Text('Home Screen',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black),)),
            SizedBox(height:100),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Email',style: TextStyle(fontSize: 20),),
                Text(email.toString(),style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Password',style: TextStyle(fontSize: 20),),
                Text(password.toString(),style: TextStyle(fontSize: 20),)
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Age',style: TextStyle(fontSize: 20),),
                Text(age.toString(),style: TextStyle(fontSize: 20),)
              ],
            ),
            const SizedBox(height: 50,),

            
            InkWell(
              onTap: ()async{
                SharedPreferences sp= await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
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
                      'Log Out',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                

              ),
            
          ],
          
        ),
      ),
    );
      
      
  }
}
