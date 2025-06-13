import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/routeGenerator.dart';

import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList
        .map((json) => User.fromJson(json as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Houve um erro ao carregar os usuários');
  }
}

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<User>> futureUsers;
  @override
  void initState() {
    super.initState();
    futureUsers = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("HTTP - Valentina Prado"),
      ),
      body: Center(
        child: Expanded(
          // child: Text(json),
          child: FutureBuilder<List<User>>(
            future: futureUsers,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(
                          "Nome: ${snapshot.data?[index].name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "Endereço: ${snapshot.data?[index].address?.street}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteGenerator.user,
                            arguments: snapshot.data?[index],
                          );
                        },
                      ),
                    );
                  },
                );
              } else {
                return Text(
                  '${snapshot.error}',
                  style: TextStyle(color: Colors.red),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
