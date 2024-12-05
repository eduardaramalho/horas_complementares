enum Routes {
  splash('splash', '/'),
  auth('auth', '/auth'),
  home('home', '/home'),
  activitiesForm('activitiesForm', '/activitiesForm'),
  activityDetails('activityDetails', '/activityDetails'),
  ;

  final String name;
  final String path;

  const Routes(this.name, this.path);
}
