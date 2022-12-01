import 'package:uptodo/utility/regex/regex_utility.dart';

enum ERegisterInfoCheckResult {
  valid,
  userNameEmpty,
  userNameTooLong,
  userNameTooShort,
  userNameInvalidFormat,
  passwordEmpty,
  passwordTooLong,
  passwordTooShort,
  passwordConfirmEmpty,
  passwordNotConfirm,
}

class RegisterLoginModel {
  String? userName;
  String? password;
  String? passwordConfirm;

  ERegisterInfoCheckResult registerCheck() {
    ERegisterInfoCheckResult result = ERegisterInfoCheckResult.valid;
    var userNameValid = userName;
    if (userNameValid == null) {
      return ERegisterInfoCheckResult.userNameEmpty;
    }
    if (!RegexUtility.isChinesePhoneNumber(userNameValid)) {
      return ERegisterInfoCheckResult.userNameInvalidFormat;
    }
    if (userNameValid.length < 6) {
      return ERegisterInfoCheckResult.userNameTooShort;
    }
    if (userNameValid.length > 24) {
      return ERegisterInfoCheckResult.userNameTooLong;
    }
    var passwordValid = password;
    if (passwordValid == null) {
      return ERegisterInfoCheckResult.passwordEmpty;
    }
    if (passwordValid.length < 6) {
      return ERegisterInfoCheckResult.passwordTooShort;
    }
    if (passwordValid.length > 12) {
      return ERegisterInfoCheckResult.passwordTooLong;
    }
    var passwordConfirmValid = passwordConfirm;
    if (passwordConfirmValid == null) {
      return ERegisterInfoCheckResult.passwordConfirmEmpty;
    }
    if (passwordConfirmValid != passwordConfirm) {
      return ERegisterInfoCheckResult.passwordNotConfirm;
    }
    return result;
  }

  ERegisterInfoCheckResult loginCheck() {
    ERegisterInfoCheckResult result = ERegisterInfoCheckResult.valid;
    var userNameValid = userName;
    if (userNameValid == null) {
      return ERegisterInfoCheckResult.userNameEmpty;
    }
    if (!RegexUtility.isChinesePhoneNumber(userNameValid)) {
      return ERegisterInfoCheckResult.userNameInvalidFormat;
    }
    if (userNameValid.length < 6) {
      return ERegisterInfoCheckResult.userNameTooShort;
    }
    if (userNameValid.length > 24) {
      return ERegisterInfoCheckResult.userNameTooLong;
    }
    var passwordValid = password;
    if (passwordValid == null) {
      return ERegisterInfoCheckResult.passwordEmpty;
    }
    if (passwordValid.length < 6) {
      return ERegisterInfoCheckResult.passwordTooShort;
    }
    if (passwordValid.length > 12) {
      return ERegisterInfoCheckResult.passwordTooLong;
    }

    return result;
  }
}
