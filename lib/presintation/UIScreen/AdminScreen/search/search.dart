import 'package:flutter/material.dart';


import '../../../../functuion/webservice.dart';
import '../../../../model/usermodel2.dart';
import '../../../widgets/counter/memeberContainer.dart';


class SearchUser extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[IconButton(onPressed: (){
      query="";
    }, icon: Icon(Icons.close))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios));
  }
  FeatchUser memberList= FeatchUser();
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container(
        height: 600,
        padding: EdgeInsets.all(16),
        width: double.infinity,
        child:FutureBuilder<List<Usermodel>>(
            future:memberList.getMemberList(query: query) ,
            builder:(context,snapshot){
              var data =snapshot.data;
              if(!snapshot.hasData){
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.amber,
                  ),
                );
              }else{
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.all(16),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return MemeberContainer(firtnametxt:'${data?[index].firstname}',lastnametxt: '${data?[index].lastname}',usernametxt: '${data?[index].username}',citytxt: '${data?[index].city}',emailtxt: '${data?[index].email}',mailingAddresstxt: '${data?[index].mallingaddress}',phonetxt: '${data?[index].phonenumber}',statetxt:'${data?[index].state}',picByte: data?[index].imageModel!.picByte,);

                    });
              }

            }
        )
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Text('Search Users'),);
 }

}