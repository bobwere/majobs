part of 'notification_messages_cubit.dart';

@freezed
abstract class NotificationsMessagesState with _$NotificationsMessagesState {
  const factory NotificationsMessagesState.initial() = Initial;
  const factory NotificationsMessagesState.loading() = Loading;
  const factory NotificationsMessagesState.success(
      KtList<NotificationMessageModel> notificationMsgs) = Success;
  const factory NotificationsMessagesState.failure(
      NotificationFailure failure) = Failure;
}
