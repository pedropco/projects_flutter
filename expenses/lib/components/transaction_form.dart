import 'package:expenses/components/adaptative_textfield.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_datepicker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  const TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate);
  }

  _DateChanged(newDate) {
    setState(() {
      _selectedDate = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AdaptativeTextField(_titleController, TextInputType.text,
                const InputDecoration(labelText: 'Título'), (_) => _submitForm()),
            AdaptativeTextField(
                _valueController,
                const TextInputType.numberWithOptions(decimal: true),
                const InputDecoration(labelText: 'R\$'),
                (_) => _submitForm()),
            AdaptativeDatePicker(_selectedDate, _DateChanged),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                AdaptativeButton('Adicionar valor', _submitForm),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
