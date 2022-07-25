import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../constant/const.dart';


class MemeberContainer extends StatelessWidget {
  final String? firtnametxt;
  final String? lastnametxt;
  final String? usernametxt;
  final String? emailtxt;
  final String? phonetxt;
  final String? mailingAddresstxt;
  final String? citytxt;
  final String? statetxt;
  String ?picByte;
  var image;
   MemeberContainer({Key? key,this.firtnametxt,this.lastnametxt,this.emailtxt,this.usernametxt,this.citytxt,this.mailingAddresstxt,this.phonetxt,this.statetxt, this.picByte}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var blob = picByte;
    if (blob != null) {
      // Only decode if blob is not null to prevent crashes
      image = base64.decode(blob);
    } else {
      print("Error");
    }
    return Container(
      margin: EdgeInsets.only(top: 8,bottom: 16),

      padding: EdgeInsets.all(4),
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(65.0),
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [CircleAvatar(radius: 40,backgroundImage:MemoryImage(image)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${firtnametxt} ${lastnametxt}',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
              Text(
                '$usernametxt',
                style: TextStyle(
                    
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
              Text(
                '$emailtxt',
                style: TextStyle(
                    
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
              Text(
                '$phonetxt',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
              Text(
                '$mailingAddresstxt ',
                style: TextStyle(
                    
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
              Text(
                '$citytxt - $statetxt',
                style: TextStyle(
                    
                  fontSize: 16,
                  color: const Color(0xff006778),
                ),
                softWrap: false,
              ),
            ],
          )
        ],
      ),
    );
  }
}
