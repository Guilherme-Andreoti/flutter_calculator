import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Memory {
  static const String Operations = '+-/x%=*';
  String result = '0';
  final _buffer = [0.0,0.0]; 
  int _bufferIndex = 0; 
  bool _operationUsed = false;
  String _operation = null;  
  String history = '';

  void applyCommand(String label) {
    switch (label) {
      case 'AC':
        _clear();
        break;

      case 'DEL':
        if (result.length == 1)  
          result = '0';                
        else 
           result = result.substring(0,result.length - 1);
        break;       

      default:
      if (Operations.contains(label)){
        _setOperation(label); 
      }else{
        _addDigit(label);
      } 

    }

    if (_operation != null){
      if (_buffer[1].toString()!=''){
        history = _buffer[0].toString() + _operation + _buffer[1].toString();  
      }else
      {
        history = _buffer[0].toString() + _operation;  
      }
     
    }else{
      history = _buffer[0].toString(); 
    }

    
  }

  _addDigit(String digit){
    if(_operationUsed)result = '0'; 
    if (result == '0' && digit != '.') {
      result = '';
    }

    if ((digit == '.') && (result.contains('.'))){
      digit = '';
    }

    result += digit;
    _buffer[_bufferIndex] = double.parse(result);
    _operationUsed = false;

    
  }

  _setOperation(operacao){
    if(_bufferIndex == 0){
      if(operacao != '='){
        _bufferIndex++;
      }
       
    }else{
      if (operacao == '=' || !_operationUsed){
        _buffer[0] = _calculate(); 
        result = _buffer[0].toString();
        result = result.endsWith('.0') ? result.replaceAll('.0', '') : result; 
        // _buffer[1] = 0.0; 
      }
    }
    _operationUsed = true;

    if(operacao != '='){
      _operation = operacao;
    }

    // _operation = operacao;  
    
  }

  _clear() {
    result = '0';
    history = '';
    _buffer.setAll(0,[0.0,0.0]); 
    _bufferIndex = 0; 
    _operationUsed = false; 
    _operation = null; 
  }

  _calculate(){
    switch (_operation) {
      case '+': return _buffer[0] + _buffer[1]; 
      case '-': return _buffer[0] - _buffer[1];
      case '/': return _buffer[0] / _buffer[1];
      case '*': return _buffer[0] * _buffer[1];
      case '%': return _buffer[0] % _buffer[1];
      default : return _buffer[0]; 
    }
  }
}



