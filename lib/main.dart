import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxejemplo/controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Getx Example :D',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.deepPurple),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final AnimalsController animalsController = Get.put(AnimalsController());
  List<String> animals = [
    '🐸 Rana',
    '🦁 Leon',
    '🐶 Perro',
    '🐱 Gato',
    '🦛 Hipopotamo',
    '🐻 Oso',
    '🐼 Panda',
    '🐭 Raton',
    '🦊 Zorro',
    '🐨 Koala',
    '🐷 Cerdito',
    '🐙 Pulpo',
    '🐬 Delfin'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //escuchar los cambios de animals controller
        body: GetX<AnimalsController>(
          init: animalsController,
          builder: (AnimalsController animalsCtrl) {
            return ListView.builder(
                itemCount: animalsCtrl.list.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(animalsCtrl.list[index],
                        style: Theme.of(context).textTheme.headline6),
                    trailing: IconButton(
                        onPressed: () => animalsCtrl.remove(index),
                        icon: Icon(Icons.close)),
                  );
                });
          },
        ),
        bottomNavigationBar: Container(
          height: 60,
          child: ElevatedButton(
            child: Text('AÑADIR ANIMAL',
                style: TextStyle(color: Colors.white, fontSize: 22)),
            onPressed: () {
              var rand = new Random();
              animalsController.add(animals[rand.nextInt(animals.length)]);
            },
          ),
        ),
      ),
    );
  }
}
