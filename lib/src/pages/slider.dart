import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double sliderValue = 100.0;
  bool blockSlider = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider page'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            crearSlider(),
            crearChexbock(),
            crearScwitch(),
            Expanded(
              child: getImage(),
            ),
          ],
        ),
      ),
    );
  }

  //
  Widget crearSlider() {
    return Slider(
        value: sliderValue,
        min: 100.0,
        max: 400.0,
        activeColor: Colors.indigo,
        label: '$sliderValue', // no se ve porque no hay divisiones
        onChanged: (blockSlider)
            ? null
            : (value) {
                setState(() {
                  sliderValue = value;
                });
              });
  }

  Widget crearChexbock() {
    /*  return Checkbox(
        value: blockSlider,
        onChanged: (value) {
          setState(() {
            blockSlider = value;
          });
        }); */
    return CheckboxListTile(
        title: Text('Bloquear slider'),
        value: blockSlider,
        onChanged: (value) {
          setState(() {
            blockSlider = value;
          });
        });
  }

  Widget crearScwitch() {
    return SwitchListTile(
        title: Text('Bloquear slider'),
        value: blockSlider,
        onChanged: (value) {
          setState(() {
            blockSlider = value;
          });
        });
  }

  Widget getImage() {
    return Image(
      width: sliderValue,
      fit: BoxFit.contain,
      image: NetworkImage(
          'https://www.stickpng.com/assets/images/580b57fbd9996e24bc43c01d.png'),
    );
  }
}
