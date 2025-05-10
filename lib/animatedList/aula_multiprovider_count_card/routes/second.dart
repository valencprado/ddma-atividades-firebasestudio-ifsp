import 'package:flutter/material.dart';
import 'package:myapp/animatedList/aula_multiprovider_count_card/state/cart.dart';
import 'package:myapp/animatedList/aula_multiprovider_count_card/state/count.dart';
import 'package:provider/provider.dart';

class Second extends StatefulWidget {
  const Second({super.key});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multi Provider App (${context.watch<Count>().count})'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${context.watch<Cart>().count})'),
            Padding(
              padding: const EdgeInsets.all(0),
              child: AnimatedList(
                key: _listKey,
                shrinkWrap: true,
                initialItemCount: context.watch<Cart>().cart.length,
                itemBuilder: ((
                  BuildContext context,
                  int index,
                  Animation<double> animation,
                ) {
                  return Card(
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        context.watch<Cart>().cart[index],
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_floatingActionButton'),
        onPressed: () {
          final cart = context.read<Cart>();
          final index = cart.cart.length;
          cart.addItem('novo item ❤');
          _listKey.currentState!.insertItem(index);
        },
        tooltip: 'Adicionar novo item!',
        child: const Icon(Icons.add),
      ),
    );
  }
}
