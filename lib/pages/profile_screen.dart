import 'package:covidfo/controller/auth_controller.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/shared/image_name.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final authC = Get.find<AuthController>();

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
  final boxShadowCard = BoxShadow(
    color: Colors.grey,
  );
class _ProfileScreenState extends State<ProfileScreen> {
    
    final BoxDecoration styleContainer = BoxDecoration(
      borderRadius: BorderRadius.circular(radiusCardBox),
      color: Colors.white,
      boxShadow: [
        boxShadowCard,
      ]
    );

    final TextStyle contentText = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400
    );

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: convertColor(buttonPrimary),
    primary: convertColor(buttonBlue),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0))
    ),
    );
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: convertColor(backgroundColor),
      body: ListView(
        children:[ Container(
          padding: EdgeInsets.fromLTRB(35, 40, 35, 10),
          child: Column(
            children: [
              Center(
                child: Image.asset(profile),
              ),
              SizedBox(height: 20),

              Container(
                child: Obx((){
                  return authC.nameLoading.value
                  ? CircularProgressIndicator()
                  :Column(
                    children: [
                      Text("${authC.first} ${authC.last}",
                        style: TextStyle(
                          color: convertColor(darkColor),
                          fontSize: 26,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("${authC.email}",
                        style: TextStyle(
                          color: convertColor(transTextColor),
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  );
                }),
              ),
              

              SizedBox(height: 20),
              Text("Media Sosial",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),

              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: styleContainer,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(linkedIcon,
                        scale: 0.9,),
                        SizedBox(width: 10,),
                        Text("Akhmal Dimas Pratma",
                        style: contentText,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset(waIcon,
                        scale: 0.9,),
                        SizedBox(width: 10,),
                        Text("081328751344",
                        style: contentText,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset(igIcon,
                        scale: 0.9,),
                        SizedBox(width: 10,),
                        Text("@akhmal_dimas",
                        style: contentText,)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset(twtIcon,
                        scale: 0.9,),
                        SizedBox(width: 10,),
                        Text("@zmildlamm",
                        style: contentText,)
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),
              Text("Skills",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),

              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: styleContainer,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(javaIcon),
                    Image.asset(reactIcon),
                    Image.asset(jsIcon),
                    Image.asset(flutterIcon)
                  ],
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 200,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  child: const Text("Logout"),
                  onPressed: ()  {
                    authC.logout();
                  },
                ),
              ), 
            ],
          ),
        ),
        ]
      )
    );
    
  }
}