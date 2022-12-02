import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
   const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
     this.obscurePass = false,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool obscurePass;

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
        obscureText: isObscure,
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
