import 'dart:io';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/notification_failure.dart';
import 'package:bonyeza_kazi/src/domain/notificationsettings/i_notifications_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_model.dart';
import 'package:bonyeza_kazi/src/infrastructure/notifications/models/notification_message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

@LazySingleton(as: INotificationsFacade)
class NotificationsFacade implements INotificationsFacade {
  NotificationsFacade(this._firestore, this._pref);

  final FirebaseFirestore _firestore;
  final SharedPreferences _pref;

  @override
  Future<Either<NotificationFailure, Unit>> setInboxMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"inboxmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> setJobUpdatesMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"jobupdatemessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> setBookingConfirmedMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"bookingconfirmedmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> setJobCompletedMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"jobcompletedmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> setJobRequestMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"jobrequestmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Future<Either<NotificationFailure, Unit>> setLeftAReviewMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"leaveareviewmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Stream<Either<NotificationFailure, Notifications>>
      getNotificationStatus() async* {
    final userID = _pref.getString(USER_ID);

    final userDocRef = _firestore.collection('users').doc(userID);

    final notDocRef = userDocRef
        .collection('notificationsettings')
        .doc('notificationsettings');

    yield* notDocRef
        .snapshots()
        .map(
          (doc) => right<NotificationFailure, Notifications>(
              Notifications.fromJson(doc.data())),
        )
        .onErrorReturnWith((e) {
      if (e is SocketException) {
        return left(const NotificationFailure.noInternet());
      } else {
        return left(const NotificationFailure.serverError());
      }
    });
  }

  @override
  Future<Either<NotificationFailure, Unit>> setBookingDeclinedMessages(
      bool status) async {
    try {
      final userID = _pref.getString(USER_ID);

      final userDocRef = _firestore.collection('users').doc(userID);

      final notDocRef = userDocRef
          .collection('notificationsettings')
          .doc('notificationsettings');

      notDocRef.update({"bookingdeclinedmessages": status});
      return right(unit);
    } on SocketException catch (e) {
      return left(const NotificationFailure.noInternet());
    } on FirebaseException catch (e) {
      return left(const NotificationFailure.serverError());
    }
  }

  @override
  Stream<Either<NotificationFailure, KtList<NotificationMessageModel>>>
      getNotificationFromLastSevendays() async* {
    final userID = _pref.getString(USER_ID);
    final userDocRef = _firestore.collection('users').doc(userID);

    final msgsDocRef = userDocRef.collection('notificationmessages');

    int startDate =
        DateTime.now().subtract(Duration(days: 7)).millisecondsSinceEpoch;

    yield* msgsDocRef
        .orderBy('time', descending: true)
        .where('time', isGreaterThan: startDate.toString())
        .snapshots()
        .map(
          (snapshot) =>
              right<NotificationFailure, KtList<NotificationMessageModel>>(
            snapshot.docs
                .map((doc) => NotificationMessageModel.fromJson(doc.data()))
                .toImmutableList(),
          ),
        )
        .onErrorReturnWith(
      (e) {
        if (e is SocketException) {
          return left(const NotificationFailure.noInternet());
        } else {
          return left(const NotificationFailure.serverError());
        }
      },
    );
  }
}
