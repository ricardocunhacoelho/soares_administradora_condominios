import 'package:flutter_test/flutter_test.dart';


void main() {
  test('Counter increments smoke test', () {
    // const string = '21042021';
    // DateTime generateDateForm(String date) {
    //   List<String> list = date.split('');

    //   String yearStr = '${list[4]}${list[5]}${list[6]}${list[7]}';
    //   int? year = int.tryParse(yearStr);
    //   String monthStr = '${list[2]}${list[3]}';
    //   int? month = int.tryParse(monthStr);
    //   String dayStr = '${list[0]}${list[1]}';
    //   int? day = int.tryParse(dayStr);
    //   return DateTime(year!, month!, day!);
    // }

    DateTime lastDayOfMonth(DateTime month) {
      var beginningNextMonth = (month.month < 12)
          ? new DateTime(month.year, month.month + 1, 1)
          : new DateTime(month.year + 1, 1, 1);
      return beginningNextMonth.subtract(new Duration(days: 1));
    }

    // final day = DateTime.january.toInt();
    // DateTime test = generateDateForm(string);
    print('dia do mes janeiro ${lastDayOfMonth(DateTime(2023, 2)).day}');
    // print(test.day);
    // print(day);
  });
}
