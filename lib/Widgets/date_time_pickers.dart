import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeForm extends StatefulWidget {
  @override
  _DateTimeFormState createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BasicDateField(),
          SizedBox(height: 8.0),
          BasicTimeField(),
          SizedBox(height: 8.0),
        ],
      ),
    );
  }
}

class BasicDateField extends StatelessWidget {
  final format = DateFormat("yyyy-MM-dd");

  var _date = TextEditingController();
  String getValues;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateTimeField(
          style: TextStyle(fontSize: 20),
          controller: _date,
          format: format,
          onShowPicker: (context, currentValue) {
            return showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                initialDate: currentValue ?? DateTime.now(),
                lastDate: DateTime(2100));
          },
          decoration: InputDecoration(
            labelText: 'Date (${format.pattern})',
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.black,
                width: 3,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            prefixIcon: Padding(
              child: IconTheme(
                data: IconThemeData(
                  color: Colors.black,
                ),
                child: Icon(Icons.date_range),
              ),
              padding: EdgeInsets.only(left: 30, right: 10),
            ),
          ),
        ),
      ],
    );
  }
}

class BasicTimeField extends StatelessWidget {
  final format = DateFormat("hh:mm a");

  var _time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateTimeField(
          style: TextStyle(fontSize: 20),
          controller: _time,
          format: format,
          onShowPicker: (context, currentValue) async {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.convert(time);
          },
          decoration: InputDecoration(
              labelText: 'Time (${format.pattern})',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: Icon(Icons.access_time),
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      ],
    );
  }
}

class IosStylePickers extends StatefulWidget {
  @override
  _IosStylePickersState createState() => _IosStylePickersState();
}

class _IosStylePickersState extends State<IosStylePickers> {
  final format = DateFormat("yyyy-MM-dd HH:mm");
  DateTime value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateTimeField(
          style: TextStyle(fontSize: 20),
          initialValue: value,
          format: format,
          onShowPicker: (context, currentValue) async {
            await showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return CupertinoDatePicker(
                    onDateTimeChanged: (DateTime date) {
                      value = date;
                    },
                  );
                });
            setState(() {});
            return value;
          },
          decoration: InputDecoration(
              labelText: 'iOS style pickers (${format.pattern})',
              labelStyle: TextStyle(
                color: Colors.black,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.black,
                  ),
                  child: Icon(Icons.date_range),
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      ],
    );
  }
}
