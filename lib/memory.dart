class Memory {
  String result = '0';

  void applyCommand(String label) {
    switch (label) {
      case 'AC':
        _clear();
        break;
      default:
        if (result == '0') {
          result = '';
        }

        result += label;
    }
  }

  _clear() {
    result = '0';
  }
}
