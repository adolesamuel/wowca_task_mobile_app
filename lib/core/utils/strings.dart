class AppStrings {
  //Core App Strings

  static final String appName = 'WOCA Task Man';
  static final String logoText = '!Give this app a Logo',
      firstPageText = 'Complete Projects The Right Way...',
      statusText = 'Status';

  //Dashboard Strings

  static final String dashboardTitle = 'Home';

  //SignUp page strings
  static final String signUpTitle = 'Create Task Manager Account';
  static final String signUpPageName = 'Name';
  static final String signUpPageEmail = 'Email';
  static final String signUpPagePassword = 'Password';
  static final String signUpPageConfirmPassword = 'Confirm Password';
  static final String signUpPageRegisterText = 'Register';
  static final String signUpPageSignInText = 'Sign In';
  static final String existingOrgText = 'to an exisiting Organization';
  static final String orText = 'OR';
  static final String validatorNameText = 'Please enter a Name';
  static final String validatorEnterEmailText = 'Please enter an Email';
  static final String validatorValidEmailText = 'Enter a valid Email';
  static final String validatorValidPasswordText = 'Please enter password';
  static final String validatorSamePasswordText = 'Passwords are not the same';
  ///////////////////////////////////////////////////////////////////////

  //Verification page strings
  static final String verificationPageText = 'Verify your account';
  static final String verificationPageEnterCodeText = 'Enter 6 Letter code';
  static final String verificationButtonText = 'Verify';
  static final String newRegOrgText = 'Register with a different email',
      codeSentToText = 'Verification code sent to',
      validatorEnterCodeText = 'Please enter verification code',
      validatorEnterOnly6Letters = 'Please Enter only 6 Letters';

  //////////////////////////////////////////////////////////////////////
  //Department page Strings
  static final String departmentText = 'Departments',
      addDepartmentText = 'Add Department';

  //////////////////////////////////////////////////////////////////////

  //SignInPage strings
  static final String signInPageSignInText = 'Sign In';
  static final String newOrgText = 'a new organization';

  /////////////////////////////////////////////////////////////////////
  //FormText
  static final String projectHasNoName = 'Project needs a Name';
  static final String addModule = 'Add Modules to Project';

  //////////////////////////////////////////////////////////////////////

  //CompanyPage strings
  static final String companieString = 'Companies',
      companyNameText = 'Company Name',
      companyAddressText = 'Company Address',
      noCompanyAddressText = 'No Company Address',
      companyDescriptionText = 'Company Description',
      noCompanyDescriptionText = 'No Company Description',
      updateCompanyDetailsButtonText = 'Update Company Details',
      createCompanyText = 'Create Company',
      updateCompanyText = 'Update Company',
      logoCompanyText = 'Logo for the Company',
      pickImageText = 'Pick Image',
      removeText = 'remove';
  //////////////////////////////////////////////////////////////////////

  //UsersPage Strings
  static final String usersText = 'Users', addUsersText = 'Add Users';

  //////////////////////////////////////////////////////////////////////
  //API EndPoints
  static final String base = 'https://woca-task.herokuapp.com/api';
  static final String registerUser = '/register';
  static final String signInUser = '/login';
  static final String verifyUser = '/verify';
  static final String createDept = '/create-departments';
  static final String getDept = '/get-departments';

  //Company Endpoints
  static final String getCompanies = '/list-companies';

  //AssetStrings
  static final String loginImage = 'lib/core/assets/testone.jpg';
}

//Error Messages
const NO_INTERNET_ERROR_TITLE = 'No Internet';
const NO_INTERNET_ERROR_MESSAGE = 'Check your connection, then try again';
