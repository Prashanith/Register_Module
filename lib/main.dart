import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final username=TextEditingController();
  final password=TextEditingController();
  final themeColor=Colors.black45;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Register"),
        backgroundColor: Colors.blueGrey[900],
      ),
      body:SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage('https://images.pexels.com/photos/6927305/pexels-photo-6927305.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      DropdownButton<String>(
                        focusColor: Colors.blueGrey,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.blueGrey,
                        ),
                        hint: Text('Drop Down 1',),
                        items: <String>['A', 'B', 'C', 'D'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                      DropdownButton<String>(
                        hint: Text('Drop Down 2'),
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 1,
                          color: Colors.blueGrey,
                        ),
                        items: <String>['P', 'Q', 'R', 'S'].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},

                      ),

                    ],
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all<Color>(Colors.blueGrey[900]),
                    ),
                    onPressed: () {  },
                    child: Text('SUBMIT'),
                  ),
                  GestureDetector(
                      child: Text(
                          "Click here",
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.black45)),
                    onTap: ()async{
                      await canLaunch('https://www.google.com') ? await launch('https://www.google.com/') : throw 'Could not launch url';
                    },
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
