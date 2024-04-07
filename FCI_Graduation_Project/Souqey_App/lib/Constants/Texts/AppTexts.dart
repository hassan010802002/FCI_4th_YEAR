// ignore_for_file: file_names

class AppTexts {
  static const Map<String, String> _myTexts = <String, String>{
    "login": "Login",
    "loginEmailLabel": "Email",
    "loginPasswordLabel": "Password",
    "forgetPasswordText": 'Forgot your password?',
    "social_account_login_text": 'Or login with social account',
  };
  static const Map<String, String> _myImages = <String, String>{
    "google_icon": "Assets/Images/Group.png",
    "facebook_icon": "Assets/Images/facebook.png",
  };

  static String? myTexts(String textIdx) => _myTexts[textIdx];

  static String? myImages(String imageIdx) => _myImages[imageIdx];
}
