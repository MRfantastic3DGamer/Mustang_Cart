import 'package:mustang_core/mustang_core.dart';
import 'package:built_value/standard_json_plugin.dart';

@appModel
abstract class $Cart implements AppModel {
  // $Cart();
  @InitField([
    {"name": "Item1", "count": 0},
    {"name": "Item2", "count": 0},
    {"name": "Item3", "count": 0},
    {"name": "Item4", "count": 0},
    {"name": "Item5", "count": 0},
    {"name": "Item6", "count": 0},
  ])
  List<Map<String, dynamic>> tiles
  // = [];
  = [
    {"name": "Item1", "count": 0},
    {"name": "Item2", "count": 0},
    {"name": "Item3", "count": 0},
    {"name": "Item4", "count": 0},
    {"name": "Item5", "count": 0},
    {"name": "Item6", "count": 0},
  ];
}

class Cart extends $Cart {}
