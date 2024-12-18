import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'decoration_field.dart';

class EditField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  final bool optional;
  final String? error;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final double? borderRadius;
  final bool obscure;
  final String? value;

  const EditField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.optional = false,
    this.error,
    this.hintStyle,
    this.textStyle,
    this.borderRadius,
    this.obscure = false,
    this.value,
  });

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  late final TextEditingController _controller;
  late bool _obscure;
  String? _error;

  String get _hint =>
      widget.hint + (widget.optional ? ' (${'optional'.tr()})' : '');

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    if (widget.value != null) {
      _controller.text = widget.value!;
    }
    _error = widget.error;
    _obscure = widget.obscure ? true : false;
    _controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant EditField oldWidget) {
    _error = widget.error;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (value) => FocusScope.of(context).unfocus(),
      controller: _controller,
      obscureText: _obscure,
      style: widget.textStyle ??
          context.theme.body1.copyWith(color: AppColors.black),
      onChanged: widget.onChanged,
      decoration: DecorationField(
        context: context,
        controller: _controller,
        hint: _hint,
        error: _error,
        borderRadius: widget.borderRadius,
        hintStyle: widget.hintStyle,
        textStyle: widget.textStyle,
        obscure: _obscure,
        onObscured:
            widget.obscure ? (value) => setState(() => _obscure = value) : null,
      ),
    );
  }
}
