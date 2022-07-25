import 'package:flutter/material.dart';

import '../../../constant/const.dart';
class OurContainer extends StatelessWidget {
  final String nametxt;
  final String imagelocatin;
  const OurContainer({Key? key,required this.nametxt,required this.imagelocatin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Image(
            image: NetworkImage(imagelocatin),
            width: width *0.45,
            height: height *0.23,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(bottom: 0,child: Container(
            width: width *0.45,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
          ),
            padding: EdgeInsets.all(16),
            child: Text(nametxt,style:TextStyle(color: Colors.white,fontWeight: FontWeight.w900) ,)))
      ],
    );
  }
}
/**
 Container(
    decoration: BoxDecoration(
    color: primaryColor,
    border: Border.all(color:primaryColor, width: 1),
    borderRadius: BorderRadius.circular(15),
    ),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(15.0),
    child: Image(
    image: NetworkImage(imagelocatin),
    width: width *0.45,
    height: height *0.23,
    fit: BoxFit.cover,
    ),
    ),
    Container(
    padding: EdgeInsets.all(10),
    child: Text(
    nametxt,
    style: Theme.of(context).textTheme.bodyText2,
    textAlign: TextAlign.left,
    ),
    )
    ],
    ),

    );
 */
