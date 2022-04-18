import 'package:covidfo/controller/appcontroller.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailProvinsi extends StatelessWidget {
  const DetailProvinsi({ Key? key }) : super(key: key);
  
  
  @override
  Widget build(BuildContext context) {int index = 0;
    var controler = Get.put(AppController());
    String? data = Get.arguments;

    final boxShadowCard = BoxShadow(
      color: Colors.grey,
      spreadRadius: 0.2
    );

    final BoxDecoration styleContainer = BoxDecoration(
      border: Border.all(
        width: 2,
        color: convertColor(cardBorderTrans)
      ),
      borderRadius: BorderRadius.circular(15),
      color: convertColor(backgroundColor),
      boxShadow: [
        boxShadowCard,
      ]
    );

    final TextStyle styleTextGreenMini = TextStyle(
      color: convertColor(darkGreen),
      fontSize: 13,
      fontWeight: FontWeight.w500
     );

    final TextStyle styleTextGreen = TextStyle(
      color: convertColor(darkGreen),
      fontSize: 15,
      fontWeight: FontWeight.w500
     );

    final TextStyle styleTextContentGreen =  TextStyle(
      color: convertColor(darkGreen),
      fontSize: 18,
      fontWeight: FontWeight.w700
    );

    final TextStyle styleTextWhite = TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.w500
     );

    final TextStyle styleTextContentWhite =  TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700
    );
    

    return Scaffold(
      backgroundColor: convertColor(backgroundColor),
      body: Container(
        height: MediaQuery.of(context).size.height / 0.8,
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Obx(() {
          if(controler.sortLoading.value == false){
            for(int x=0; x<controler.sortName!.listData!.length; x++){
              if(data==controler.sortName!.listData![x].key){
                index = x;
                print(index);
              }
            }
          }
          return controler.sortLoading.value
          ? Center(
            child: CircularProgressIndicator(),
          )
          : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: (){
                      Get.back();
                    }, 
                    icon: Icon(Icons.arrow_back_ios_rounded))
                ]
              ),
              Text(data!,
                style: TextStyle(
                  color: convertColor(darkGreen),
                  fontSize: 25,
                  fontWeight: FontWeight.w800
                ),
              ),

              SizedBox(height: 15),
              Container(
                child: Image.asset("assets/img/prov_detail.png"),
              ),

              SizedBox(height: 20,),
              Text(controler.sortName!.lastDate.toString(),
                style: TextStyle(
                  color: convertColor(darkGreen),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(paddingCard),
                    width: MediaQuery.of(context).size.width / widthCard,
                    height: MediaQuery.of(context).size.height / heightCard,
                    decoration: styleContainer,
                    child: Column(
                      children: [
                        Text("positif",
                          style: styleTextGreenMini
                        ),
                        SizedBox(height: 10),  
                        Text(numberFormatDecimal(controler.sortName!.listData![index].penambahan!.positif),
                        style: styleTextContentGreen,)                    ]
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(paddingCard),
                    width: MediaQuery.of(context).size.width / widthCard,
                    height: MediaQuery.of(context).size.height / heightCard,
                    decoration: styleContainer,
                    child: Column(
                      children: [
                        Text("sembuh",
                          style: styleTextGreenMini
                         ),
                        SizedBox(height: 10),  
                        Text(numberFormatDecimal(controler.sortName!.listData![index].penambahan!.sembuh),
                        style: styleTextContentGreen,)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(paddingCard),
                    width: MediaQuery.of(context).size.width / widthCard,
                    height: MediaQuery.of(context).size.height / heightCard,
                    decoration: styleContainer,
                    child: Column(
                      children: [
                        Text("meninggal",
                          style: styleTextGreenMini
                        ),
                        SizedBox(height: 10),  
                        Text(numberFormatDecimal(controler.sortName!.listData![index].penambahan!.meninggal),
                        style: styleTextContentGreen,)
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(paddingCard),
                          width: MediaQuery.of(context).size.width / widthCardBox,
                          height: MediaQuery.of(context).size.height / heightCardBox,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radiusCardBox),
                            color: convertColor(green),
                            boxShadow: [
                              boxShadowCard
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text("Total Sembuh",
                                style: styleTextWhite
                              ),
                              SizedBox(height: 10),  
                              Text(numberFormatDecimal(controler.sortName!.listData![index].jumlahSembuh),
                              style: styleTextContentWhite,)
                            ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(paddingCard),
                          width: MediaQuery.of(context).size.width / widthCardBox,
                          height: MediaQuery.of(context).size.height / heightCardBox,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radiusCardBox),
                            color: convertColor(bgCardOrange),
                            boxShadow: [
                              boxShadowCard
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text("Total Meninggal",
                                style: styleTextWhite
                              ),
                              SizedBox(height: 10),  
                              Text(numberFormatDecimal(controler.sortName!.listData![index].jumlahMeninggal),
                              style: styleTextContentWhite,)
                            ]
                          ),
                        )
                      ],
                    ),

                    SizedBox( height: 20),
                    Row(
                      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(paddingCard),
                          width: MediaQuery.of(context).size.width / widthCardBox,
                          height: MediaQuery.of(context).size.height / heightCardBox,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radiusCardBox),
                            color: convertColor(bgCardGrey),
                            boxShadow: [
                              boxShadowCard
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text("Total Dirawat",
                                style: styleTextGreen
                              ),
                              SizedBox(height: 10),  
                              Text(numberFormatDecimal(controler.sortName!.listData![index].jumlahDirawat),
                              style: styleTextContentGreen,)
                            ]
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(paddingCard),
                          width: MediaQuery.of(context).size.width / widthCardBox,
                          height: MediaQuery.of(context).size.height / heightCardBox,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radiusCardBox),
                            color: convertColor(bgCardLight),
                            boxShadow: [
                              boxShadowCard
                            ]
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Text("Total Kasus",
                                style: styleTextGreen
                              ),
                              SizedBox(height: 10),  
                              Text(numberFormatDecimal(controler.sortName!.listData![index].jumlahKasus),
                              style: styleTextContentGreen,)
                            ]
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]
          );
        },
      ) 
      )
    );
  }
}