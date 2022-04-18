import 'package:covidfo/controller/auth_controller.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:flutter/material.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({ Key? key }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _konfirmasiPasswordController = TextEditingController();
  final TextEditingController _namaDepanController = TextEditingController();
  final TextEditingController _namaBelakangController = TextEditingController();
  final authC = Get.find<AuthController>();
  bool _isObscure = true;
  bool _isConfirm = true;

  nullHandler(){
    bool check=true;
     if(
       _emailController.text=="" ||
       _passwordController.text=="" ||
       _namaDepanController.text=="" ||
       _namaBelakangController.text=="" ||
       _konfirmasiPasswordController.text==""
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

  passHandler(){
    bool check = _passwordController.text == _konfirmasiPasswordController.text;
    if(!check){
      const snackBar = SnackBar(
        content: Text('Password Tidak Sama'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return check;
  }

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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: convertColor(backgroundColor),
      body: Padding(
        padding: EdgeInsets.all(34.0),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              child: const Text("Register",
                style: TextStyle(
                  color: Color(0xff2D3E4F),
                  fontWeight: FontWeight.w800,
                  fontSize: 30
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text("Hallo, Selamat datang",
              style: TextStyle(
                color: convertColor(transTextColor),
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
            ),

            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      width: 140,
                      child: Text("Nama Depan",
                        style: TextStyle(
                          color: convertColor(darkColor),
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    Container(
                      width: 140,
                      child: TextField(
                        controller: _namaDepanController,
                        decoration: inputDecoration
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 140,
                      child: Text("Nama Belakang",
                        style: TextStyle(
                          color: convertColor(darkColor),
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 10),
                    Container(
                      width: 140,
                      child: TextField(
                        controller: _namaBelakangController,
                        decoration: inputDecoration
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 15),
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
                decoration: inputDecoration
              ),
            ),

            const SizedBox(height: 15),
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

            const SizedBox(height: 15),
            Text("Konfirmasi Password",
              style: TextStyle(
                color: convertColor(darkColor),
                fontWeight: FontWeight.w500,
                fontSize: 14
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: TextField(
                obscureText: _isConfirm,
                controller: _konfirmasiPasswordController,
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
                    icon: Icon(_isConfirm ? Icons.visibility : Icons.visibility_off),
                    onPressed: (){
                      setState(() {
                        _isConfirm = !_isConfirm;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: ElevatedButton(
                style: raisedButtonStyle,
                child: const Text("Daftar"),
                onPressed: ()  async {
                  if(nullHandler() && emailHandler()){
                    if(passHandler()){
                      await authC.signup(
                        _emailController.text, 
                        _passwordController.text,
                         _namaDepanController.text,
                          _namaBelakangController.text
                      );
                        if(authC.code!=null){
                          const snackBar = SnackBar(
                            content: Text('Email sudah terdaftar'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                    }
                  }
                },
              ),
            ),  

            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Punya akun? ",
                  style: TextStyle(
                    color: convertColor(transTextColor),
                    fontWeight: FontWeight.w500,
                    fontSize: 14
                  ),
                ),
                TextButton(
                  onPressed: (){
                    Get.offNamed(RouteName.login);
                  }, 
                  child: Text("Login",
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
        )
      ),
    );
  }

  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: convertColor(buttonPrimary),
    primary: convertColor(buttonBlue),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0))
    ),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: convertColor(darkColor)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: convertColor(darkColor), width: 2),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 10)
  );
}