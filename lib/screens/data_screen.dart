import "package:flutter/material.dart";
import "../database//database_helper.dart";


class DataScreen extends StatefulWidget {
  @override
  _DataScreenState createState()=> _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _users = [];

  void _fetchUsers() async{
    List<Map<String, dynamic>> users = await dbHelper.getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  void initState(){
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Stored users")),
      body: _users.isEmpty
      ? Center(child: Text("No users found!"))
      : ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_users[index]["email"]),
            subtitle: Text("Password: ${_users[index]["password"]}"),
          );
        },
      ),
    );
  }
}