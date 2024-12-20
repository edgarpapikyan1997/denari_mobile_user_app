// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomButtonState on _CustomButtonState, Store {
  late final _$isButtonEnabledAtom =
      Atom(name: '_CustomButtonState.isButtonEnabled', context: context);

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  late final _$indexAtom =
      Atom(name: '_CustomButtonState.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$_CustomButtonStateActionController =
      ActionController(name: '_CustomButtonState', context: context);

  @override
  void updateButton(bool newValue) {
    final _$actionInfo = _$_CustomButtonStateActionController.startAction(
        name: '_CustomButtonState.updateButton');
    try {
      return super.updateButton(newValue);
    } finally {
      _$_CustomButtonStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonEnabled: ${isButtonEnabled},
index: ${index}
    ''';
  }
}
