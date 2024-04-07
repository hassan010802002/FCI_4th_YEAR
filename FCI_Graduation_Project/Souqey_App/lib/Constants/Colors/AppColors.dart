// ignore_for_file: file_names

class AppColors {
  static const Map<String, int> _myColors = <String, int>{
    "screen_background_color": 0xffF9F9F9,
    "login_title_color": 0xff222222,
    "login_email_label_color": 0xff9B9B9B,
    "login_forget_password_icon_color": 0xffDB3022,
  };

  static int? myColors(String colorIdx) => _myColors[colorIdx];
}
