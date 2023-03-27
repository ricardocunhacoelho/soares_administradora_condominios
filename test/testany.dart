import 'package:flutter_test/flutter_test.dart';

void main() {

  test('deve converter uma String em varias', () {
    const string = '21042021';
    List<String> list = string.split('');
    print('dia ${list[0]}${list[1]} mês ${list[2]}${list[3]} ano ${list[6]}${list[7]}');

  });
}
