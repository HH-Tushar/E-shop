
import 'package:flutter/material.dart';
import '../widgets/custom_text_form_field.dart';


class SineUpScreen extends StatefulWidget {
  const SineUpScreen({Key? key}) : super(key: key);

  @override
  State<SineUpScreen> createState() => _SineUpScreenState();
}

class _SineUpScreenState extends State<SineUpScreen> {
//form key and required Strings here

  @override
  Widget build(BuildContext context) {
    return   const SingleChildScrollView(
      physics: ScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        child: Form(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Create an Account",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
              SizedBox(height: 25),
              CustomTextFormField(
                labelText: "Name",
                myIcon: Icons.person_rounded,
              ),
              SizedBox(height: 25),
              CustomTextFormField(
                labelText: "Email",
                myIcon: Icons.alternate_email_outlined,
              ),

              SizedBox(height: 25),
              CustomTextFormField(
                labelText: "Password",
                myIcon: Icons.lock_outline,
              ),

              SizedBox(height: 25),
              CustomTextFormField(
                labelText: "Confirm Password",
                myIcon: Icons.lock_outline,
              ),




            ],
          ),
        ),

    );
  }
}
