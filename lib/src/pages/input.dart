import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _date = '';

  List<String> poderes = ['volar', 'Rayos x ', 'Fumar'];
  String poderSeleccionado = 'volar';

  TextEditingController inputDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs Page'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearInputEmail(),
          Divider(),
          _crearInputPassword(),
          Divider(),
          _crearInputDate(context),
          Divider(),
          _crearInputDropDown(),
          _getPerson(),
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        suffixIcon: Icon(Icons.person),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
        });
      },
    );
  }

  Widget _crearInputEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Email',
        labelText: 'Email',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
        });
      },
    );
  }

  Widget _crearInputPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (value) {
        print(value);
      },
    );
  }

  Widget _crearInputDate(context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: inputDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.calendar_view_day),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectedDate(context);
      },
    );
  }

  _selectedDate(BuildContext context) async {
    DateTime selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
    );

    if (selectedDate != null) {
      setState(() {
        _date = selectedDate.toString();
        inputDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> list = new List();
    poderes.forEach((poder) => list.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        )));
    return list;
  }

  Widget _crearInputDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            value: poderSeleccionado,
            items: getOptions(),
            onChanged: (opt) {
              setState(() {
                poderSeleccionado = opt;
              });
            },
          ),
        )
      ],
    );
  }

  ListTile _getPerson() {
    return ListTile(
      title: Text(_nombre),
      subtitle: Text(_email),
    );
  }
}
