import 'dart:async';
import 'dart:convert';

import 'package:covidfo/model/covid_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Services{
  Future<Map<String, dynamic>?> getallpost() async{
    try{
      var response = await http
      .get(Uri.parse("https://data.covid19.go.id/public/api/prov.json"))
      .timeout(const Duration(seconds: 10), onTimeout: (){
        throw TimeoutException("connection time out try again");
      });

      if(response.statusCode == 200){

        var jsonresponse = jsonDecode(response.body);
        // print(jsonresponse);
        
        return jsonresponse;
      }else{
        return null;
      }
    } on TimeoutException catch (_){
      print("response time out");
    }
  }

  Future<Map<String, dynamic>?> getallvaksin() async{
    try{
      var response = await http
      .get(Uri.parse("https://data.covid19.go.id/public/api/pemeriksaan-vaksinasi.json"))
      .timeout(const Duration(seconds: 10), onTimeout: (){
        throw TimeoutException("connection time out try again");
      });

      if(response.statusCode == 200){
        var vaksinres = jsonDecode(response.body);

        return vaksinres;
      }else{
        return null;
      }

    } on TimeoutException catch(_){
      print("response time out");
    }
  }
}