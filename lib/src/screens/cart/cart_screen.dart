import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:mustang_widgets/mustang_widgets.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'cart_state.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    $CartState cartState = MustangStore.get<$CartState>() ?? $CartState();
    return
        // StateProvider<$CartState>(
        //   state: cartState as $CartState,
        //   child: Placeholder(),
        //   );
        MustangScreen<$CartState>(
      state: cartState,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 1,
                child: ListView.builder(
                  itemCount: state.cart.tiles.length,
                  itemBuilder: (context, index) {
                    return ItemTile(
                      state: state,
                      index: index,
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemTile extends StatelessWidget {
  late $CartState state;
  late int index;
  ItemTile({super.key, required this.state, required this.index});
  late Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    item = state.cart.tiles[index];
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item["name"],
            style: const TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    state.cart.tiles[index]["count"]++;
                    (context as Element).markNeedsBuild();
                  },
                  icon: const Icon(Icons.add)),
              CircleAvatar(child: Text(item["count"].toString())),
              IconButton(
                onPressed: () {
                  if (state.cart.tiles[index]["count"] > 0) {
                    state.cart.tiles[index]["count"]--;
                    (context as Element).markNeedsBuild();
                  }
                },
                icon: const Icon(Icons.remove),
              ),
            ],
          )
        ],
      ),
    );
  }
}
