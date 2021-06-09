class AppStrings {
  //Core App Strings

  static final String appName = 'WOCA Task Man';
  static final String logoText = '!Give this app a Logo',
      firstPageText = 'Complete Projects The Right Way...',
      descriptionText = 'Description',
      confirmDeleteText = 'Confirm Delete',
      deleteText = 'Delete',
      sureToDeleteText = 'Are you sure you want to delete?',
      statusText = 'Status',
      noText = 'No',
      yesText = 'Yes';

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
      addDepartmentText = 'Add Department',
      createADepartmentText = 'Create a Department',
      departmentNameText = 'Department Name',
      validatorEnterDescriptionText = 'Enter a Description',
      validatorEnterAddressText = 'Enter Company Address',
      createDeptText = 'Create Department',
      searchForDeptText = 'Search for department';

  //////////////////////////////////////////////////////////////////////
  //Project page Strings
  static final String projectText = 'Projects',
      createProjectString = 'Create Project',
      createAProjectString = 'Create a Project',
      projectNameString = 'Project Name',
      addExistingModuleString = 'Add Existing Modules',
      projectCreated = 'Project Created',
      addExistingProjectsText = 'Add Existing Projects';

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
      companyCreatedText = 'Company Created',
      removeText = 'remove';
  //////////////////////////////////////////////////////////////////////

  //ModulePage Strings
  static final String createModuleString = 'Create Module',
      createAModuleString = 'Create a Module',
      modulesString = 'Modules',
      updateModuleString = 'Update Module',
      moduleNameString = 'Module Name',
      moduleNameValidatorString = 'Enter a name',
      addExistingTasksString = 'Add Existing Tasks',
      tasksString = 'Tasks',
      moduleCreated = 'Module Created';

  //////////////////////////////////////////////////////////////////////
  //TaskPage Strings
  static final String createTaskString = 'Create Task',
      updateTaskString = 'Update Task',
      taskCreated = 'Task Created Successfully',
      taskUpdated = 'Task Updated Successfully',
      editTaskString = 'Edit Task',
      taskTitleString = 'Task Title',
      attachmentString = 'Attachments(optional)',
      addAttachmentString = 'Add Attachments',
      removeAllString = 'remove all',
      fileString = 'File: ',
      startString = 'Start',
      completeString = 'Completed',
      selectDeadline = 'Select Deadline:',
      chooseDeadline = 'Choose Deadline';

  //////////////////////////////////////////////////////////////////////

  //UsersPage Strings
  static final String usersText = 'Users', addUsersText = 'Add Users';

  //////////////////////////////////////////////////////////////////////
  //API EndPoints
  static final String base = 'https://woca-task.herokuapp.com/api';
  static final String registerUser = '/register';
  static final String signInUser = '/login';
  static final String verifyUser = '/verify';

  //Company Endpoints
  static final String getCompanies = '/list-companies',
      createCompany = '/create-company',
      updateCompany = '/update-company',
      deleteCompany = '/delete-company',
      getOneCompany = '/list-companies';

  //Department Endpoints
  static final String createDepartment = '/create-depts',
      updateDepartment = '/update-dept',
      getDepartments = '/list-departments',
      getOneDepartment = '/list-departments',
      deleteDepartment = '/delete-department';

  //Project Endpoints
  static final String createProject = '/create-project',
      getProjects = '/list-projects',
      getOneProject = '/list-projects',
      deleteProject = '/delete-project',
      updateProject = '/update-project';

  //Module Endpoints
  static final String createModule = '/create-module',
      getModules = '/list-modules',
      getOneModule = '/list-modules',
      deleteModule = '/delete-module',
      updateModule = '/update-module';

  //Task Endpoints
  static final String createTask = '/create-task',
      startTask = '/task-start',
      suspendTask = '/suspend-task',
      finishTask = '/finish-task',
      deleteTask = '/delete-task',
      resetTask = 'finish-task',
      getTasks = '/list-tasks',
      getOneTask = '/list-tasks',
      updateTask = '/update-task';

//////////////////////////////////////////////////////////////////////

  //AssetStrings
  static final String loginImage = 'lib/core/assets/testone.jpg';

/////////////////////////////////////////////////////////////////////

//ErrorStrings
  static final String timeOutTitleString = 'TimeOut Error',
      timeOutMessageString = 'request timed out';
}

//Error Messages
const NO_INTERNET_ERROR_TITLE = 'No Internet';
const NO_INTERNET_ERROR_MESSAGE = 'Check your connection, then try again';
