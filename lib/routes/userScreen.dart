import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/models/address.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("JSON (auto) - Valentina Prado"),
      ),
      body: Center(
        child: Expanded(
          // child: Text(json),
          child: Card(
            child: ListTile(
              title: Text(
                "Nome: ${user.name}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text("Username: ${user.username} \n Email: ${user.email} \n Empresa: ${user.}"),
              isThreeLine: true,
            ),
          ),
        ),
      ),
    );
  }
}
