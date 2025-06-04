import 'package:flutter/material.dart';
import 'package:myapp/routes/feiticoScreen.dart';
import 'package:myapp/routes/listScreen.dart';
import 'package:myapp/models/mago.dart';

class RouteGenerator {
  static const String list = '/';
  static const String feiticos = '/feiticos';

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case list:
        return MaterialPageRoute(builder: (_) => ListScreen());
      case feiticos:
        if (settings.arguments is Mago) {
          final mago = settings.arguments as Mago;
          return MaterialPageRoute(builder: (_) => FeiticosScreen(mago: mago));
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
