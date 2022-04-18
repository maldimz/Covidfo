import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:covidfo/controller/auth_controller.dart';
import 'package:covidfo/controller/connectivity_controller.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:covidfo/utils/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

bool _isObscure = true;

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authC = Get.find<AuthController>();

  emailHandler(){
    bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(_emailController.text);
    if(!emailValid){
      const snackBar = SnackBar(
        content: Text('Format Email salah'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return emailValid;
  }

  nullHandler(){
    bool check=true;
     if(
       _emailController.text=="" ||
       _passwordController.text==""
     ){
       const snackBar = SnackBar(
         content: Text('Tidak Boleh Kosong'),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackBar);

       print("tidak boleh kosong!");
       check=false;
     }
    return check;
  }

  @override
  Widget build(BuildContext context) {
    final connectC = Get.find<ConnectController>();
    return Scaffold(
      backgroundColor: convertColor(backgroundColor),
      body: Padding(
        padding: EdgeInsets.all(34.0),
        child: StreamBuilder(
          stream: connectC.connectStatus,
          builder: (context, snapshot) {
          if(snapshot !=null &&
            snapshot.hasData &&
            snapshot.data != ConnectivityResult.none){
              print(snapshot.hasData);
              return ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Text("Login",
                        style: TextStyle(
                          color: convertColor(darkColor),
                          fontWeight: FontWeight.w800,
                          fontSize: 30
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text("Hallo, Selamat datang kembali",
                      style: TextStyle(
                        color: convertColor(transTextColor),
                        fontWeight: FontWeight.w600,
                        fontSize: 14
                      ),
                    ),

                    const SizedBox(height: 25),
                    Text("Email",
                      style: TextStyle(
                        color: convertColor(darkColor),
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: convertColor(darkColor)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: convertColor(darkColor), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 10)
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),
                    Text("Password",
                      style: TextStyle(
                        color: convertColor(darkColor),
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: TextField(
                        obscureText: _isObscure,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: convertColor(darkColor)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: convertColor(darkColor), width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 10),
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                            onPressed: (){
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 45),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: ElevatedButton(
                        style: raisedButtonStyle,
                        child: const Text("Login"),
                        onPressed: ()  async {
                          if(nullHandler() || emailHandler() ){
                            await authC.login(_emailController.text, _passwordController.text);
                            if(authC.code!=null){
                              const snackBar = SnackBar(
                                content: Text('Email/Password salah'),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          }     
                        }              
                      ),
                    ),  

                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Tidak punya akun? ",
                          style: TextStyle(
                            color: convertColor(transTextColor),
                            fontWeight: FontWeight.w500,
                            fontSize: 14
                          ),
                        ),
                        TextButton(
                          onPressed: (){
                            Get.offNamed(RouteName.register);
                          }, 
                          child: Text("Daftar",
                            style: TextStyle(
                              color: convertColor(bgCardOrange),
                              fontWeight: FontWeight.w500,
                              fontSize: 14
                            ),
                          )
                        ),
                      ],
                    )
                  ],
                );      
            }
            return LoadingView();
        },)
      ),
    );
  }

 final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: convertColor(buttonPrimary),
    primary: convertColor(green),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0))
    ),
  );
}