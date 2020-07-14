import 'package:calculator/memory.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:share/share.dart';

class Calcuator extends StatefulWidget {
  @override
  _CalcuatorState createState() => _CalcuatorState();
}

class _CalcuatorState extends State<Calcuator> {
  final memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.share),
              onPressed: (){
                Share.share('Essa calculadora mt boa não está disponível para o Google Play :(');
              },
          ),
        ]
        
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildDisplay(),
          Divider(
            height: 0.2,
          ),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildDisplay() {
   
    return Expanded(
      
      child: Column(
        children: <Widget>[
          Container(
            child: AutoSizeText(
              memory.history,
              textAlign: TextAlign.left,
              maxLines: 1,
              minFontSize: 20,
              maxFontSize: 40,
              style: TextStyle( fontFamily: 'Calculator', fontSize: 80, color: Colors.black),
            ),
          ),
            Container(
            child: AutoSizeText(
              memory.result,
              textAlign: TextAlign.right,
              maxLines: 1,
              minFontSize: 20,
              maxFontSize: 90,
              style: TextStyle( fontFamily: 'Calculator', fontSize: 80, color: Colors.black),
            ),
          ),
        ]
      )
    );
  }

  _buildKeyboardButton(String label,
      {Color textColor = Colors.white, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        textColor: textColor,
        child: Text(
          label,
          style: TextStyle(fontSize: 24),
        ),
        onPressed:(){
          setState(() {
            memory.applyCommand(label);
          });
        },
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 420,
      color: Colors.black,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyboardButton('AC', textColor: Colors.red),
              _buildKeyboardButton('DEL', textColor: Colors.red),
              _buildKeyboardButton('%', textColor: Colors.red),
              _buildKeyboardButton('/', textColor: Colors.red),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyboardButton('7'),
              _buildKeyboardButton('8'),
              _buildKeyboardButton('9'),
              _buildKeyboardButton('*', textColor: Colors.red),
            ],
          )),
                    Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyboardButton('4'),
              _buildKeyboardButton('5'),
              _buildKeyboardButton('6'),
              _buildKeyboardButton('+', textColor: Colors.red),
            ],
          )),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyboardButton('1'),
              _buildKeyboardButton('2'),
              _buildKeyboardButton('3'),
              _buildKeyboardButton('-', textColor: Colors.red),
            ],
          )),
                    Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildKeyboardButton('0',flex: 2),
              _buildKeyboardButton('.'),
              _buildKeyboardButton('=', textColor: Colors.red),
            ],
          )),
        ],
      ),
    );
  }
}
