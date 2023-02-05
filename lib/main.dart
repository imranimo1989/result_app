import 'package:flutter/material.dart';
import 'package:result_app/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Academic Result App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Result App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double totalNumber = 0;
  double gpa =0;
  Map<String, double> formInputValue = {
    "bangla": 0,
    "english": 0,
    "math": 0,
    "islam": 0,
    "phy": 0,
    "chem": 0,
    "bio": 0,};

void getInputNumber(inputKey,inputValue){
 setState(() {
   formInputValue.update(inputKey, (value) => double.parse(inputValue));
 });
}

void getResult(){
  setState(() {
    totalNumber = formInputValue['bangla']!+formInputValue['english']!+formInputValue['math']!+formInputValue['islam']!+formInputValue['phy']!+formInputValue['chem']!+formInputValue['bio']!;

  });
}
TextEditingController controller_1 = TextEditingController();
  TextEditingController controller_2 = TextEditingController();
  TextEditingController controller_3 = TextEditingController();
  TextEditingController controller_4 = TextEditingController();
  TextEditingController controller_5 = TextEditingController();
  TextEditingController controller_6 = TextEditingController();
  TextEditingController controller_7 = TextEditingController();

void clear(){
controller_1.clear();
controller_2.clear();
controller_3.clear();
controller_4.clear();
controller_5.clear();
controller_6.clear();
controller_7.clear();

}


String resultString ="0";

void getGpa(){
  setState(() {
    gpa =totalNumber/7;

    if(gpa>100){
      resultString = "Your Input is wrong, please inpute below 100";
    }
    else if(gpa>79&&gpa<101){
      resultString = "A+";
    }
    else if(gpa>69&&gpa<80){
      resultString = "A";
    }
    else if(gpa>59&&gpa<70){
      resultString = "A-";
    }
    else if(gpa>49&&gpa<60){
      resultString = "B";
    }
    else if(gpa>39&&gpa<50){
      resultString = "C";
    }
    else if(gpa>32&&gpa<40){
      resultString = "D";
    }
    else{
      resultString = "Fail";
    }

  });

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 100,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text('Your Marks in all Subject: $totalNumber', style: myTextStyle(),),
                   SizedBox(height: 5,),

                    Text('your GPA is $resultString.', style: TextStyle(color: Colors.green,fontSize: 30),),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  TextFormField( onChanged: (value){
                    getInputNumber('bangla',value);
                  },
                    controller: controller_1,
                    decoration: myInputDecoration('Bangla'),keyboardType: TextInputType.number,

                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('english',value);
                  },
                    controller: controller_2,
                    decoration: myInputDecoration('English'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('math',value);
                  },controller: controller_3,
                    decoration: myInputDecoration('Mathematics'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('islam',value);
                  },controller: controller_4,
                    decoration: myInputDecoration('Islam'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('phy',value);
                  },controller: controller_5,
                    decoration: myInputDecoration('Physics'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('chem',value);
                  },controller: controller_6,
                    decoration: myInputDecoration('Chemistry'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 10,),
                  TextFormField(onChanged: (value){
                    getInputNumber('bio',value);
                  },controller: controller_7,
                    decoration: myInputDecoration('Biology'),keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        getResult();
                        getGpa();
                        clear();
                      },
                      child: Text('Show Result'),
                      style: myButtonStyle(),),
                  ),
                ],
              ),
            ),







          ],
        ),
      ),
    );
  }
}
