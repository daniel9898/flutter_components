import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/helpers/icon_helpers.dart';

class HomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _getList(),
    );
  }

  Widget _getList() {
    return FutureBuilder(
      future: menuProvider.loadData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: getItems(snapshot.data, context),
        ); 
      }  
    );


  }

  List<Widget> getItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];
    
    data.forEach((opt) {
      final item = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones..add(item)
              ..add(Divider());

    });

    return opciones;
  }
}