import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../utils/apifile.dart';
class climate extends StatefulWidget {
  const climate({super.key});

  @override
  State<climate> createState() => _climateState();
}

class _climateState extends State<climate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClimateApp'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: ()=>print('Clicked'),
          )
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Image(image: AssetImage('images/umbrella.jpeg'),
              height: 1200.0,
              width: 590.0,
              fit: BoxFit.fill,
            )
          ),
          Container(
            alignment: Alignment.topRight,
            margin:  EdgeInsets.fromLTRB(0.0, 10.9,20.9,0.0),
            child:Text(
                'Vehari',
              style: cityStyle(),
            ),
          ),
          Center(
              child: Image(image: AssetImage('images/lightrain.png'),
              )
          ),
          Container(

            margin:  EdgeInsets.fromLTRB(30.0, 390.0,20.9,0.0),
            child:Text(
              '50.32F',
              style: tempStyle()
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle cityStyle() {
  return TextStyle(
    color: Colors.white,
    fontSize: 22.9,
    fontStyle: FontStyle.italic,
  );
}
TextStyle tempStyle(){
  return TextStyle(
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}