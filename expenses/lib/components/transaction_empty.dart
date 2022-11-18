import 'package:flutter/material.dart';

class TransactionEmpty extends StatelessWidget {
  const TransactionEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            SizedBox(
              height: constraints.maxHeight * 0.2,
              child: Text(
                "Nenhuma transação cadastrada",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.7,
              child: Image.asset(
                'assets/images/waiting.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        );
      },
    );
  }
}
