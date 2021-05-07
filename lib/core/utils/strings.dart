class AppStrings {
  //Core App Strings

  static final String appName = 'WOCA Task Man';

  //Dashboard Strings

  static final String dashboardTitle = 'Home';

  //SignUp page strings
  static final String signUpTitle = 'Create Task Manager Admin Account';
  static final String signUpPageName = 'Name';
  static final String signUpPageOrgName = 'Organization Name';
  static final String signUpPageEmail = 'Email';
  static final String signUpPagePassword = 'Password';
  static final String signUpPageConfirmPassword = 'Confirm Password';
  static final String signUpPageRegisterText = 'Register';
  static final String signUpPageSignInText = 'Sign In';
  static final String existingOrgText = 'to an exisiting Organization';
  static final String orText = 'OR';
  ///////////////////////////////////////////////////////////////////////

  //Verification page strings
  static final String verificationPageText = 'Verify your account';
  static final String verificationPageEnterCodeText = 'Enter 6 digit code';
  static final String verificationButtonText = 'Verify';
  static final String newRegOrgText =
      'Register a new organization with a different email';
  //////////////////////////////////////////////////////////////////////

  //SignInPage strings
  static final String signInPageSignInText = 'Sign In';
  static final String newOrgText = 'a new organization';

  /////////////////////////////////////////////////////////////////////
  //FormText
  static final String projectHasNoName = 'Project needs a Name';
  static final String addModule = 'Add Modules to Project';

  //API EndPoints
  static final String base = 'https://woca-task.herokuapp.com/api';
  static final String registerUser = '/register';
  static final String signInUser = '/login';
  static final String verifyUser = '/verify';
  static final String createDept = '/create-departments';
  static final String getDept = '/get-departments';
}

//Error Messages
const NO_INTERNET_ERROR_TITLE = 'No Internet';
const NO_INTERNET_ERROR_MESSAGE = 'Check your connection, then try again';
