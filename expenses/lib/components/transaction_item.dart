import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.onRemove,
  }) : super(key: key);

  final tr;
  final void Function(String p1) onRemove;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const colors = [
    Colors.blue,
    Colors.red,
    Colors.yellow,
    Colors.brown,
    Colors.pink
  ];

  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('R\$${widget.tr.value}',
                    style: const TextStyle(color: Colors.white)),
              ),
            ),
          ),
          title: Text(
            widget.tr.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(DateFormat('d MMM y').format(widget.tr.date)),
          trailing: MediaQuery.of(context).size.width > 480
              ? TextButton.icon(
                  onPressed: (() => widget.onRemove(widget.tr.id)),
                  label: const Text(
                    "Excluir",
                  ),
                  icon: const Icon(Icons.delete),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                )
              : IconButton(
                  onPressed: (() => widget.onRemove(widget.tr.id)),
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                )),
    );
  }
}
