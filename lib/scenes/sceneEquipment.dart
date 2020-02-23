import 'package:flutter/material.dart';

class SceneEquipment extends StatefulWidget {
  @override
  _SceneEquipmentState createState() => _SceneEquipmentState();
}

List<List<String>> weights;

class _SceneEquipmentState extends State<SceneEquipment> {

  @override
  Widget build(BuildContext context) {

    weights =  ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My equipment',
        ),
      ),
      body: Container(
          child: BodyLayout(),
        //children: <Widget>[
          //Text((weights.length-1).toString()),
        //],
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _equipmentList(context);
  }
}

Widget _equipmentList(BuildContext context) {
  return ListView.builder(
    itemCount: weights.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(
          //index.toString(),
          weights[index][0] + weights[index][1] + " x " + weights[index][2],
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            '/stuff',
            arguments: weights[index],
          );
        },
      );
    },
  );
}