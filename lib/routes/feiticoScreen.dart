import 'package:flutter/material.dart';
import 'package:myapp/models/feitico.dart';
import 'package:myapp/models/mago.dart';

class FeiticosScreen extends StatelessWidget {
  final Mago mago;
  const FeiticosScreen({super.key, required this.mago});

  @override
  Widget build(BuildContext context) {
    final List<Feitico> feiticos = mago.feiticos;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("JSON (auto) - Valentina Prado"),
      ),
      body: Center(
        child: Expanded(
          // child: Text(json),
          child: ListView.builder(
            itemCount: feiticos.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(
                    "Nome: ${feiticos[index].nome}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("Idade: ${feiticos[index].elemento}"),
                  onTap: () {
                    showDialog<String>(
                      context: context,
                      builder:
                          (BuildContext context) => AlertDialog(
                            insetPadding: EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            title: Text(
                              feiticos[index].descricao ?? 'Sem descrição',
                            ),
                          ),
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
