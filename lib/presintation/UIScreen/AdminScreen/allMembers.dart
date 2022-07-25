import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stmarystathanasius/presintation/UIScreen/AdminScreen/search/search.dart';
import 'package:stmarystathanasius/presintation/UIScreen/AdminScreen/userprofile.dart';


import '../../../bloc/app_cubit.dart';
import '../../../constant/const.dart';
import '../../../functuion/webservice.dart';
import '../../../model/usermodel.dart';
import '../../../model/usermodel2.dart';
import '../../widgets/counter/memeberContainer.dart';
import '../../widgets/counter/userItem.dart';
import '../../widgets/inputtextfield.dart';
import 'package:http/http.dart' as http;

class AllMembers extends StatefulWidget {
  const AllMembers({Key? key}) : super(key: key);

  @override
  State<AllMembers> createState() => _AllMembersState();
}

class _AllMembersState extends State<AllMembers> {
  TextEditingController SearchTec = TextEditingController();
  late String _search;
  var obj;

  FeatchUser memberList= FeatchUser();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   FeatchUser().getMemberList();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(BuildContext context)=> AppCubit(),
    child: BlocConsumer<AppCubit,AppState>(
      builder:(BuildContext context, state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text('Church Members',style: TextStyle(color: TertiaryColor),),
            actions: [IconButton(onPressed: (){
              showSearch(context: context, delegate: SearchUser());
            }, icon: Icon(Icons.search,))],
          ),
          backgroundColor: whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      height: 600,
                      padding: EdgeInsets.all(16),
                      width: double.infinity,
                      child:FutureBuilder<List<Usermodel>>(
                          future:memberList.getMemberList() ,
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
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index){
                                    return GestureDetector(onTap: (){
                                      cubit.selectUser('${data?[index].email}', '${data?[index].password}');
                                    },child: MemeberContainer(firtnametxt:'${data?[index].firstname}',lastnametxt: '${data?[index].lastname}',usernametxt: '${data?[index].username}',citytxt: '${data?[index].city}',emailtxt: '${data?[index].email}',mailingAddresstxt: '${data?[index].mallingaddress}',phonetxt: '${data?[index].phonenumber}',statetxt:'${data?[index].state}',picByte:data?[index].imageModel==null?imageprofile:data?[index].imageModel!.picByte,));
                                  });
                            }

                          }
                      )
                  )

                ],
              ),
            ),
          ),
        );
      } ,
      listener:(BuildContext context,state){
        if(state is SelectUserSucess){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfileScreen()));
        }
      } ,
    ),
    );
  }
}
/*

 */