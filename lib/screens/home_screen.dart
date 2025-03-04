import "package:flutter/material.dart";
import "../database/database_helper.dart";


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final DatabaseHelper dbHelper = DatabaseHelper();

  void _login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email.isNotEmpty && password.isNotEmpty) {
      await dbHelper.insertUser(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User saved successfully!"))
      );
      emailController.clear();
      passwordController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter email and password"))
      );
    }

  }

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Login page")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text("Login"),
              )
          ]
        ),
      ),
    );
  }
}