import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController? controller;
  final int? maxLines;
  final bool error;
  final Color? background;
  final VoidCallback? onTap;
  final bool enable;
  final int? maxLength;
  final double? maxHeight;
  final double? verticalPadding;
  final String hint;
  final String? initialValue;
  final bool isNumber;
  final Widget? suffix;
  final Widget? prefix;
  final ValueChanged<String?>? onChange;

  const DefaultFormField({
    Key? key,
    this.controller,
    this.maxLines,
    this.maxLength,
    this.maxHeight,
    this.onChange,
    this.error = false,
    this.enable = true,
    this.isNumber = false,
    required this.hint,
    this.verticalPadding,
    this.suffix,
    this.onTap,
    this.background,
    this.initialValue,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        onTap: onTap,
        onChanged: onChange,
        enabled: enable,
        controller: controller,
        initialValue: initialValue,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        inputFormatters: isNumber
            ? [
                FilteringTextInputFormatter.allow(RegExp('[0-9]')),
              ]
            : [],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: verticalPadding ?? 0,
          ),
          fillColor: background,
          filled: background != null ? true : false,
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? 100,
          ),
          hintStyle: context.textTheme.headline6!
              .copyWith(fontSize: 18, color: const Color(0xFFc5c5c5)),
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: error ? const Color(0XFFAC2E2E) : const Color(0xFFe9e9e9),
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: error ? const Color(0XFFAC2E2E) : const Color(0xFFe9e9e9),
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: error ? const Color(0XFFAC2E2E) : const Color(0xFFe9e9e9),
            ),
            borderRadius: BorderRadius.circular(7.0),
          ),
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
      ),
    );
  }
}
