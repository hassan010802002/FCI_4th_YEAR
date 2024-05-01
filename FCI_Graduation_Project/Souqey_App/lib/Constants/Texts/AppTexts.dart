// ignore_for_file: file_names

class AppTexts {
  static const Map<String, String> _myTexts = <String, String>{
    "login": "Login",
    "loginEmailLabel": "Email",
    "signup_name_label": "Name",
    "loginPasswordLabel": "Password",
    "forgetPasswordText": 'Forgot your password?',
    "signup_account": 'Already have an account?',
    "social_account_login_text": 'Or login with social account',
    "signup": 'Sign Up',
    "forget_password_title": 'Forgot password',
    "forget_password_text2": 'Please, enter your email address. You will receive a link to create a new password via email.',
    "base_item_title1": 'Home',
    "base_item_title2": 'Shop',
    "base_item_title3": 'Bag',
    "base_item_title4": 'Favorites',
    "base_item_title5": 'Profile',
    "home_staggered_grid_text": 'Summer Sale',
    "check_button_text": 'Check',
    "fashion_sale_text": 'Fashion Sale',
    "view_all_button_text": 'View all',
  };
  static const Map<String, String> _myImages = <String, String>{
    "google_icon": "Assets/Images/Group.png",
    "facebook_icon": "Assets/Images/facebook.png",
    "base_item_home_icon1": "Assets/Images/home_activated.svg",
    "base_item_home_icon2": "Assets/Images/home_inactive.svg",
    "base_item_cart_icon1": "Assets/Images/cart_activated.svg",
    "base_item_cart_icon2": "Assets/Images/cart_inactive.svg",
    "base_item_bag_icon1": "Assets/Images/bag_activated.svg",
    "base_item_bag_icon2": "Assets/Images/bag_inactive.svg",
    "base_item_fav_icon1": "Assets/Images/favorite_activated.svg",
    "base_item_fav_icon2": "Assets/Images/favorite_inactive.svg",
    "base_item_profile_icon1": "Assets/Images/profile_activated.svg",
    "base_item_profile_icon2": "Assets/Images/profile_inactive.svg",
  };

  static String? myTexts(String textIdx) => _myTexts[textIdx];

  static String? myImages(String imageIdx) => _myImages[imageIdx];
}
