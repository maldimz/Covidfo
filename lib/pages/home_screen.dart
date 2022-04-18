import 'package:covidfo/controller/auth_controller.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:covidfo/controller/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  var controller = Get.put(AppController());
  final authC = Get.find<AuthController>();


  Future searchData(String param) async{
    List<String> countries = [];
    var controller = Get.put(AppController());
    controller.getData?.listData!.forEach((element) {
      String? data = element.key;
      countries.add(data!);
    });
    
    List<String> result = countries.where((element) => element.toLowerCase().contains(param.toLowerCase())).toList();
    return result;
  }

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController(initialPage:_currentPage, viewportFraction: 0.8 );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: convertColor(backgroundColor),
      body:ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(35, 40, 35, 0),
              child: Row(
                children: [
                  Text("Hallo, ",
                    style: TextStyle(
                      color: convertColor(darkColor),
                      fontWeight: FontWeight.w400,
                      fontSize: 20
                    ),
                  ),
                  Container(
                    child: Obx((){
                      return authC.nameLoading.value
                      ? CircularProgressIndicator()
                      : Text("${authC.first} ${authC.last}",
                        style: TextStyle(
                              color: convertColor(darkColor),
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                            ),
                      );
                    }),
                  )
                ]
              ),
            ),
            
            Padding(
              padding:EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: Container(
                height: 40,
                child: TypeAheadField<String>(
                  textFieldConfiguration: TextFieldConfiguration( 
                    autofocus: false,     
                    style: const TextStyle(
                      fontSize: 14
                    ),
                    decoration: 
                    InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: "Cari nama provinsi . . .",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: convertColor(darkColor)),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: convertColor(darkColor), width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 20, 5)
                    )
                  ),

                  suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),

                  suggestionsCallback: (pattern) async {
                    return await searchData(pattern);
                  },
                  itemBuilder: (context, suggestion) {
                    return ListTile(
                      title: Text(suggestion),
                    );
                  },
                  onSuggestionSelected: (suggestion) {
                    Get.toNamed(RouteName.detailProv, arguments: suggestion);
                  },
                ),
              ),
            ),
            

            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 3.2,
              child: PageView.builder(
                itemCount: 2,
                physics: const ClampingScrollPhysics(),
                controller: _pageController,
                itemBuilder: (context, index) {
                  return sliderView(index);
                },
              ),
            ),
            
            Padding(
              padding: EdgeInsets.fromLTRB(35, 20, 35, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kasus Tertinggi",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: convertColor(darkColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Obx((){
                      return controller.postLoading.value 
                      ? Center(
                        child: CircularProgressIndicator(),
                      )
                      :Container(
                        
                        height: MediaQuery.of(context).size.height / 2.25,
                        child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 1.1,
                          children: List.generate(10, (index) => 
                            InkWell(
                              onTap: (){
                                Get.toNamed(RouteName.detailProv, arguments: controller.getData!.listData![index].key);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: convertColor(bgCardLight),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey,
                                    spreadRadius: 0.2),
                                  ]
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 30,
                                      child: Text(controller.getData!.listData![index].key.toString(),
                                        style: TextStyle(
                                          color: convertColor(darkGreen),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          )
                                        ),
                                    ),

                                    SizedBox(height: 20,),
                                    Column(
                                      children: [
                                        Text(numberFormatDecimal(
                                          controller.getData!.listData![index].jumlahDirawat
                                        ),
                                        style: TextStyle(
                                          color: convertColor(darkGreen),
                                          fontSize: 25,
                                          fontWeight: FontWeight.w800,
                                        ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 2,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Kasus Aktif",
                                          style: TextStyle(
                                            color: convertColor(darkGreen),
                                            fontWeight: FontWeight.w500,
                                          ),),
                                        Icon(Icons.add_circle_outline_rounded,
                                        color: convertColor(darkGreen),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          )
                          ),
                      );
                    }))
                ],
              ),
            )
      
          ],
        ),
      );
  }

  Widget sliderView(int index){
    return sliderCard(index);
  }

  Widget sliderCard(index){
    var controller = Get.put(AppController());

    return  Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Obx((){
      return controller.vaksinLoading.value
      ? Center(
        child: CircularProgressIndicator(),
      )
      : Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: index == 0? convertColor(green):convertColor(bgCardOrange),
            boxShadow: [
              BoxShadow(color: Colors.grey)
            ]
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  Text(index==0?"Penambahan Vaksinasi":"Total Vaksinasi",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18
                  ),),
                  Icon( index == 0
                  ? Icons.keyboard_arrow_up_rounded
                  : Icons.data_usage_rounded, 
                    size: 40,
                    color: Colors.white,)
                ],
              ),

              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(numberFormatDecimal(
                        index == 0
                        ? controller.getVaksin!.vaksinasi!.penambahan!.jumlahVaksinasi1
                        : controller.getVaksin!.vaksinasi!.total!.jumlahVaksinasi1),
                      style: vaksinTextNumber
                      ),
                      SizedBox(height: 5,),
                      Text("Vaksin 1",
                      style: vaksinText,
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text(numberFormatDecimal(
                        index == 0
                        ? controller.getVaksin!.vaksinasi!.penambahan!.jumlahVaksinasi2
                        : controller.getVaksin!.vaksinasi!.total!.jumlahVaksinasi2),
                      style: vaksinTextNumber,),
                      SizedBox(height: 5,),
                      Text("Vaksin 2", 
                      style: vaksinText,
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );   
      })
    );  
  }

  final TextStyle vaksinTextNumber = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontSize: 20
  );

  final TextStyle vaksinText = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w400,
    fontSize: 15
  );
   
 
}