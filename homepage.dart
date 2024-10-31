import 'package:flutter/material.dart';
import 'package:freelancer_try1/login%20and%20signinpages/loginpage.dart';
import 'package:freelancer_try1/login%20and%20signinpages/signuppage.dart';



// ignore: camel_case_types
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          verticalDirection: VerticalDirection.up,
          children: [
              Align(
                alignment: Alignment.center,
              ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const loginpage()),
                );
                }, child: const Text('Login')),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const signuppage()),
                    );
                    }, child: const Text('Sign up')),
                    ],
        
                ),
      )
    );
  }
}
