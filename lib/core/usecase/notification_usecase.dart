import 'package:fpdart/fpdart.dart';
import 'package:shater/core/network/api_exceptions.dart';
import 'package:shater/data/model/notification_model.dart';

abstract class NotificationUseCase {
  Future<Either<ApiException, List<NotificationModel>>?> fetchNotification();
}
