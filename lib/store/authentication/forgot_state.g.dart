// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ForgotState on _ForgotState, Store {
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_ForgotState.isPasswordValid'))
          .value;
  Computed<bool>? _$isPhoneValidComputed;

  @override
  bool get isPhoneValid =>
      (_$isPhoneValidComputed ??= Computed<bool>(() => super.isPhoneValid,
              name: '_ForgotState.isPhoneValid'))
          .value;
  Computed<bool>? _$isCodeValidComputed;

  @override
  bool get isCodeValid =>
      (_$isCodeValidComputed ??= Computed<bool>(() => super.isCodeValid,
              name: '_ForgotState.isCodeValid'))
          .value;
  Computed<bool>? _$changeButtonEnabledComputed;

  @override
  bool get changeButtonEnabled => (_$changeButtonEnabledComputed ??=
          Computed<bool>(() => super.changeButtonEnabled,
              name: '_ForgotState.changeButtonEnabled'))
      .value;
  Computed<bool>? _$sendButtonEnabledComputed;

  @override
  bool get sendButtonEnabled => (_$sendButtonEnabledComputed ??= Computed<bool>(
          () => super.sendButtonEnabled,
          name: '_ForgotState.sendButtonEnabled'))
      .value;

  late final _$changePasswordErrorAtom =
      Atom(name: '_ForgotState.changePasswordError', context: context);

  @override
  String? get changePasswordError {
    _$changePasswordErrorAtom.reportRead();
    return super.changePasswordError;
  }

  @override
  set changePasswordError(String? value) {
    _$changePasswordErrorAtom.reportWrite(value, super.changePasswordError, () {
      super.changePasswordError = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_ForgotState.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$passwordRepeatAtom =
      Atom(name: '_ForgotState.passwordRepeat', context: context);

  @override
  String get passwordRepeat {
    _$passwordRepeatAtom.reportRead();
    return super.passwordRepeat;
  }

  @override
  set passwordRepeat(String value) {
    _$passwordRepeatAtom.reportWrite(value, super.passwordRepeat, () {
      super.passwordRepeat = value;
    });
  }

  late final _$phoneAtom = Atom(name: '_ForgotState.phone', context: context);

  @override
  PhoneNumber? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(PhoneNumber? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$codeAtom = Atom(name: '_ForgotState.code', context: context);

  @override
  String get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ForgotState.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$codeSentAtom =
      Atom(name: '_ForgotState.codeSent', context: context);

  @override
  String? get codeSent {
    _$codeSentAtom.reportRead();
    return super.codeSent;
  }

  @override
  set codeSent(String? value) {
    _$codeSentAtom.reportWrite(value, super.codeSent, () {
      super.codeSent = value;
    });
  }

  late final _$changePasswordAsyncAction =
      AsyncAction('_ForgotState.changePassword', context: context);

  @override
  Future<void> changePassword() {
    return _$changePasswordAsyncAction.run(() => super.changePassword());
  }

  late final _$getCodeAsyncAction =
      AsyncAction('_ForgotState.getCode', context: context);

  @override
  Future<void> getCode() {
    return _$getCodeAsyncAction.run(() => super.getCode());
  }

  late final _$_ForgotStateActionController =
      ActionController(name: '_ForgotState', context: context);

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_ForgotStateActionController.startAction(
        name: '_ForgotState.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_ForgotStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPasswordRepeat(String value) {
    final _$actionInfo = _$_ForgotStateActionController.startAction(
        name: '_ForgotState.setPasswordRepeat');
    try {
      return super.setPasswordRepeat(value);
    } finally {
      _$_ForgotStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(PhoneNumber value) {
    final _$actionInfo = _$_ForgotStateActionController.startAction(
        name: '_ForgotState.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_ForgotStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCode(String value) {
    final _$actionInfo = _$_ForgotStateActionController.startAction(
        name: '_ForgotState.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ForgotStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
changePasswordError: ${changePasswordError},
password: ${password},
passwordRepeat: ${passwordRepeat},
phone: ${phone},
code: ${code},
loading: ${loading},
codeSent: ${codeSent},
isPasswordValid: ${isPasswordValid},
isPhoneValid: ${isPhoneValid},
isCodeValid: ${isCodeValid},
changeButtonEnabled: ${changeButtonEnabled},
sendButtonEnabled: ${sendButtonEnabled}
    ''';
  }
}
