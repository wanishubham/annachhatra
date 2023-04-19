// import 'dart:js';
// import 'package:path/path.dart' as Path;
//import 'dart:js';

import 'package:annachhatra/pages/green_leaf.dart';
import 'package:annachhatra/pages/list.dart';
import 'package:annachhatra/side_menu/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  static const String id = 'home_page';
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CollectionReference order  = FirebaseFirestore.instance.collection('order');
  CollectionReference items  = FirebaseFirestore.instance.collection('items');
  String? sender;
  late bool veg = false;
  bool? order_availability = false;
  late String username;
  // ignore: non_constant_identifier_names
  String? dish_name;
  int? quantity;
  late String textName = '';
  late String textName1 = '';
  final textController = TextEditingController();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    String text = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Odio et convallis euismod';



    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
          backgroundColor: Color(0xFF519259),
          actions: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                  width:85,height: 30,
                  child:
              IconButton(onPressed: (){

              }, icon: Text('Donate'))),
            ]),
            IconButton(
                onPressed: () {
                  //bool IsCheck;

                  showDialog(context: context, builder: (BuildContext context) => SingleChildScrollView(child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 660,
                        width: 356,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(22)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 330,
                              height: 165,
                              decoration: BoxDecoration(color: Color(0xFFF0BB62),borderRadius: BorderRadius.only(topRight: Radius.circular(22),topLeft: Radius.circular(22))),
                            ),
                            SizedBox(height: 14,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                               Container(
                                 height: 30,
                                 width: 190.16,
                                 child: Text('Shubham wani',style: GoogleFonts.montserrat(
                                     textStyle: TextStyle(decoration:TextDecoration.none,fontWeight: FontWeight.w800,fontSize: 18,color: Color(0xFF646464)))),
                               ),
                              ],
                            ),/// Donation name

                            Row(children: [

                              Container(

                                height: 36,
                                width: 257.34,

                                child: Text(text,style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,color: Color(0xFF646464),decoration:TextDecoration.none,))),
                              )
                            ],),/// Details
                            SizedBox(height: 28,),
                                Column(children: [
                                  Container(
                                      padding: EdgeInsets.only(right: 55),
                                    height: 30,
                                color: Colors.transparent,
                                child:
                                    Material(child:
                                TextField(
                                  controller: textController ,

                                  keyboardType: TextInputType.text,
                                  textAlign: TextAlign.start,
                                  onChanged: (newValue){
                                    dish_name = newValue;
                                    print('dish added'+dish_name.toString());

                                  },
                                  decoration: const InputDecoration(hintText: 'Enter dish name'),
                                )
                                    )

                                  ),
                                  SizedBox(height: 20,),
                                  Container(
                                    padding: EdgeInsets.only(right: 55),
                                    height: 30,
                                    color: Colors.transparent,
                                    child: Material(child: TextField(
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.start,
                                      onChanged: (value){
                                        quantity = int.parse(value);
                                        print('quantity added'+quantity.toString());

                                      },
                                      decoration: InputDecoration(hintText: 'Quantity'),
                                    ),),
                                  )
                                  ]),/// TextField dish name
                            SizedBox(height: 20,),
                            Column(
                              children: [
                                Container(
                                  width: 104,
                                  height: 29,
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.grey,
                                  blurRadius: 4,offset: Offset(0.0,1))]),
                                  child: TextButton(
                                    onPressed: (){
                                      setState(() {

                                        textName = textController.text;
                                        textName1 = textController.text;

                                      });

                                    },style: TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.white),
                                    child: Text('Add'),
                                  ),
                                )
                              ],
                            ), /// Add Button
                            SizedBox(height: 23,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(

                                  width: 100,
                                  height: 30,
                                  child: Text('Food details',style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 14,decoration:TextDecoration.none,fontWeight: FontWeight.w600,
                                  color: Color(0xFF646464))),),
                                ),
                                SizedBox(width: 40,),
                                Container(
                                  width: 100,
                                  height: 30,
                                  child: Text('Quantity',style: GoogleFonts.montserrat(textStyle: TextStyle(decoration:TextDecoration.none,fontSize: 14,fontWeight: FontWeight.w600,
                                      color: Color(0xFF646464)))),
                                )
                              ],
                            ),/// Text food details
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.transparent,
                                  child: Material(child:
                                  IconButton(onPressed: () { }, icon: Image.asset('images/delete.png'),
                                    
                                  )
                                ),),
                                SizedBox(width: 60,),
                                Container(
                                  height: 15,
                                  width: 150,
                                  child: Text('Paneer masala',style: GoogleFonts.montserrat(textStyle: TextStyle(decoration:TextDecoration.none,color: Color(0xFF519259),fontSize: 12,fontWeight: FontWeight.w400)),),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 30,
                                  width: 20,
                                 // color: Colors.red,
                                  child: Text('2',style: GoogleFonts.montserrat(textStyle: TextStyle(decoration:TextDecoration.none,color: Color(0xFF646464),fontSize: 14,fontWeight: FontWeight.w700)),),
                                ),
                              ],
                            ),/// dish name and quantity
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  color: Colors.transparent,
                                  child: Material(child:
                                  IconButton(onPressed: () {  }, icon: Image.asset('images/delete.png'),

                                  )
                                  ),),
                                SizedBox(width: 60,),
                                Container(
                                  height: 15,
                                  width: 150,
                                  child: Text('Chiken kabab',style: GoogleFonts.montserrat(decoration:TextDecoration.none,textStyle: TextStyle(color: Color(0xFFC85C5C
                                  ),fontSize: 12,fontWeight: FontWeight.w400)),),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 30,
                                  width: 20,
                                  // color: Colors.lightBlue,
                                  child: Text('10',style: GoogleFonts.montserrat(textStyle: TextStyle(decoration:TextDecoration.none,color: Color(0xFF646464),fontSize: 14,fontWeight: FontWeight.w700)),),
                                ),
                              ],
                            ),/// dish name and quantity
                            SizedBox(height: 0,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Material(child:Checkbox(value: veg, activeColor: Colors.blueAccent,
                                    onChanged: ( value){
                                  setState(() {
                                    veg = value!;
                                    if(veg != false){
                                     // veg == true;
                                      print('true' + veg.toString());
                                    }else{
                                      //veg == false;
                                      print('false' + veg.toString());
                                    }

                                  });
                                })),
                                // Container(
                                //   height:30 ,
                                //   width: 30,
                                //   child: Material(
                                //     child: Checkbox(
                                //       //activeColor: Colors.blueAccent ,
                                //       value: veg,
                                //       onChanged: (bool? value) {
                                //         setState(() {
                                //           //IsCheck = value!;
                                //           //  veg == value!;
                                //
                                //           if(veg == false){
                                //
                                //            // print('false');
                                //             veg == value!;
                                //             print('true');
                                //           }else{
                                //             veg == value!;
                                //             print('false');
                                //           }
                                //           // if(veg == false){
                                //           //   print('addedTrue' + veg.toString());
                                //           // }else{
                                //           //   print('addedFalse'+ veg.toString());
                                //           // }
                                //          // veg = IsCheck;
                                //
                                //         });
                                //
                                //       },
                                //
                                //     ),
                                //   ),
                                // ),
                                SizedBox(width:16 ,),
                                Container(
                                  width: 190,
                                  height: 15,
                                 // color: Colors.grey,
                                  child: Text('Non veg',style: GoogleFonts.montserrat(textStyle: TextStyle(decoration:TextDecoration.none,
                                      fontSize: 12,fontWeight: FontWeight.w700,color: Color(0xFFBB4848))),),
                                )

                              ],
                            ), /// check Veg & non-Veg
                            SizedBox(height: 33,),                            Column(
                              children: [
                                Container(
                                  width: 104,
                                  height: 30,
                                  decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 5,offset: Offset(0.0,1))],
                                  borderRadius: BorderRadius.circular(22)),
                                  child: TextButton(
                                    onPressed: ()async{
                                      await items.add({'dish_name':dish_name.toString(),'quantity': quantity.toString()}).then((value) => print('User added'));
                                     // await order.add({'veg':veg.toString()}).then((value) => print('selected'));
                                      Navigator.pop(context);
                                    },style: TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xFFF0BB62)),
                                    child: Text('Donate',textAlign: TextAlign.center,style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w700,
                                    fontSize: 14,color: Colors.white)),),
                                  ),
                                )
                              ],
                            ) /// Donate Button
                        ],),
                      )

                  ],),));
                }, icon: Image.asset('images/VectorF.png'))
          ],
          elevation: 4,
          title: Text(
            'Anna Chatra',
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                  //fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
        ),
        body: ListView.builder(
            itemCount: imgList.length,
            itemBuilder: (context, index) => Container(
                margin: EdgeInsets.all(5),
                width: 396.87,
                height: 287,
                // padding: EdgeInsets.only(left: 5.0,top: 5.0),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          blurRadius: 2.0,
                          offset: Offset(0.0, 5.0))
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(
                          imgList[index],
                          width: double.infinity,
                          height: 176,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), /// List Images in Home page
                    Expanded(
                      flex: 4,
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(

                              width: 112,
                              height: 110,
                              //color: Colors.lightBlue,
                              decoration: BoxDecoration(
                                  color: Color(0xFF99B2EA70),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20))),
                              child: Column(children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Quantity',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                              color: Color(0xFF646464),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('10',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 36,
                                                color: Color(0xFF646464),
                                                fontWeight: FontWeight.w800),
                                          )),
                                    ],
                                  ),
                                ),
                              ])),
                          // SizedBox(
                          //   width: 1,
                          // ),
                          Expanded(
                              child: Container(

                            width: 275,
                            height: 125,
                            color: Colors.white,
                            padding: EdgeInsets.only(left: 14.47, top: 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  height: 28,
                                  width: 180,
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(n[index],
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700),
                                      )),
                                ), ///Home Page Hotels Name
                                Container(
                                  height: 34,
                                  width: 257,
                                  color: Colors.transparent,
                                  padding: EdgeInsets.only(top: 5),
                                  child: Text(text,
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xFF646464),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ), ///Home page Hotels Details
                                Container(
                                    padding:
                                        EdgeInsets.only(left: 167, bottom: 1),
                                    height: 35,
                                    width: 260,
                                    color: Colors.transparent,
                                    child: TextButton(
                                        onPressed: () {
                                          // showInfoDialog(context);
                                          showDialog(
                                              context: context,
                                              builder:
                                                  (BuildContext context) =>
                                                      SingleChildScrollView(child: Container(
                                                        //color: Colors.white,
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(12),
                                                              height: 669,
                                                              width: 356,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              20))),
                                                              child: Column(
                                                                children: [
                                                                  Container(
                                                                    height: 165,
                                                                    width: 330,
                                                                    decoration: BoxDecoration(
                                                                        image: DecorationImage(
                                                                            image: AssetImage(imgList[
                                                                                index]),
                                                                            fit: BoxFit
                                                                                .cover),
                                                                        borderRadius: BorderRadius.only(
                                                                            topRight:
                                                                                Radius.circular(20),
                                                                            topLeft: Radius.circular(20))),
                                                                  ),
                                                                  SizedBox(
                                                                    height: 10,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        // padding:
                                                                        //     EdgeInsets.all(20),
                                                                        height:
                                                                            30,
                                                                        width:
                                                                            190,
                                                                        color: Colors.white,
                                                                        child: Text(n[index],
                                                                            style: GoogleFonts.montserrat(
                                                                              textStyle: TextStyle(
                                                                                  color: Color(0xFF646464),
                                                                                  fontSize: 18,
                                                                                  fontWeight: FontWeight.w700),
                                                                            )),
                                                                      ),
                                                                    ],
                                                                  ), /// Hotels Name Text
                                                                  Row(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            36,
                                                                        width:
                                                                            257.34,
                                                                        child: Text(text,style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFF646464),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w400),
                                                                        )),

                                                                      )
                                                                    ],
                                                                  ), /// Hotels Details
                                                                  SizedBox(height: 14,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                    Container(
                                                                        width: 190.16,
                                                                      height: 30,
                                                                      //color: Colors.lightBlue,
                                                                      child: Text('Food details', style: GoogleFonts.montserrat(
                                                                      textStyle: TextStyle(
                                                                      color: Color(0xFF646464),
                                                                      fontSize: 14,
                                                                      fontWeight: FontWeight.w600),
                                                      ),) ,
                                                                      //child: ,
                                                                    ),
                                                                      SizedBox(width: 30.84,),
                                                                      Container(
                                                                        height: 30,
                                                                        width: 110,
                                                                          //color: Colors.lightBlue,
                                                                        child: Text('Quantity',style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFF646464),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w600),
                                                                        ),),
                                                                      )
                                                                    ],
                                                                  ), /// Food Details
                                                                  SizedBox(height: 17,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                       Container(
                                                                         height: 13,
                                                                         width: 190,
                                                                         child: Text('Paneer Masala',style: GoogleFonts.montserrat(
                                                                           textStyle: TextStyle(
                                                                               color: Color(0xFF519259),
                                                                               fontSize: 12,
                                                                               fontWeight: FontWeight.w400),
                                                                         ),),

                                                                       ),
                                                                      SizedBox(width: 46),
                                                                      Container(
                                                                        height: 30,
                                                                        width: 23,
                                                                        child: Text('2',style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFF646464),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),),

                                                                      )
                                                                  ],), /// Paneer Masala
                                                                  SizedBox(height: 26,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        height: 13,
                                                                        width: 190,
                                                                        child: Text('Chiken Kebab',style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFFC85C5C,
                                                                              ),
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),),

                                                                      ),
                                                                      SizedBox(width: 46),
                                                                      Container(
                                                                        height: 30,
                                                                        width: 23,
                                                                        child: Text('10',style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFF646464
                                                                              ),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),),

                                                                      )
                                                                    ],), /// Chiken Kebab
                                                                  SizedBox(height: 55,),

                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Container(
                                                                        height: 31,
                                                                        width: 190,
                                                                        child: Text('Availabel',style: GoogleFonts.montserrat(
                                                                          textStyle: TextStyle(
                                                                              color: Color(0xFF646464
                                                                              ),
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.w700),
                                                                        ),),

                                                                      ),
                                                                      SizedBox(width: 46),
                                                                      Material(

                                                                          child:
                                                                      Container(
                                                                     height: 20,
                                                                        width: 20,

                                                                        child: Checkbox(
                                                                          activeColor: Colors.lightBlueAccent,
                                                                          value: isChecked,
                                                                        onChanged: (value){
                                                                          setState(() {
                                                                            isChecked = value!;
                                                                            if(isChecked != false){
                                                                              print('true' + order_availability
                                                                                  .toString());

                                                                            }else{
                                                                              print('false' + order_availability
                                                                                  .toString());
                                                                            }

                                                                          });
                                                                        },)

                                                                      )),
                                                                    ],), /// Availabel & Checkbox
                                                                  SizedBox(height: 100,),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      Container(
                                                                        width: 104,
                                                                        height: 29,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,offset: Offset(0.0,1))]),


                                                                        child: TextButton(

                                                                          onPressed: (){
                                                                            Navigator.pop(context);
                                                                          },style:TextButton.styleFrom(shadowColor: Colors.grey,shape: StadiumBorder(),backgroundColor: Colors.white), child: Text('Cancle',style: TextStyle(color: Color(0xFFF0BB62)),),
                                                                        ),
                                                                      ), /// Cancle Button
                                                                      SizedBox(width: 27.62,),
                                                                      Container(
                                                                        width: 104,
                                                                        height: 29,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,offset: Offset(0.0,1))]),
                                                                        child: TextButton(
                                                                          onPressed: () async{
                                                                            await order.add({'sender': n[index].toString(),'order_availability': order_availability.toString(),'veg':veg.toString()}).then((value) => print('order added' ));
                                                                            showDialog(context: context, builder: (context) => SingleChildScrollView(child:Container( child: Column(
                                                                                mainAxisAlignment:
                                                                                MainAxisAlignment
                                                                                    .center,
                                                                                children: [
                                                                            Container(
                                                                            padding:
                                                                            EdgeInsets
                                                                                .all(12),
                                                                              height: 669,
                                                                              width: 356,
                                                                              decoration: BoxDecoration(
                                                                                  color: Colors
                                                                                      .white,
                                                                                  borderRadius:
                                                                                  BorderRadius.all(
                                                                                      Radius.circular(
                                                                                          20))),
                                                                              child: Column(
                                                                                children: [
                                                                                Container(
                                                                                height: 165,
                                                                                width: 330,
                                                                                decoration: BoxDecoration(
                                                                                    image: DecorationImage(
                                                                                        image: AssetImage(imgList[
                                                                                        index]),
                                                                                        fit: BoxFit
                                                                                            .cover),
                                                                                    borderRadius: BorderRadius.only(
                                                                                        topRight:
                                                                                        Radius.circular(20),
                                                                                        topLeft: Radius.circular(20))),
                                                                              ),
                                                                                  SizedBox(
                                                                                    height: 10,
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisAlignment:
                                                                                    MainAxisAlignment
                                                                                        .start,
                                                                                    children: [
                                                                                      Container(
                                                                                        // padding:
                                                                                        //     EdgeInsets.all(20),
                                                                                        height:
                                                                                        30,
                                                                                        width:
                                                                                        190,
                                                                                        color: Colors.white,
                                                                                        child: Text(n[index],
                                                                                            style: GoogleFonts.montserrat(
                                                                                              textStyle: TextStyle(
                                                                                                  color: Color(0xFF646464),
                                                                                                  fontSize: 18,
                                                                                                  fontWeight: FontWeight.w700),
                                                                                            )),
                                                                                      ),
                                                                                    ],
                                                                                  ), /// Hotels Images
                                                                                  Row(
                                                                                    crossAxisAlignment:
                                                                                    CrossAxisAlignment
                                                                                        .start,
                                                                                    children: [
                                                                                      Container(
                                                                                        height:
                                                                                        36,
                                                                                        width:
                                                                                        257.34,
                                                                                        child: Text(text,style: GoogleFonts.montserrat(
                                                                                          textStyle: TextStyle(
                                                                                              color: Color(0xFF646464),
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.w400),
                                                                                        )),

                                                                                      )
                                                                                    ],
                                                                                  ), /// Hotels details
                                                                                  SizedBox(height: 89,),
                                                                                  Row(
                                                                                    //mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        //padding: EdgeInsets.only(left: 13),
                                                                                        width: 316,
                                                                                        height: 30,

                                                                                        child: Text('Your Request Accepted !', textAlign: TextAlign.center,style: GoogleFonts.montserrat(
                                                                                          textStyle: TextStyle(color: Color(0xFF519259),fontSize: 18,fontWeight: FontWeight.w700)
                                                                                        ),),
                                                                                      )
                                                                                    ],
                                                                                  ), /// Request Accepted
                                                                                  SizedBox(height: 34,),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 316,
                                                                                        height: 40,

                                                                                        child:Text('Please do collect the parcel from counter',textAlign: TextAlign.center,style: GoogleFonts.montserrat(
                                                                                          textStyle: TextStyle(color: Color(0xFF519259),fontSize: 18,fontWeight: FontWeight.w500)
                                                                                        ),)
                                                                                      )
                                                                                    ],
                                                                                  ), /// Collect
                                                                                  SizedBox(height: 107,),
                                                                                  Row(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 104.38,
                                                                                        height: 30,
                                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,offset: Offset(0.0,1))]),
                                                                                        child: TextButton(

                                                                                          onPressed: (){
                                                                                            Navigator.pop(context);
                                                                                          },style:TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xFFF0BB62)), child: Text('Done',style: TextStyle(color: Colors.white),),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ) /// Done button

                                                                                ],
                                                                            ),
                                                                            ),
                                                                            ],
                                                                            ),
                                                                            ),),);

                                                                          },style:TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xFFF0BB62)), child: Text('Pick up',style: TextStyle(color:Colors.white ),),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ) /// Click Buttons


                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )));
                                        }, /// ShowDialog popUp
                                        style: TextButton.styleFrom(
                                            shadowColor: Colors.grey,
                                            shape: StadiumBorder(),
                                            backgroundColor: Color(0xFFF0BB62)),
                                        child: Text("View",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14),
                                            )))/// View Button)
                                ),
                              ],

                            ),
                          )),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}


