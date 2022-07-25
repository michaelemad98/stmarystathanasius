import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/const.dart';
import '../../../functuion/sharedprefrenc.dart';
import 'allAnswer.dart';
import 'allMembers.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  String ?picByte;
  var image;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    picByte = CacheHelper.getData(key: 'picByte') ?? '';
    var blob = picByte;
    if (blob != null) {
      // Only decode if blob is not null to prevent crashes
      image = base64.decode(blob);
    } else {
      print("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height /12,
                      decoration: BoxDecoration(
                        color:primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(65.0),),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: CircleAvatar(radius: 40, backgroundImage: MemoryImage(image))),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: Center(child: Text('Home'),)),
                    Positioned(
                        right: 20,
                        child: IconButton(onPressed: (){},icon: Icon(Icons.filter_list),)),
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height /12,
                  decoration: BoxDecoration(
                    color:primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(65.0),
                      topLeft: Radius.circular(65.0),
                    ),
                  ),
                  child:   InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMembers()));

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Church Members'),
                        Icon(Icons.group),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:whiteColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(25.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0x29000000),
                            offset: Offset(0, 3),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text('What\'s on your mind?'),
                          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){}, icon: Icon(Icons.image)),
                  ],
                ),


                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMembers()));
                //
                //       },
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15.0),
                //             ),
                //             color: Colors.white,
                //             elevation: 10,
                //             child: Center(
                //                 child: Text(
                //               'All\nMembers',
                //               style: Theme.of(context).textTheme.bodyText2,
                //               textAlign: TextAlign.center,
                //             ))),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Navigator.push(context, MaterialPageRoute(builder: (context)=>AllAnswerScreen()));
                //       },
                //       child: Container(
                //         width: 100,
                //         height: 100,
                //         child: Card(
                //             shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(15.0),
                //             ),
                //             color: Colors.white,
                //             elevation: 10,
                //             child: Center(
                //                 child: Text(
                //               'All\nِِِِAnswers',
                //               style: Theme.of(context).textTheme.bodyText2,
                //               textAlign: TextAlign.center,
                //             ))),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ));
  }
}
