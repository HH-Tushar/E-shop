
import 'package:flutter/material.dart';

import '../widgets/custom_text_form_field.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //form key and String here

  @override
  Widget build(BuildContext context) {
    return   const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text("Login",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Email",
              myIcon: Icons.email_outlined,
            ),
            SizedBox(height: 25),
            CustomTextFormField(
              labelText: "Password",
              myIcon: Icons.lock_outline,
            ),
           Align(
               alignment: Alignment.bottomRight,
               child: Text("forget password  ")),



           // const SizedBox(height: 200),


          ],
        ),

    );
  }
}
