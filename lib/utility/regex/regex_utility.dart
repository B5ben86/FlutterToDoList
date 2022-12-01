class RegexUtility {
  //邮箱判断
  static bool isEmailAddress(String email) {
    return RegExp(r"^\w+([-+.]\w+)*@\w+([-.]\w+)*.\w+([-.]\w+)*$")
        .hasMatch(email);
  }

  //国内电话号码判断
  static bool isChinesePhoneNumber(String phoneNumber) {
    return RegExp(
            r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$')
        .hasMatch(phoneNumber);
  }
}
