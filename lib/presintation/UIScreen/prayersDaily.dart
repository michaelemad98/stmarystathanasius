import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../constant/const.dart';

class PrayersDaily extends StatefulWidget {
  const PrayersDaily({Key? key}) : super(key: key);

  @override
  _PrayersDailyState createState() => _PrayersDailyState();
}

class _PrayersDailyState extends State<PrayersDaily> {
  bool isChecked1st = false;
  bool isChecked3rd = false;
  bool isChecked6th = false;
  bool isChecked9th = false;
  bool isChecked11th = false;
  bool isChecked12th = false;
  bool isCheckedbible = false;
  bool isCheckedMidnight= false;
  String day= DateFormat('EEEE').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: fourtaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color:Colors.white)),
                Text('Daily Prayers',
                  style: Theme.of(context).textTheme.headline4,),
                IconButton(onPressed: (){}, icon: Icon(Icons.note_add_sharp,color:Colors.white,))

              ],
            ),
            SizedBox(height: 40,),
            Container(
            height: MediaQuery.of(context).size.height-185.0,
              decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75))
              ),
              child: ListView(
                primary: false,
                padding: EdgeInsets.only(left:25,right: 20),
                children: [
                  SizedBox(height: 20,),
                  Center(child: Text('$day', )),
                  SizedBox(height: 20,),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 45.0),
                    height: MediaQuery.of(context).size.height-300.0,
                    child: ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                                child: (Image(image: AssetImage('assets/images/risen.png'),)),
                            ),
                            Text('1st Hour - Prime'),
                            Checkbox(value: isChecked1st, onChanged: (bool? value) {
                              setState(() {
                                isChecked1st = value!;
                              });
                            },)
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/bird.png'),)),
                            ),
                            Text('3rd Hour - Terce'),
                            Checkbox(value: isChecked3rd, onChanged: (bool? value) {
                              setState(() {
                                isChecked3rd = value!;
                              });
                            },)

                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/christian-cross.png'),)),
                            ),
                            Text(' 6th Hour - Sext'),
                            Checkbox(value: isChecked6th, onChanged: (bool? value) {
                              setState(() {
                                isChecked6th = value!;
                              });
                            },)

                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/good friday.png'),)),
                            ),
                            Text(' 9th Hour - None', ),
                            Checkbox(value: isChecked9th, onChanged: (bool? value) {
                              setState(() {
                                isChecked9th = value!;
                              });
                            },),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/vespers.png'),)),
                            ),
                            Text('11th Hour - Vespers', ),
                            Checkbox(value: isChecked11th, onChanged: (bool? value) {
                              setState(() {
                                isChecked11th = value!;
                              });
                            },),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/candle.png'),)),
                            ),
                            Text('12th Hour - Compline', ),
                            Checkbox(value: isChecked12th, onChanged: (bool? value) {
                              setState(() {
                                isChecked12th = value!;
                              });
                            },),

                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.transparent,
                              child: (Image(image: AssetImage('assets/images/bible.png'),)),
                            ),
                            Text('Holy Bible', ),
                            Flexible(
                              child: new TextField(
                              textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    helperText: "chapters number",hintText: "chapters number"
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Checkbox(value: isCheckedbible, onChanged: (bool? value) {
                              setState(() {
                                isCheckedbible = value!;
                              });
                            },),

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
