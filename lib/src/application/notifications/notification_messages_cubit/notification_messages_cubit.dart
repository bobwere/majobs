import 'dart:async';
import 'package:bonyeza_kazi/common/failures/notification_failure.dart';
import 'package:bonyeza_kazi/src/domain/notificationsettings/i_notifications_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_message_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

part 'notification_messages_state.dart';
part 'notification_messages_cubit.freezed.dart';

@injectable
class NotificationMessagesCubit extends Cubit<NotificationsMessagesState> {
  NotificationMessagesCubit(this._iNotificationsFacade)
      : super(NotificationsMessagesState.initial());

  INotificationsFacade _iNotificationsFacade;

  StreamSubscription<
          Either<NotificationFailure, KtList<NotificationMessageModel>>>
      _notificationsMsgsStreamSubscription;

  void getNotificationsMsgs() async {
    emit(NotificationsMessagesState.loading());

    await _notificationsMsgsStreamSubscription?.cancel();
    _notificationsMsgsStreamSubscription = _iNotificationsFacade
        .getNotificationFromLastSevendays()
        .listen((failureOrNotificationsMsgs) {
      failureOrNotificationsMsgs.fold(
          (failure) => emit(NotificationsMessagesState.failure(failure)),
          (notificationMsgs) =>
              emit(NotificationsMessagesState.success(notificationMsgs)));
    });
  }

  @override
  Future<void> close() async {
    await _notificationsMsgsStreamSubscription?.cancel();
    return super.close();
  }
}
