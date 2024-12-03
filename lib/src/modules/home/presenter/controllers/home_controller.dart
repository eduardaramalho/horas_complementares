import '../../../../core/contracts/app_notifier.dart';
import 'states/home_state.dart';

class HomeController extends AppNotifier<HomeState> {
  HomeController() : super(const InitialHomeState());
}
