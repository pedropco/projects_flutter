import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChanged;

  const AdaptativeDatePicker(this.selectedDate, this.onDateChanged,
      {super.key});

  _showDatePicker(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoDatePicker(
      mode:CupertinoDatePickerMode.date,
      initialDateTime: DateTime.now(),
      minimumDate: DateTime(2019),
      maximumDate: DateTime.now(),
      onDateTimeChanged: onDateChanged)
    : 
    Container(
      height: 70,
      child: Row(
        children: [
          Expanded(
            child: Text('Data: ${DateFormat('dd/MM/y').format(selectedDate)}'),
          ),
          TextButton(
            onPressed: () => _showDatePicker(context),
            child: const Text('Selecionar data',
                style: TextStyle(
                    color: Colors.purple, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
