import 'package:flutter_test/flutter_test.dart';

void main() {
  
  test('deve converter uma String em varias', () {
    const string = '21042021';
    DateTime generateDateForm(String date) {
      List<String> list = date.split('');

      String yearStr = '${list[4]}${list[5]}${list[6]}${list[7]}';
      int? year = int.tryParse(yearStr);
      String monthStr = '${list[2]}${list[3]}';
      int? month = int.tryParse(monthStr);
      String dayStr = '${list[0]}${list[1]}';
      int? day = int.tryParse(dayStr);
      return DateTime(year!, month!, day!);
    }

    DateTime test = generateDateForm(string);
    print(test.day);
  });
}
