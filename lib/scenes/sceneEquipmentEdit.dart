import 'package:flutter/material.dart';

class SceneEquipmentEdit extends StatefulWidget {
  @override
  _SceneEquipmentEditState createState() => _SceneEquipmentEditState();
}

class _SceneEquipmentEditState extends State<SceneEquipmentEdit> {
  @override
  Widget build(BuildContext context) {
    List<String> weight = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text('Edit Weights')
        ),
        body: Text(
          weight[0].toString() + " " + weight[1].toString() + " " + weight[2].toString(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
        ),
    );
  }
}