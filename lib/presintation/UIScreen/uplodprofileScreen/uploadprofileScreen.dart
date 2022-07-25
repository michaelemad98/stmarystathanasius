import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:stmarystathanasius/presintation/UIScreen/AuthScreens/SignInScreen.dart';

import '../../../constant/compontents.dart';
import '../../../constant/const.dart';
import '../../../functuion/sharedprefrenc.dart';
import '../../widgets/Button/defaultbutton.dart';

class UploadProfileScreen extends StatefulWidget {
  const UploadProfileScreen({Key? key}) : super(key: key);

  @override
  State<UploadProfileScreen> createState() => _UploadProfileScreenState();
}

class _UploadProfileScreenState extends State<UploadProfileScreen> {
  String? firstname,lastname,username,emailaddress,phonenumber,city,state;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstname= CacheHelper.getData(key: 'firstname')??'';
    lastname= CacheHelper.getData(key: 'lastname')??'';
    username= CacheHelper.getData(key: 'username')??'';
    emailaddress= CacheHelper.getData(key: 'emailAddress')??'';
    phonenumber= CacheHelper.getData(key: 'phonenumber')??'';
    city= CacheHelper.getData(key: 'city')??'';
    state= CacheHelper.getData(key: 'state')??'';

  }
  String? hosam;
  void UploadPhoto(String imageFile)async{
    var request = http.MultipartRequest('POST', Uri.parse('http://walnutssolution.com/api/v1/auth/uploadme'));
        request.fields.addAll({
        'email': '$emailaddress',
        'imageName': '$imageFile'
        });
        request.files.add(await http.MultipartFile.fromPath('imageFile', '$imageFile'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }

  }
  File? image;
  Future pickImage()async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 5);
      if(image==null){
        return;
      }
      final imageTemporary = File(image.path);
      setState(() {
        this.image= imageTemporary;
      //  CacheHelper.saveData(key: 'image', value: this.image);
        //print("Mikoooooool ${imageTemporary}");
        hosam = imageTemporary.toString();
        String hany = hosam!.replaceAll(RegExp("File: '"), '');
        String mikool = hany.replaceAll(RegExp("'"), '');

        UploadPhoto(mikool);

      });
    } on PlatformException catch (e){
      print("Faield to pic Image $e");
      showToast(
          text: 'Faield to pic Image $e',
          state: ToastState.ERROR);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(child:SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(250)),
                    ),
                    child: (image != null
                        ? ClipOval(
                        child: Image.file(
                          image!,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ))
                        :Image.asset('assets/images/man.png',width: 150,height: 150,)
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 30,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(onPressed: (){
                          pickImage();
                        }, icon: Icon(Icons.add,color: Colors.black,size: 25,)),
                      ))
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('$firstname',style: TextStyle(fontSize: 25),),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('$lastname',style: TextStyle(fontSize: 25),),
                  ),
                ),
              ],
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text('$username',style: TextStyle(fontSize: 25),),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text('$emailaddress',style: TextStyle(fontSize: 25),),
            ),
            Container(
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text('$phonenumber',style: TextStyle(fontSize: 25),),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Flexible(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('$city',style: TextStyle(fontSize: 25),),
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text('$state',style: TextStyle(fontSize: 25),),
                  ),
                ),
              ],
            ),
            image != null?
    DefaultButton(
    paddingHorizontal: 12,
    onPressed: () {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignInScreen()));
    },
    text: 'SUBMIT NOW',
    fontSize: 16,
    minimumSizeY: 40,
    radius: 12,
    minimumSizeX: 200,
    primary: TertiaryColor,
    onPrimary: whiteColor,
    ):Container()

          ],
        ),
      ),),
    );
  }
}
