import "package:flutter/material.dart";

class AboutScreen extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: Center(child: Text("About Us page"))
    );
  }
}