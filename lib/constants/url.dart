const String appName = 'ew_app';
const String baseApiUrl = 'https://3c12-80-49-208-105.ngrok-free.app/api';

// Projects url`s
const String baseProjectsUrl = '/projects';
String apiActiveProjectsAndTasksUrl = "$baseApiUrl$baseProjectsUrl/projects-tasks-active/";

// Authentication url`s
const String baseAuthUrl = '/authentication';
String apiAuthLoginUrl = "$baseApiUrl$baseAuthUrl/login/";
String apiAuthUserDetailUrl = "$baseApiUrl$baseAuthUrl/user-details/";
String apiAuthRegisterUrl = "$baseApiUrl$baseAuthUrl/register-user/";
String apiAuthVerifyTokenUrl = "$baseApiUrl$baseAuthUrl/verify-token/";

