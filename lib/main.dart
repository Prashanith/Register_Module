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
  final _formKey=GlobalKey<FormState>();
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
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.pexels.com/photos/6927305/pexels-photo-6927305.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500'),
                fit: BoxFit.cover,
              ),
            ),
            child:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Theme(
                            data: ThemeData(
                              cardColor: themeColor,
                              primaryColor: themeColor,
                              primaryColorDark: themeColor,
                            ),
                            child: TextFormField(
                              onEditingComplete: ()=>_formKey.currentState.validate(),
                              keyboardType:TextInputType.emailAddress,
                              cursorColor: themeColor,
                              style: TextStyle(
                                color: themeColor,
                              ),
                              decoration: InputDecoration(
                                labelText: 'username',
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:  BorderSide(
                                      color:themeColor
                                  ),
                                ),
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: themeColor,
                                ),
                              ),
                              controller: username,
                            ),
                          ),
                          SizedBox(height: 30,),
                          Theme(
                            data: ThemeData(
                              cardColor: themeColor,
                              primaryColor:themeColor,
                              primaryColorDark: themeColor,
                            ),
                            child: TextFormField(
                              onEditingComplete: ()=>_formKey.currentState.validate(),
                              validator: (password){
                                return password.length<8?'Minimum 8 characters':null;
                              },
                              obscureText: true,
                              cursorColor: themeColor,
                              style: TextStyle(
                                color: themeColor,
                              ),
                              decoration: InputDecoration(labelText: 'password',
                                enabledBorder:  OutlineInputBorder(
                                  borderSide:  BorderSide(color:themeColor),
                                ),
                                border: const OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  color: themeColor,
                                ),
                              ),
                              controller: password,
                            ),
                          ),
                          SizedBox(height: 20,),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:MaterialStateProperty.all<Color>(Colors.blueGrey[900]),
                            ),
                            onPressed: () {  },
                            child: Text('REGISTER'),
                          ),
                        ],
                      )
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                      child: Text(
                          "Click here",
                          style: TextStyle(decoration: TextDecoration.underline, color: Colors.black45)),
                    onTap: ()async{
                      await canLaunch('https://www.google.com') ? await launch('https://www.google.com/') : throw 'Could not launch url';
                    },
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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

                      )
                    ],
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
