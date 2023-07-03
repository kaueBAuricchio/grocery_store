import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
   const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
     this.inputFormatter,
     this.obscurePass = false,
     this.keyBoardType,
     this.initialValue,
     this.readOnly = false,
     this.validation,
     this.controller,
   }) : super(key: key);

  final IconData icon;
  final String label;
  final bool obscurePass;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyBoardType;
  final String? initialValue;
  final bool readOnly;
  final String? Function(String?)? validation;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.obscurePass;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        readOnly: widget.readOnly,
        controller: widget.controller,
        initialValue: widget.initialValue,
        obscureText: isObscure,
        inputFormatters: widget.inputFormatter,
        validator: widget.validation,
        keyboardType: widget.keyBoardType,
        decoration: InputDecoration(
          prefixIcon:  Icon(widget.icon),
          suffixIcon: widget.obscurePass ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.label,
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18)),
        ),
      ),
    );
  }
}
