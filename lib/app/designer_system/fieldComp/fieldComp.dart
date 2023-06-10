import 'package:flutter/material.dart';

import 'controller.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.marginButton,
    this.onChanged,
    this.validator,
    this.enabled,
    this.obscureText,
    this.isValid,
  }) : super(key: key);

  final TextEditingController controller;
  final ValueNotifier<bool>? enabled;
  final ValueNotifier<bool>? obscureText;
  final String labelText;
  final Icon prefixIcon;
  final double marginButton;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final ValueNotifier<bool>? isValid;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.marginButton),
      child: AnimatedBuilder(
        animation: Listenable.merge([
          widget.enabled,
          widget.obscureText,
          widget.isValid,
        ]),
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.labelText),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: TextFormField(
                    validator: widget.validator,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: widget.controller,
                    obscureText: widget.obscureText?.value ?? false,
                    enabled: widget.enabled?.value ?? true,
                    onChanged: widget.onChanged,
                    decoration: InputDecoration(
                      prefixIcon: widget.prefixIcon,
                      border: InputBorder.none,
                      hintText: 'Digite algo...',
                      contentPadding: const EdgeInsets.all(16.0),
                    )),
              ),
            ],
          );
        },
      ),
    );
  }
}
