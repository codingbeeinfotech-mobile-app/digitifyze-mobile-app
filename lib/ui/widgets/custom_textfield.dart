import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputDecoration? decoration;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.prefix,
    this.suffixIcon,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.onChanged,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        // border: Border.all(color:  Color(0xffF4F4F4),width: 1.0),
        border: Border.all(color: Color(0xffE7E5ED),width: 1.0),
        boxShadow: [
          // BoxShadow(
          //   color: Colors.black.withOpacity(0.1), // Shadow color
          //   blurRadius: 1.0, // Smoothness of shadow
          //   spreadRadius: 1.0, // How far the shadow spreads
          //   offset: const Offset(0, 0), // Same shadow on all sides
          // ),
          BoxShadow(
            color: Color(0x5A6CEA).withOpacity(0.07), // Shadow color with 7% opacity
            offset: Offset(12, 26), // X and Y offset
            blurRadius: 50, // Blur radius
            spreadRadius: 0, // Spread radius
          ),

        ],
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        maxLength: maxLength,
        maxLines: maxLines,
        validator: validator,
        onChanged: onChanged,
        decoration: decoration ??
            InputDecoration(
              labelText: labelText,
              hintText: hintText,
              prefix: prefixIcon == null ? prefix : null, // Use `prefix` only if `prefixIcon` is not set
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              // filled: true,
              // fillColor: const Color(0xFFF4F4F4), // Background color
              hintStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: Color(0xff3B3B3B)),
              prefixIconConstraints: BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 25,
                minHeight: 25,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              // contentPadding: const EdgeInsets.symmetric(
              //   vertical: 15,
              //   horizontal: 20,
              // ),
            ),
      ),
    );
  }
}
