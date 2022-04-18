import 'package:covidfo/model/covid_data.dart';
import 'package:covidfo/model/data_vaksin.dart';
import 'package:covidfo/services/services.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  covidData? getData;
  covidData? sortName;
  DataVaksin? getVaksin;
  var vaksinLoading = true.obs;
  var postLoading = true.obs;
  var sortLoading = true.obs;
  Services services = Services();
  
  @override
  void onInit(){
    callpostmethod();
    callsortnamemethod();
    callvaksinmethod();
    super.onInit();
  }

  callpostmethod() async{
    try {
      postLoading.value = true;
      var result = await services.getallpost();
      if(result!=null){
        getData = covidData.fromJson(result);
          getData!.listData!.sort((a, b) {
        return b.jumlahDirawat!.compareTo(a.jumlahDirawat!);
    },);
      }else{
        print(null);
      }
    } finally {
      postLoading.value = false;
    }
    update();
  }

  callsortnamemethod() async{
    try {
      sortLoading.value = true;
      var result = await services.getallpost();
      if(result!=null){
        sortName = covidData.fromJson(result);
          sortName!.listData!.sort((a, b) {
        return a.key.toString().compareTo(b.key.toString());
    },);
      }else{
        print(null);
      }
    } finally {
      sortLoading.value = false;
    }
    update();
  }

  callvaksinmethod() async{
    try {
      vaksinLoading.value = true;
      var result = await services.getallvaksin();
      if(result!=null){
        getVaksin = DataVaksin.fromJson(result);
      }else{
        print(null);
      }
    } finally {
      vaksinLoading.value = false;
    }
    update();
  }
}