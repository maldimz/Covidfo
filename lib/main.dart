import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidfo/controller/auth_controller.dart';
import 'package:covidfo/controller/connectivity_controller.dart';
import 'package:covidfo/routes/page_routes.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:covidfo/utils/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  Get.put(ConnectController(), permanent: true);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  HttpOverrides.global = MyHttpOverrides();
}

class MyApp extends StatelessWidget {
  final authC = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authC.streamAuthStatus,
      builder: (context, snapshot) {
        print(snapshot.connectionState);
        if(snapshot.connectionState == ConnectionState.active){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Convidfo',
            theme: ThemeData(
              colorScheme: ThemeData().colorScheme.copyWith(
                primary: convertColor(darkColor),
              ),
            ),
            initialRoute: snapshot.data != null ? RouteName.homepage : RouteName.splash,
            getPages: pageRouteApp.pages,
          );
        }
        return LoadingView();
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
    ..badCertificateCallback = (X509Certificate, String host, int port)=>true;
  }
}
