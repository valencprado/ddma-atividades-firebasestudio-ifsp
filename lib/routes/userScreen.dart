import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';

class UserScreen extends StatelessWidget {
  final User user;
  const UserScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("HTTP - Valentina Prado"),
      ),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              Text(
                "${user.name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text("Username: ${user.username}"),
              Text("Email: ${user.email}"),
              Text(
                "Empresa: ${user.company?.name} (${user.company?.catchPhrase})",
              ),
              Text("Reside na cidade: ${user.address?.city}"),
            ],
          ),
        ),
      ),
    );
  }
}
