import 'package:flutter/material.dart';
import 'dart:async';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> numeros = new List();
  int ultimoNumero = 0;
  bool loading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    agregar10Imagenes();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas page'),
        ),
        body: Stack(
          children: <Widget>[
            crearLista(),
            crearLoading(),
          ],
        ));
  }

  Widget crearLista() {
    return RefreshIndicator(
      onRefresh: reset,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: numeros.length,
        itemBuilder: (BuildContext context, int index) {
          return FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage(
                'https://i.picsum.photos/id/${numeros[index]}/500/300.jpg'),
          );
        },
      ),
    );
  }

  Future<void> reset() {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      numeros.clear();
      ultimoNumero++;
      agregar10Imagenes();
    });

    return Future.delayed(duration);
  }

  Widget crearLoading() {
    if (loading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }

  void agregar10Imagenes() {
    for (var i = 1; i < 10; i++) {
      numeros.add(ultimoNumero++);
    }
    setState(() {});
  }

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });

    final duration = new Duration(seconds: 2);
    return new Timer(duration, getData);
  }

  getData() {
    loading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn,
    );

    agregar10Imagenes();
  }
}
