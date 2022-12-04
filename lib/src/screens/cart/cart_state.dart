import 'package:flutter/cupertino.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:mus_cart/src/models/cart.dart';
import 'package:built_value/standard_json_plugin.dart';

@screenState
class $CartState with ChangeNotifier implements ScreenState {
  late $Cart cart = Cart();
}
