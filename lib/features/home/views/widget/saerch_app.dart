
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchApp extends StatelessWidget {
  const SearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),

      shadowColor: Colors.grey.withOpacity(1.0),
      elevation: 8,
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: "search",
          // focusColor: Colors.white,
          prefixIcon: Icon(CupertinoIcons.search),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),

            borderRadius: BorderRadius.circular(20),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),

            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
