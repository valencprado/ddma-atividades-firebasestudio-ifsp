import 'package:flutter/material.dart';
import 'package:myapp/routes/userScreen.dart';
import 'package:myapp/routes/home.dart';
import 'package:myapp/models/user.dart';

class RouteGenerator {
  static const String home = '/';
  static const String user = '/user';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => ListScreen());
      case user:
        if (settings.arguments is User) {
          final mago = settings.arguments as User;
          return MaterialPageRoute(builder: (_) => UserScreen(user: mago));
        }
        return _erroRota();
      default:
        return _erroRota();
    }
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: Text("Erro de Rota")),
            body: Center(child: Text("Rota não encontrada")),
          ),
    );
  }
}
