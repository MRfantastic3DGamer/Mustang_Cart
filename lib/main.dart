import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mus_cart/src/screens/cart/cart_screen.dart';
import 'package:mus_cart/src/screens/cart/cart_state.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:mustang_widgets/mustang_widgets.dart';

void main() async {
  MustangStore.config(isPersistent: true, storeName: "Cart app");
  log(MustangStore.hiveBox.toString());
  MustangStore.update($CartState());
  log(MustangStore.get<$CartState>()!.cart.tiles.toString());

  MustangStore.config(
    isPersistent: true,
    storeName: 'mustang-persistence',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
        body: Center(
          child: CartScreen(),
        ),
      ),
      navigatorObservers: [
        MustangRouteObserver.getInstance(),
      ],
    );
  }
}