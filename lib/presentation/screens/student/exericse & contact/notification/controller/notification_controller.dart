import 'package:shater/core/controller/base_controller.dart';
import 'package:shater/core/network/api_client.dart';
import 'package:shater/data/model/notification_model.dart';
import 'package:shater/data/repository/notification_repository_remote.dart';
import 'package:shater/domain/usecase/notification_usecase_imp.dart';

class NotificationController extends BaseController {
  NotificationUseCaseImp? _notificationUseCaseImp;

  List<NotificationModel> _notifications = [];
  List<NotificationModel> get notifications => _notifications;

  @override
  void onInit() {
    super.onInit();
    _notificationUseCaseImp =
        NotificationUseCaseImp(NotificationRepositoryRemote(ApiClient()));
        fetchNotifications();
  }

  void fetchNotifications() async {
    updateViewType(ViewType.loading);
    await _notificationUseCaseImp?.fetchNotification().then((value) {
      value?.fold((l) {
        handelError(l);
      }, (r) {
        _notifications = r;
        updateViewType(ViewType.success);
            });

      update();
    });
  }
}
