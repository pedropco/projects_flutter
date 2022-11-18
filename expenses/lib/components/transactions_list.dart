import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'transaction_item.dart';
import 'transaction_empty.dart';

class TransactionList extends StatelessWidget {
  final List transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? const TransactionEmpty()
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index];
              return TransactionItem(
                  key: GlobalObjectKey(tr.id), tr: tr, onRemove: onRemove);
            },
          );
          //outra forma de fazer é como abaixo, com keylocal, mas q não funciona no listview builder
             // ListView(
    //     children: transactions.map((tr) {
    //       return TransactionItem(
    //         key: ValueKey(tr.id),
    //         tr: tr,
    //         onRemove: onRemove,
    //       );
    //     }).toList(),
    //   );
  }
}
