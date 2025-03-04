import "package:flutter/material.dart";
import "screens/main_screen.dart";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}
void main(){
  runApp(MyApp());
}