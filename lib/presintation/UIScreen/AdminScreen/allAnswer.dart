import 'package:flutter/material.dart';

import '../../../constant/const.dart';
import '../../../functuion/webservice.dart';
import '../../widgets/inputtextfield.dart';
class AllAnswerScreen extends StatelessWidget {
  TextEditingController SearchTec = TextEditingController();
  late String? search;
   AllAnswerScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body:SafeArea(child: SingleChildScrollView(
        child:Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: InputTextFaield(
                    obscureText: false,
                    hintText: 'Search',
                    onClick: (value) {
                      search = value;
                    },
                    valdition: (value) {
                      if (value.isEmpty) {
                        return 'Search';
                      } else {
                        return null;
                      }
                    },
                    tec: SearchTec,
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,
                    child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: Colors.white,
                        elevation: 10,
                        child: Center(child: Icon(Icons.search))),
                  ),
                ),
              ],
            ),
            Container(
              height: 600,
              padding: EdgeInsets.all(16),
              width: double.infinity,
              child: FutureBuilder<List<dynamic>>(
                future:AllAnswersService().getAllAnsewer() ,
                builder:(context,snapshot){
                  if(!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                    );
                  }else{
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                               childAspectRatio: 2/3,
                                crossAxisSpacing: 1,
                                 mainAxisSpacing: 1
                               ),
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(8)
                            ),
                            child: Column(
                              children: [
                                Text(snapshot.data![index]['user']['username']),
                                Text(snapshot.data![index]['question1']),
                              ],
                            ),
                          );
                        },
                    );
                  }
                }
              )
            )
          ],
        ) ,
      ),) ,
    );
  }
}
