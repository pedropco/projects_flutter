import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController keyBoardController;
  final TextInputType keyBoardType;
  final adaptativeDecoration;
  final Function(String)? onSubmit;

  const AdaptativeTextField(this.keyBoardController, this.keyBoardType,
      this.adaptativeDecoration, this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: keyBoardController,
              keyboardType: keyBoardType,
              decoration: adaptativeDecoration,
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: keyBoardController,
            keyboardType: keyBoardType,
            decoration: adaptativeDecoration,
            onSubmitted: onSubmit,
          );
  }
}
