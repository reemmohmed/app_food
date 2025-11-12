import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  const CustomTextForm({
    super.key,
    this.lableText,
    this.validator,
    this.keyboardType,
    this.passwordobscureText = false,
    this.obscuringCharacter = ".",
    this.controller,

    this.hintText, this.textInputAction, this.onFieldSubmitted,
    // this.suffixIcon,
  });
  final TextInputAction? textInputAction;
    final Function(String)? onFieldSubmitted; 

  final String? lableText;
  final String obscuringCharacter;
  final bool passwordobscureText;
  final TextInputType? keyboardType;
  // final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  final String? hintText;

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  late bool _obscureText;
  @override
  void initState() {
    _obscureText = widget.passwordobscureText;
    super.initState();
  }

  void toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
         onFieldSubmitted:widget. onFieldSubmitted,
      cursorHeight: 20,
      cursorColor: Colors.black,
      controller: widget.controller,

      obscureText: _obscureText,
               textInputAction: widget.textInputAction ?? TextInputAction.next,

      validator: (valu) {
        if (valu == null || valu.isEmpty) {
          return "this failed is requierd ${widget.hintText}";
        }
        return null;
      },
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          fontSize: 18,
          color: Colors.red, // 👈 هيظهر بوضوح
          fontWeight: FontWeight.bold,
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.black),

        suffixIcon: widget.passwordobscureText
            ? GestureDetector(
                onTap: toggleObscureText,
                child: Icon(
                  _obscureText ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  color: Colors.black,
                ),
              )
            : null,
        labelText: widget.lableText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.black,
        ),
        
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        

        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
