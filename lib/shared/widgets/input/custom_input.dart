import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {

  final TextEditingController? controller;
  final int? maxLength;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Widget? icon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscure;
  final dynamic Function(dynamic)? onFormSubmitted;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool? readOnly;
  final void Function()? onTap;
  final TextAlign textAlign;

  const CustomInput({
    super.key,
    this.controller,
    this.label, 
    this.hint,
    this.errorMessage,
    this.focusNode, 
    this.onChanged, 
    this.validator, 
    this.icon, 
    this.obscure = false, 
    this.suffixIcon,
    this.onFormSubmitted,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.width = 300,
    this.height = 45,
    this.onTapOutside,
    this.readOnly,
    this.onTap,
    this.textAlign = TextAlign.start, 
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(164, 164, 164, 0.25),
            blurRadius: 7,
            offset: Offset(2, 3),
          ),
        ],
      ),
      width: width,
      height: height,
      child: TextFormField(
        maxLength: maxLength,
        onTap: onTap,
        readOnly: readOnly ?? false,
        onTapOutside: onTapOutside,
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscure,
        onFieldSubmitted: onFormSubmitted,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Color(0XFF222222),
        ),
        textAlign: textAlign,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          contentPadding: EdgeInsets.only(left: 0, right: 0, top: 27, bottom: 0),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide( color: Color.fromRGBO(0, 0, 0, 0.2) ),
            borderRadius: BorderRadius.circular(5)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide( color: Color(0xff293277) ),
            borderRadius: BorderRadius.circular(5)
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide( color: Color(0XFFEA5B5B) ),
            borderRadius: BorderRadius.circular(5),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide( color: Color(0XFFEA5B5B) ),
            borderRadius: BorderRadius.circular(5)
          ),
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Color(0XFFA3A3A3),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 0,
            maxHeight: 24,
          ),
          errorText: errorMessage,
          errorStyle: const TextStyle(height: -1, fontSize: 0),
          prefixIcon: icon,
          suffixIcon: suffixIcon,
        ),
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
      ),
    );
  }
}

// class UpperCaseTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     return newValue.copyWith(
//       text: newValue.text.toUpperCase(),
//       selection: newValue.selection,
//     );
//   }
// }
