import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final data = [
      {'name': 'Jorge ramirez', 'email': 'Jorge@ramirez.com'},
      {'name': 'Maria ramirez', 'email': 'Maria@ramirez.com'},
      {'name': 'Jorge ramirez', 'email': 'Jorge@ramirez.com'},
      {'name': 'Maria ramirez', 'email': 'Maria@ramirez.com'},
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar')
      ),
      body: ListView(
        children: crearItemsCorto()
      ),
    );
  }

  List<Widget> crearItems () {
    List<Widget> clients = new  List<Widget>();

    for (final client in data) {
      final item = ListTile(
        title: Text(client['name']),
        subtitle: Text(client['email']),
      );

      clients..add(item)
             ..add(Divider());
    }

    return clients;
  }

  List<Widget> crearItemsCorto(){
    return data.map((client){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(client['name']),
            subtitle: Text(client['email']),
            leading: Icon(Icons.accessibility_new),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => print(client),
          ),
          Divider()
        ],
      );

    }).toList();
  }
}