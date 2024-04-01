// ignore_for_file: file_names

class AppColors{
  static const Map<String, int> _myColors = <String,int>{
    "screen_background_color":0xffF9F9F9,
    "login_title_color":0xff222222,
    "login_email_label_color":0xff9B9B9B,
  };

  static int? myColors(String colorIdx) => _myColors[colorIdx];
}