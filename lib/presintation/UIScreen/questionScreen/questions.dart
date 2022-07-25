import 'package:cupertino_stepper/cupertino_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constant/compontents.dart';
import '../../../constant/const.dart';
import '../../../functuion/sharedprefrenc.dart';
import '../HomeScreen.dart';
import 'package:http/http.dart' as http;

import '../uplodprofileScreen/uploadprofileScreen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  TextEditingController fatherTec = TextEditingController();
  TextEditingController tripTec = TextEditingController();

  DateTime? _dateTimeconfession;
  DateTime? _dateTimeLiturgy;
  DateTime? _dateTimevisit;
  DateTime? _dateTimehymns;
  DateTime? _dateTimetrip;
  bool buttonActive=true;
  bool isCheckedactive = false;
  int currentStep = 0;
  String? email;
  bool ?isSkip;


  Step _buildStep({
    required Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
        title: title,
        isActive: isActive,
        state: state,
        subtitle: Text('Subtitle'),
        content: LimitedBox(
          maxHeight: 250,
          maxWidth: 250,
          child: Container(child: Center(
            child: Text('option',style: Theme.of(context).textTheme.headline5,),
          ),),
        ));
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email=CacheHelper.getData(key: 'emailAddress')??'';

    }
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.yellow,
              Colors.cyanAccent,
            ],
          )
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,

          body: SafeArea(child: ListView(
            children: [
              _cupertinoStepper(StepperType.vertical),
            TextButton(
              style: TextButton.styleFrom(
                primary: primaryColor,
              ),
              onPressed:buttonActive?(){SubmitAnswer();}:null,
              child: Text('Submit'),
            ),
              ],
            ),

          )),
    );
  }

  CupertinoStepper _cupertinoStepper(StepperType type){
    final canCancel = currentStep > 0 ;
    final canContinue = currentStep<6;
    return CupertinoStepper(

        type: type,
        currentStep: currentStep,
        onStepTapped: (step)=>setState(()=>
        currentStep=step),
        onStepContinue: canContinue?()=>setState(()=>++currentStep):null,
        onStepCancel: canCancel?()=>setState(()=>--currentStep):null,
        steps:[
          Step(title: Text('Father Confession'),content: Center(
            child: Column(
              children: [
                Text(
                  'Who is the father of your confession?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: fatherTec,
                  decoration: InputDecoration(
                      labelText:'Father Confession'
                  ),
                )
              ],
            ),
          )),
          Step(title: Text('Last Confession'),content: Center(
            child: Column(
              children: [
                Text(
                  'When was your last confession?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTimeconfession = date;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                    Text(
                        _dateTimeconfession == null
                            ? ''
                            : '${_dateTimeconfession!.day}-${_dateTimeconfession!.month}-${_dateTimeconfession!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5),
                  ],
                ),

              ],
            ),
          )),
          Step(title: Text('Last Liturgy'),content: Center(
            child: Column(
              children: [
                Text(
                  'When was the last Liturgy you attended?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTimeLiturgy = date;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                    Text(
                        _dateTimeLiturgy == null
                            ? ''
                            : '${_dateTimeLiturgy!.day}-${_dateTimeLiturgy!.month}-${_dateTimeLiturgy!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5),
                  ],
                ),

              ],
            ),
          )),
          Step(title: Text('Last Visit Chruch'),content: Center(
            child: Column(
              children: [
                Text(
                  'When was your last visit from chruch ?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTimevisit = date;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                    Text(
                        _dateTimevisit == null
                            ? ''
                            : '${_dateTimevisit!.day}-${_dateTimevisit!.month}-${_dateTimevisit!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5),
                  ],
                ),

              ],
            ),
          )),
          Step(title: Text('Church Activities'),content: Center(
            child: Column(
              children: [
                Text(
                  'Are you interested in church activities or not ?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Checkbox(
                    value: isCheckedactive,
                    onChanged: (value) {
                      setState(() {
                        isCheckedactive = value!;
                        print(isCheckedactive);
                      });
                    })
              ],
            ),
          )),
          Step(title: Text('Last hymns'),content: Center(
            child: Column(
              children: [
                Text(
                  'When was your last hymns class?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTimehymns = date;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                    Text(
                        _dateTimehymns == null
                            ? ''
                            : '${_dateTimehymns!.day}-${_dateTimehymns!.month}-${_dateTimehymns!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5),
                  ],
                ),
              ],
            ),
          )),
          Step(title: Text('Last Trip'),content: Center(
            child: Column(
              children: [
                Text(
                  'Where and when was your last trip with us?',
                  style: Theme.of(context).textTheme.headline5,
                  textAlign: TextAlign.center,
                ),
                TextField(
                  controller: tripTec,
                  decoration: InputDecoration(
                      labelText:'Last Trip'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2010),
                              lastDate: DateTime.now())
                              .then((date) {
                            setState(() {
                              _dateTimetrip = date;
                            });
                          });
                        },
                        icon: Icon(Icons.calendar_today)),
                    Text(
                        _dateTimetrip == null
                            ? ''
                            : '${_dateTimetrip!.day}-${_dateTimetrip!.month}-${_dateTimetrip!.year}',
                        style: Theme.of(context)
                            .textTheme
                            .headline5),
                  ],
                ),
              ],
            ),
          )),
        ]


    );
  }
  void SubmitAnswer()async{
    final responce = await http.post(Uri.parse('http://walnutssolution.com/api/v1/auth/AskQuestion?'
        'question1=${fatherTec.text.trim()}'
        '&question2=${_dateTimeconfession!.day}-${_dateTimeconfession!.month}-${_dateTimeconfession!.year}'
        '&question3=${_dateTimeLiturgy!.day}-${_dateTimeLiturgy!.month}-${_dateTimeLiturgy!.year}'
        '&question4=${_dateTimevisit!.day}-${_dateTimevisit!.month}-${_dateTimevisit!.year}'
        '&question5=${isCheckedactive.toString()}'
        '&question6=${_dateTimehymns!.day}-${_dateTimehymns!.month}-${_dateTimehymns!.year}'
        '&question7=${tripTec.text.trim()}'
        '&question8=${_dateTimetrip!.day}-${_dateTimetrip!.month}-${_dateTimetrip!.year}'
        '&email=$email'));
    if(responce.statusCode==200){
      print('success'+responce.body);
      showToast(text: responce.body, state: ToastState.SUCCESS);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const UploadProfileScreen()));
      // showToast(text: 'question1=${fatherTec.text}&question2=${_dateTimeconfession!.day}-${_dateTimeconfession!.month}-${_dateTimeconfession!.year}&question3=${_dateTimeLiturgy!.day}-${_dateTimeLiturgy!.month}-${_dateTimeLiturgy!.year}&question4=${_dateTimevisit!.day}-${_dateTimevisit!.month}-${_dateTimevisit!.year}&question5=${isCheckedactive.toString()}&question6=${_dateTimehymns!.day}-${_dateTimehymns!.month}-${_dateTimehymns!.year}&question7=${_dateTimetrip!.day}-${_dateTimetrip!.month}-${_dateTimetrip!.year}&email=michaelemad@welnut.com', state: ToastState.SUCCESS);
    }
    else{
      print('error'+responce.body);
      showToast(text: 'Error'+responce.body, state: ToastState.ERROR);
     // showToast(text: 'question1=${fatherTec.text}&question2=${_dateTimeconfession!.day}-${_dateTimeconfession!.month}-${_dateTimeconfession!.year}&question3=${_dateTimeLiturgy!.day}-${_dateTimeLiturgy!.month}-${_dateTimeLiturgy!.year}&question4=${_dateTimevisit!.day}-${_dateTimevisit!.month}-${_dateTimevisit!.year}&question5=${isCheckedactive.toString()}&question6=${_dateTimehymns!.day}-${_dateTimehymns!.month}-${_dateTimehymns!.year}&question7=${_dateTimetrip!.day}-${_dateTimetrip!.month}-${_dateTimetrip!.year}&email=michaelemad@welnut.com', state: ToastState.SUCCESS);
     // print('question1=${fatherTec.text}&question2=${_dateTimeconfession!.day}-${_dateTimeconfession!.month}-${_dateTimeconfession!.year}&question3=${_dateTimeLiturgy!.day}-${_dateTimeLiturgy!.month}-${_dateTimeLiturgy!.year}&question4=${_dateTimevisit!.day}-${_dateTimevisit!.month}-${_dateTimevisit!.year}&question5=${isCheckedactive.toString()}&question6=${_dateTimehymns!.day}-${_dateTimehymns!.month}-${_dateTimehymns!.year}&question7=${tripTec.text}&question8=${_dateTimetrip!.day}-${_dateTimetrip!.month}-${_dateTimetrip!.year}&email=michaelemad@welnut.com');
    }
  }
}

