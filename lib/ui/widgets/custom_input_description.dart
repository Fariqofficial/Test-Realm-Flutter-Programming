// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_android_programming_apps/shared/themes.dart';
import 'package:test_android_programming_apps/utils/input.dart';
import 'package:uuid/uuid.dart';

class CustomInputDescription extends StatefulWidget {
  final String? id;
  final String label;
  final bool isShowLabel;
  final String? value;
  final String? Function(String?)? validator;
  final bool obscure;
  final int? maxLength;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;

  const CustomInputDescription({
    super.key,
    required this.label,
    this.id,
    this.isShowLabel = true,
    this.value,
    this.validator,
    this.maxLength,
    required this.onChanged,
    this.onSubmitted,
    this.obscure = false,
  });

  @override
  State<CustomInputDescription> createState() => _CustomInputDescriptionState();
}

class _CustomInputDescriptionState extends State<CustomInputDescription>
    implements InputControlState {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    Input.inputController[widget.id ?? const Uuid().v4()] = this;
    super.initState();
  }

  @override
  getValue() {
    return textEditingController.text;
  }

  @override
  setValue(value) {
    textEditingController.text = value;
  }

  @override
  resetValue() {
    textEditingController.text = "";
  }

  @override
  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isShowLabel)
          Text(
            widget.label,
            style: blackText.copyWith(
              fontWeight: medium,
            ),
          ),
        if (widget.isShowLabel) SizedBox(height: 12),
        TextFormField(
          textInputAction: TextInputAction.newline,
          obscureText: widget.obscure,
          controller: textEditingController,
          validator: widget.validator,
          maxLength: widget.maxLength,
          maxLines: 6,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            hintText: !widget.isShowLabel ? widget.label : null,
            contentPadding:
                EdgeInsets.only(bottom: 100, left: 12, right: 12, top: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          onChanged: (value) {
            widget.onChanged(value);
          },
          onFieldSubmitted: (value) {
            if (widget.onSubmitted != null) widget.onSubmitted!(value);
          },
        ),
      ],
    );
  }
}
