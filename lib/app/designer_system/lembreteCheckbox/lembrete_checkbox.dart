import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final ValueNotifier<bool> enabled;
  final ValueChanged<bool>? onChanged;
  final String text;

  const CustomCheckBox(
      {Key? key,
      this.isChecked = false,
      this.onChanged,
      required this.enabled,
      required this.text})
      : super(key: key);

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder<bool>(
            valueListenable: widget.enabled,
            builder: (context, enable, child) {
              return Checkbox(checkColor: Colors.white, activeColor: Colors.black,
                shape: shape,
                value: _isChecked,
                onChanged: enable ? onChanged : null,
              );
            }),
        Text(widget.text, style: textStyle),
      ],
    );
  }

  get textStyle => const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  get shape => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      );

  void onChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
      if (widget.onChanged != null) {
        widget.onChanged!(value ?? false);
      }
    });
  }
}
