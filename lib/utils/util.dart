import 'package:uuid/uuid.dart';

class Util {
  static String getId() {
    Uuid uuid = Uuid();
    uuid.v4();
  }
}