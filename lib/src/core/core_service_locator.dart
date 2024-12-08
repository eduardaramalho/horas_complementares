import 'package:firebase_auth/firebase_auth.dart';

import 'contracts/modules/module_service_locator.dart';
import 'services/services.dart';

class CoreServiceLocator extends ModuleServiceLocator {
  @override
  Future<void> registerBinds() async {
    ServiceLocator.instance.bindFactory<FirebaseAuth>(() => FirebaseAuth.instance);
    ServiceLocator.instance.bindFactory<IAuthService>(() => FirebaseAuthService(get()));
    ServiceLocator.instance.bindFactory<IHttpService>(() => DioHttpService(DioFactory().create()));
  }
}
