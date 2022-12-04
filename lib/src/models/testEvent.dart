import 'package:mustang_core/mustang_core.dart';

@appEvent
@appModel
class $Tile {

  @InitField('')
  @SerializeField(false)
  late String name;

  @InitField(0)
  late int value;
}