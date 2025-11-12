
  import 'package:app_food/core/constants/app_color.dart';
import 'package:flutter/material.dart';

Future<dynamic> authDialow(BuildContext context) {
    return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (_) => const Center(
                  child: CircularProgressIndicator(color: Color.fromARGB(255, 18, 122, 213)),
                ),
              );
  }

