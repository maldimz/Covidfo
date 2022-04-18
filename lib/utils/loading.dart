import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/shared/image_name.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: convertColor(backgroundColor),
        body: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
          Image.asset(logo,),
          SizedBox(height: 180,),
          Center(
              child: CircularProgressIndicator(),
            ),
          
          SizedBox(height: 20),
          Text("Waiting for connection ...",
            style: TextStyle(
              color: convertColor(darkColor),
              fontSize: 15,
              fontWeight: FontWeight.w400
            ),
           )
         ],
        )
      ),
    );
  }
}