import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
int _randomNumber = 0;
Color _currentColor = Colors.cyan[300];

List<Color> colorList = [
  Colors.cyan[300],
  Colors.pink[300],
  Colors.yellow[900],
  Colors.lightGreen[700],
  Colors.lime[900],
  Colors.brown[500],
  Colors.red[500],
  Colors.deepOrange[500],
  Colors.amber[800]
];


var info;
class _HomeState extends State<Home> {
  random(min, max){
    var rn = Random();
    setState(() {
      _randomNumber = min + rn.nextInt(max - min);
    });
    return min + rn.nextInt(max - min);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: _currentColor,
        onPressed: () async{
          random(0, colorList.length);
          print(_randomNumber);
          setState(() {
            _currentColor = colorList[_randomNumber];
          });
          var req = await http.get(Uri.parse('https://quotable.io/random'));
          setState(() {
            info = json.decode(req.body);
            print(info);
            print(info['content']);

            // _isLoading = false;
          });
        },
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
        ),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   title: Align(
      //     alignment: Alignment.topLeft,
      //     child: Text(
      //       'Your Quotes',
      //       style: GoogleFonts.poppins(
      //           color: Colors.white,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 20.sp
      //       ),
      //     ),
      //   ),
      // ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Align(
                alignment: Alignment.center,
                child: Container(
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    color: _currentColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(6)
                    )
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '${info['content']}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: (){
                              // FlutterClipboard.copy('hello flutter friends').then(( value ) => print('copied'));
                            },
                            child: const Icon(
                              Icons.copy,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      )
    );
  }
}
