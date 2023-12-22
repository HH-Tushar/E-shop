import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonName;
  const CustomButton({Key? key, required this.buttonName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 45,
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient:const LinearGradient(colors:[
          Color(0xffF8C457),
          Color(0xffFBA139),
        ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(buttonName,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
