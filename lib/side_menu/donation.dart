import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Donation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        backgroundColor: Color(0xFF519259),
        title: Text('Donations',style: GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w800,fontSize: 22)),),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) => SingleChildScrollView(child:Container(
            margin: EdgeInsets.all(6),
            width: 397,
            height: 156,
            decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 4,offset: Offset(0.0,1))],
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  width: 113,
                  height: 156,
                  padding: EdgeInsets.only(top: 22),
                  decoration: BoxDecoration(color: Color(0xFF99B2EA70
                  ),borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
                  child: Column(children: [
                    Container(
                      height: 22,
                      width: 119,
                      child: Text('Quantity',textAlign: TextAlign.center,style:GoogleFonts.montserrat(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: Color(0xFF646464)))),

                    ),
                    Container(
                      width: 119,
                      height: 35,
                      child: Text('2',textAlign: TextAlign.center,style:GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 36,fontWeight: FontWeight.w800,color: Color(0xFF646464)),)),
                    )
                  ],),
                ),
                Container(
                  width: 267,
                  height: 156,

                  decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 190,
                        height: 20,
                        color: Colors.white,
                        child: Row(children: [
                          Container(
                            child: Text('Paneer Masala',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xFF519259),fontSize: 12,fontWeight: FontWeight.w400)),),
                          ),
                          SizedBox(width: 80),
                          Container(
                            child: Text('2',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xFF646464),fontSize: 14,fontWeight: FontWeight.w700)),),
                          )
                        ],),
                      ),
                      SizedBox(height: 27,),
                      Container(
                        width: 190,
                        height: 20,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Container(
                              child: Text('Chiken Kebab',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xFFC85C5C
                              ),fontSize: 12,fontWeight: FontWeight.w400)),),
                            ),
                            SizedBox(width: 80),
                            Container(
                              child: Text('10',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xFF646464),fontSize: 14,fontWeight: FontWeight.w700)),),
                            )

                          ],
                        ),

                      ),
                      SizedBox(height: 43,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 119,
                            height: 22,
                            child: Text('9:10 ,today',textAlign: TextAlign.center,style:GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xFF646464),fontSize: 12,fontWeight: FontWeight.w500),),),
                          ),
                          SizedBox(width: 29.11,),
                          Container(
                            width: 104,
                            height: 29,
                            child: ElevatedButton(
                              onPressed: (){},style: ElevatedButton.styleFrom(shape: StadiumBorder(),backgroundColor: Color(0xFFBB4848)),
                              child: Text('delete',textAlign: TextAlign.center,),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )),),
    );
  }
}
