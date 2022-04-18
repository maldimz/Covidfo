import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final userRef = FirebaseFirestore.instance.collection('UserData');

class AuthController extends GetxController{
  FirebaseAuth auth = FirebaseAuth.instance;
  var nameLoading = true.obs;
  String? first, last, email, code;

  getData(){
    if(auth.currentUser!=null){
      userRef.get().then((value) => {
        value.docs.forEach((element) {
          if(element.id==auth.currentUser!.uid){
            nameLoading.value = false;
            setData(
              element['first_name'],
              element['last_name'],
              element['email']
            );
          }
        })
      });
    }
  }

  @override
    void onInit(){
      callData();
      super.onInit();
  }

  callData() async{
    try{
        nameLoading.value = true;
        await getData();
    }finally{
      
    }
  }


  setData(String first, last, email){
    this.first=first;
    this.last=last;
    this.email=email;
  }
  
  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  Future<String?> signup(String _email, String _password, String _namaDepan, String _namaBelakang) async{
    try {
      code=null;
      await auth.createUserWithEmailAndPassword(
        email: _email,
        password: _password
      ).then((value) {
        FirebaseFirestore.instance
        .collection('UserData')
        .doc(value.user!.uid)
        .set({
          "email": value.user!.email,
          "first_name": _namaDepan,
          "last_name": _namaBelakang,
        });
      }
      );
      await FirebaseAuth.instance.signOut();
      Get.offNamed(RouteName.login);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        code = "Email sudah terdaftar";
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("email");
    } 
    return code;
  }

  Future<String?> login(String _email, String _password) async{
    code=null;
    try {
      await auth.signInWithEmailAndPassword(
        email: _email,
        password: _password
      );
      callData();
      Get.offAllNamed(RouteName.homepage);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        code="error";
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        code="error";
        print('Wrong password provided for that user.');
      }
    }
    return code;
  }

  void logout() async{
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(RouteName.splash);
  }
}