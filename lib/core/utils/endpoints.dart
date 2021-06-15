class Endpoint {
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
}
