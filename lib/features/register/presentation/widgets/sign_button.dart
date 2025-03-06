import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  const SignButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

width: 350,
height: 55,
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(30),
  color: const Color(0Xffb02369c
)
),

child: Center(child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),

    );
  }
}