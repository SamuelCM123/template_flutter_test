import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInputPassword extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Widget? icon;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool obscure;
  final dynamic Function(dynamic)? onFormSubmited;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double? width;
  final double? height;
  final Widget? errorWidget;
  final void Function(PointerDownEvent)? onTapOutside;

  const CustomInputPassword({
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
    this.onFormSubmited,
    this.initialValue,
    this.inputFormatters,
    this.keyboardType,
    this.width = 300,
    this.height = 45,
    this.onTapOutside,
    this.errorWidget,
  });

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onTextChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    // final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              width: widget.width,
              height: widget.height,
              child: TextFormField(
                onTapOutside: widget.onTapOutside,
                controller: widget.controller,
                initialValue: widget.initialValue,
                focusNode: widget.focusNode,
                onChanged: widget.onChanged,
                validator: widget.validator,
                obscureText: widget.obscure,
                onFieldSubmitted: widget.onFormSubmited,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0XFF222222),
                ),
                decoration: InputDecoration(
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.only(
                    left: 0,
                    right: 0,
                    top: 27,
                    bottom: 0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff293277)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFFEA5B5B)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0XFFEA5B5B)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  isDense: true,
                  label: widget.label != null ? Text(widget.label!) : null,
                  hintText: widget.hint,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFFA3A3A3),
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 0,
                    maxHeight: 24,
                  ),
                  errorText: widget.errorMessage,
                  errorStyle: const TextStyle(height: -1, fontSize: 0),
                  prefixIcon: widget.icon,
                  suffixIcon: widget.suffixIcon,
                ),
                inputFormatters: widget.inputFormatters,
                keyboardType: widget.keyboardType,
              ),
            ),
            widget.errorWidget ?? SizedBox(height: 15),
          ],
        ),
        Column(
          children: [
            Row(
              spacing: 5,
              children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: RegExp(r'[a-z]').hasMatch(widget.controller!.text) ? Color(0xFF77BC79) : Color(0XFFA3A3A3),
                    size: 18,
                  ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF293277)),
                    text: 'Al menos una letra minúscula',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: RegExp(r'[A-Z]').hasMatch(widget.controller!.text) ? Color(0xFF77BC79) : Color(0XFFA3A3A3),
                  size: 18,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF293277)),
                    text: 'Al menos una letra mayúscula',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: RegExp(r'\d').hasMatch(widget.controller!.text) ? Color(0xFF77BC79) : Color(0XFFA3A3A3),
                  size: 18,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF293277)),
                    text: 'Al menos un dígito numérico',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: RegExp(r'[\+×÷=\/_<>\[\]¡!@#\$%&*\(\)\^\-:;,\.¿?~|\{\}]').hasMatch(widget.controller!.text)
                      ? Color(0xFF77BC79)
                      : Color(0XFFA3A3A3),
                  size: 18,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF293277)),
                    text: 'Al menos un carácter especial (!#\$%&*.@;)',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 5,
              children: [
                Icon(
                  Icons.check_circle_outline_rounded,
                  color: widget.controller!.text.length >= 8 ? Color(0xFF77BC79) : Color(0XFFA3A3A3),
                  size: 18,
                ),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(fontSize: 12, color: Color(0xFF293277)),
                    text: 'Mínimo 8 caracteres',
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
