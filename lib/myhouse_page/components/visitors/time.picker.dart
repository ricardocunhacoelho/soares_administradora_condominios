import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({super.key});

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {

  TextEditingController _time = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay(hour: 23, minute: 15);
    Future<void> selectTime() async {
    TimeOfDay ? _picked =  await showTimePicker(context: context, initialTime: _timeOfDay);
    if(_picked != null){
      setState(() {
        _timeOfDay = _picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: 
        TextField(
          controller: _time,
          decoration: const InputDecoration(
              icon: Icon(Icons.punch_clock_rounded),
              labelText: "Selecione a hora"),
          onTap: () async {
            DateTime? pickeddate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101));
                if(pickeddate != null){
                  setState(() {
                    _time.text = DateFormat('dd-MM-yyyy').format(pickeddate);
                  });
                }
          },
        ),
      ),
    );
  }
}
