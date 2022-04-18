import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';


class ConnectController extends GetxController{

var connect = Connectivity();


Stream get connectStatus => connect.onConnectivityChanged;

}