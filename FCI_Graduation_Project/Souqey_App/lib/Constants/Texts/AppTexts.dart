// ignore_for_file: file_names

class AppTexts{
  static const Map<String, String> _myTexts = <String,String>{
    "SignupText":"Sign Up",
  };
  static const Map<String, String> _myImages = <String,String>{};

  static String? myTexts(String textIdx) => _myTexts[textIdx];

  static String? myImages(String imageIdx) => _myImages[imageIdx];

}