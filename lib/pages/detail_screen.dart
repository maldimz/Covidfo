import 'package:covidfo/controller/appcontroller.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:covidfo/shared/constant.dart';
import 'package:covidfo/utils/formatting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int pageCount = 11;
  bool isLoading = false;
  ScrollController? _scrollController;
  
  var controller = Get.put(AppController());

  @override
  void initState() {
    _scrollController = new ScrollController(initialScrollOffset: 5.0)
      ..addListener(_scrollListener);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: convertColor(backgroundColor),
      body: Padding(
        padding: EdgeInsets.fromLTRB(35, 50, 35, 0),
        child: Obx(() {
          return controller.sortLoading.value
          ? Center(
            child: CircularProgressIndicator(),
          )
          : Container(
            width: double.infinity,
            child: Column(
              children: [
                Text("Kasus Covid-19 Indonesia",
                style: TextStyle(
                  color: convertColor(darkColor),
                  fontWeight: FontWeight.w600,
                  fontSize: 25
                ),),
                SizedBox(height: 20,),
                Container(
                  height: MediaQuery.of(context).size.height /1.4,
                  child: GridView.count(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 1,
                    mainAxisSpacing: 25,
                    childAspectRatio: 2.2,
                    physics: AlwaysScrollableScrollPhysics(),
                    children: List.generate(pageCount, (index) => 
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteName.detailProv, arguments: controller.sortName!.listData![index].key);
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: convertColor(cardBorderTrans)
                          ),
                          borderRadius: BorderRadius.circular(15),
                          color: convertColor(backgroundColor),
                          boxShadow: [
                            BoxShadow(color: Colors.grey,
                            spreadRadius: 0.2),
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(controller.sortName!.listData![index].key.toString(),
                              style: TextStyle(
                                color: convertColor(darkGreen),
                                fontWeight: FontWeight.w700,
                                fontSize: 16
                              ),
                            ),
                       
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(numberFormatDecimal(controller.sortName!.listData![index].jumlahKasus),
                                    style: TextStyle(
                                      color: convertColor(darkGreen),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18 
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Total Kasus",
                                    style: TextStyle(
                                      color: convertColor(darkGreen),
                                      fontWeight: FontWeight.w500
                                  ),)
                                  ],
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(numberFormatDecimal(controller.sortName!.listData![index].jumlahSembuh),
                                    style: TextStyle(
                                      color: convertColor(darkGreen),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18 
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text("Total Sembuh",
                                    style: TextStyle(
                                      color: convertColor(darkGreen),
                                      fontWeight: FontWeight.w500
                                  ),)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ), 
                    )),
                    ),
                )
              ],
            ),

          );
        }),
      ),

    );
  }
  _scrollListener(){
    if (_scrollController!.offset >=
            _scrollController!.position.maxScrollExtent &&
        !_scrollController!.position.outOfRange) {
      setState(() {
        print("comes to bottom $isLoading");
        isLoading = true;
        if(pageCount>22){
          isLoading = false;
          print("max page: " + pageCount.toString());
        }
        if (isLoading) {
          print("RUNNING LOAD MORE");

          pageCount = pageCount + 11;
          if(pageCount>22){
            pageCount++;
          }

        }
      });
    }
  }
}