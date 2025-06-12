import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/routeGenerator.dart';

final json = "";
final jsonConverted = jsonDecode(json) as Map<String, dynamic>;

final List<User> users =
    (jsonConverted['magos'] as List<dynamic>)
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

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
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    "Nome: ${users[index].name}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "Idade: ${users[index].address?.street}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteGenerator.user,
                      arguments: users[index],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
