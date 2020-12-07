import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  final Function onSearch;
  final TextEditingController controller;
  
  const CustomForm({
    Key key,
    this.onSearch,
    this.controller,
  }) : super(key: key);

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  labelText: 'Usuário',
                  hintText: 'Informe o login de usuário',
                  labelStyle: TextStyle(color: Colors.black),
                  icon: Icon(Icons.error, color: Colors.red,),
                ),
                controller: widget.controller,
                cursorColor: Colors.black,
                validator: (value) {
                  if (value.isEmpty || value.length < 2) {
                    return "Por favor, preencha com um valor válido";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              width: 5,
            ),
            RaisedButton(
              color: Colors.black,
              child: const Text(
                'Buscar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  widget.onSearch();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
