import 'package:denari_app/utils/extensions/extensions.dart';
import 'package:denari_app/utils/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

import 'decoration_field.dart';

class PhoneField extends StatefulWidget {
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<PhoneNumber>? onChanged;
  final bool optional;
  final String? error;

  const PhoneField({
    super.key,
    required this.hint,
    this.controller,
    this.onChanged,
    this.optional = false,
    this.error,
  });

  @override
  State<PhoneField> createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late final TextEditingController _controller;
  String? _error;

  String get _hint =>
      widget.hint + (widget.optional ? ' (${'optional'.tr()})' : '');

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();
    _error = widget.error;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PhoneField oldWidget) {
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
    return IntlPhoneField(
      controller: _controller,
      style: context.theme.headline5.copyWith(
        color: AppColors.black,
      ),
      disableLengthCheck: true,
      onChanged: widget.onChanged,
      decoration: DecorationField(
        context: context,
        controller: _controller,
        hint: _hint,
        error: _error,
      ),
    );
  }
}