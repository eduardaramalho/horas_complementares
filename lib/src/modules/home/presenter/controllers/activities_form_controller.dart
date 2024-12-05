import '../../../../core/contracts/app_notifier.dart';
import 'states/home_state.dart';

class ActivitiesFormController extends AppNotifier<HomeState> {
  ActivitiesFormController() : super(const InitialHomeState());
}
