const String appName = 'ew_app';
const String baseUrl = 'http://ewbackendik.duckdns.org/';
const String baseApiUrl = '$baseUrl/api';

// Projects url`s
const String baseProjectsUrl = '/projects';
String apiProjectsTasksActiveUrl = "$baseApiUrl$baseProjectsUrl/projects-tasks-active/";
String apiProjectsShortInfoUrl = "$baseApiUrl$baseProjectsUrl/projects-short-info/";
String apiProjectInfoUrl = "$baseApiUrl$baseProjectsUrl/{id}/";
String apiProjectDeleteUrl = "$baseApiUrl$baseProjectsUrl/{id}/";
String apiProjectUpdateUrl = "$baseApiUrl$baseProjectsUrl/{id}/";
String apiProjectCreateUrl = "$baseApiUrl$baseProjectsUrl/create/";

// Dashboards url`s
const String baseDashboardUrl = '/dashboard';
String apiDashboardCreateUrl = "$baseApiUrl$baseDashboardUrl/create/";
String apiDashboardInfoUrl = "$baseApiUrl$baseDashboardUrl/{id}/";
String apiDashboardUpdateUrl = "$baseApiUrl$baseDashboardUrl/{id}/";
String apiDashboardDeleteUrl = "$baseApiUrl$baseDashboardUrl/{id}/";

// Tasks url`s
const String baseTaskUrl = '/task';
String apiTaskCreateUrl = "$baseApiUrl$baseTaskUrl/create/";
// String apiTaskCreateInfoUrl = "$baseApiUrl$baseDashboardUrl/{id}/";
// String apiTaskCreateUpdateUrl = "$baseApiUrl$baseDashboardUrl/{id}/";
// String apiTaskCreateDeleteUrl = "$baseApiUrl$baseDashboardUrl/{id}/";

// Authentication url`s
const String baseAuthUrl = '/authentication';
String apiAuthLoginUrl = "$baseApiUrl$baseAuthUrl/login/";
String apiAuthUserDetailUrl = "$baseApiUrl$baseAuthUrl/user-details/";
String apiAuthRegisterUrl = "$baseApiUrl$baseAuthUrl/register-user/";
String apiAuthVerifyTokenUrl = "$baseApiUrl$baseAuthUrl/verify-token/";

// Images url`s
const String baseImageUrl = '/images-asset';
String apiImageDeleteUrl = "$baseApiUrl$baseImageUrl/{id}/";
String apiImageCreateUrl = "$baseApiUrl$baseImageUrl/add/";
