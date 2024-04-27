// ignore_for_file: file_names, constant_identifier_names, non_constant_identifier_names

const String TextFontFamily = "Metropolis";
const String BoldTextFontFamily = "BoldMetropolis";

////////////////////////////////////API Data///////////////////////////////////////////
//Api BaseUrl: =>  https://ecommerce.routemisr.com/api/v1/
const String BaseApiUrl = "https://ecommerce.routemisr.com/api/v1/";
const String SignUpAuthEndPoint = "${BaseApiUrl}auth/signup";
const String LogInAuthEndPoint = "${BaseApiUrl}auth/signin";
const String resetForgetPasswordAuthEndPoint = "${BaseApiUrl}auth/forgotPasswords";
const String categoriesEndPoint = "${BaseApiUrl}categories";

///////////////////////////////////User Profile Data///////////////////////////////////
const String User_SignUp_Auth_Token = "User_SignUp_Auth_Token";
String? _UserSignUpToken;
set UserSignUpToken(String? signUpToken) => _UserSignUpToken = signUpToken;
String? get UserSignUpToken => _UserSignUpToken;

const String User_LogIn_Auth_Token = "User_LogIn_Auth_Token";
String? _UserLogInToken;
set UserLogInToken(String? logInToken) => _UserLogInToken = logInToken;
String? get UserLogInToken => _UserLogInToken;
