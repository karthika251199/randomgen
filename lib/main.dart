import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme:ThemeData(primarySwatch:Colors.red),
      debugShowCheckedModeBanner: false,
      home: Gen(),
    );
  }
}

class Gen extends StatefulWidget{

  _GenerateState createState() =>_GenerateState();
}
class _GenerateState extends State<Gen>{

  String qrData ="http://github.com/neon97";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Generator"),
        centerTitle: true,
      ),
      body:Container(
        padding: EdgeInsets.all(20.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            QrImage(data:qrData),
            SizedBox(height:10.0),
            Text("Data here"),
            TextField(
              controller:qrText,
              decoration:InputDecoration(
                hintText: "enter the data",
              ),

            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              padding: EdgeInsets.all(15.0),
              child:Text("Generate QR code"),
              onPressed: () {
                if(qrText.text.isEmpty) {
                  setState(() {
                    Text("please enter the data");
                  } );
                }else {
                  setState( () {
                    qrData = qrText.text;
                  });
                }
              },
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(20.0),
                // side:BorderSide(colors:Colors.blue,width:3.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
  final qrText =TextEditingController();
}
