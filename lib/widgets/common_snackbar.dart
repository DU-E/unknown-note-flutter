import 'package:flutter/material.dart';

class CommonSnackbar extends SnackBar {
  CommonSnackbar(
    BuildContext context, {
    super.key,
    required super.content,
  }) : super(
          backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
          elevation: 0,
        );
}
