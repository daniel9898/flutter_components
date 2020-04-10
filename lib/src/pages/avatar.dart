import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AvatarPage'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('DP'),
              backgroundColor: Colors.brown,
              foregroundColor: Colors.white,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  'https://ugc.kn3.net/i/760x/http://www.minutoneuquen.com/u/fotografias/fotosnoticias/2014/9/19/67946.jpg'),
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://cdn.tn.com.ar/sites/default/files/styles/1366x765/public/2020/03/07/carlos_tevez.jpg')),
      ),
    );
  }
}
