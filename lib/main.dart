import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stocks.dart' as stocks;
import 'websocket.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();
  var response ;

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   myController.dispose();
  // }
  //
  // Future<void> getResponse() async {
  //   var obj = stocks.IEXcloud();
  //   try {
  //     var resp = await obj.fetchData(myController.text);
  //     setState(() {
  //       response = jsonDecode(resp) as Map;
  //     });
  //     for (var i in response.keys) {
  //       var value = response[i];
  //       print(" $i , $value");
  //     }
  //   }
  //   catch(e)
  //   {
  //     setState(() {
  //           response={"Error": "Unauthorised Request"};
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade50,
        appBar: AppBar(
          title: Center(child: Text('LIVE STOCK STATISTICS')),
          backgroundColor: Colors.blueGrey,

        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
          child: Column(
            children: [
              TextFormField(
                controller: myController,
                cursorColor: Colors.black26,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter stock symbol below:',
                  labelStyle: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.green,
                  onPressed: () {
                    QuoteMediaWebSocket x = QuoteMediaWebSocket();
                    x.func();
                      },
                      child: Text('Display Data'),
              ),

                   Column (
                  children: [
                    if(response!=null)
                  for ( var i in response.keys ) Row(
                        children: [
                          Text (
                            '$i : ',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text (
                              '${response[i]}',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ],
                  ),
                  ],
                  ),
                  ],
                  ),
    ),
    ),
    );
  }
}