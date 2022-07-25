import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stmarystathanasius/presintation/UIScreen/profileScreen.dart';

import '../../constant/const.dart';
import '../../functuion/sharedprefrenc.dart';
import '../Widgets/counter/ourcontaier.dart';
import 'AdminScreen/adminhomescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List aiaList = [
    'Let the word of Christ dwell in you richly (Col 3:16)',
    'Therefore welcome one another as Christ has welcomed you, for the glory of God.(Romans 15)',
    'Do not be afraid, for I am with you, and I will bless you. (Genesis 26:24)',
    'Wait for the Lord. Let your heart be strong, and wait for the Lord. (Psalm 27:14)',
  ];
  ScrollController aiaScrollController = new ScrollController();
  String firstname = '';
  String picByte = '';
  var image;
  bool ?isAdmin;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname = CacheHelper.getData(key: 'firstname') ?? '';
    picByte = CacheHelper.getData(key: 'picByte') ?? '';
    isAdmin=CacheHelper.getData(key: 'payment') ?? '';;
    CacheHelper.saveData(key: 'islogin', value: true);
    var blob = picByte;
    if (blob != null) {
      // Only decode if blob is not null to prevent crashes
      image = base64.decode(blob);
      print('Success');
    } else {
      print("Error");
    }

  }

  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/backgroundimage.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          children: [
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'St Mary and St Athanasius\nCoptic Orthodox Church of Maryland',
                          style: TextStyle(
                            fontSize: 10,
                            color: fourtaryColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfielScreen()));
                                },
                                child: CircleAvatar(
                                backgroundImage: MemoryImage(image),radius: 30,
                                )),
                            isAdmin!? IconButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminHomeScreen()));
                            } , icon: Icon(Icons.admin_panel_settings,color: Colors.white,)):Container()
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      'Hello ${firstname} !',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue[900],
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const Center(
                      child:
                          Image(image: NetworkImage('https://www.smsamd.org/wp-content/uploads/2018/08/Logo-DPAR.png'))),
                  Container(
                    height:height/8,
                    width: double.infinity,
                    child: ListView.builder(
                        controller: aiaScrollController,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: aiaList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              '${aiaList[index]}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          );
                        }),
                  ),

                  Center(
                    child: Text(
                      'Our Shepherds',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      OurContainer(
                          nametxt: 'Bishop Karas',
                          imagelocatin: 'https://michtechno.com/images/posts-bishop-karas.jpg'),
                      OurContainer(
                          nametxt: 'Pope Tawadros II of Alexandria',
                          imagelocatin: 'https://michtechno.com/images/posts-liturgy.jpg'),
                    ],
                  ),
                  Center(
                    child: Text(
                      'Our Coptic Saints',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 150,
                      child: ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              OurContainer(
                                  nametxt: 'MICHAEL (ARCHANGEL)',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/08/posts-michael.jpg'),
                              OurContainer(
                                  nametxt: 'SAINT RAPHAEL',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/08/posts-raphael.jpg'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              OurContainer(
                                  nametxt: 'PHILOPATEER MERCURIOS',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/08/posts-philopateer-mercurios.jpg'),
                              OurContainer(
                                  nametxt: 'ST. GEORGE',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/06/posts-st-george.jpg'),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              OurContainer(
                                  nametxt: 'ST. BISHOY',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/06/posts-st-bishoy.jpg'),
                              OurContainer(
                                  nametxt: 'POPE KYRILLOS VI',
                                  imagelocatin:
                                      'https://www.smsamd.org/wp-content/uploads/2018/06/posts-pope-kyrillos.jpg'),
                            ],
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
