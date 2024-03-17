// ignore_for_file: file_names

class AppColors{
  static const Map<String, int> _myColors = <String,int>{
    "screen_background_color":0xff1E1E1E,
  };

  static int? myColors(String colorIdx) => _myColors[colorIdx];
}