
import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/core/repository/notification_repository.dart';
import 'package:shater/core/usecase/notification_usecase.dart';
import 'package:shater/data/model/notification_model.dart';

class NotificationUseCaseImp extends NotificationUseCase {
  final NotificationRepository _notificationRepository;

  NotificationUseCaseImp(this._notificationRepository);

  @override
  Future<Either<ApiException, List<NotificationModel>>?> fetchNotification() {
   return _notificationRepository.fetchNotification();
  }

  

 
}