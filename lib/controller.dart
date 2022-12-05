import 'package:get/get.dart';

class AnimalsController extends GetxController {
  var list = []
      .obs; // va a se una variable con una capacidad observable, que notifica de los cambios de esta
  add(item) => list.add(item);

  remove(index) => list.removeAt(index);
}
