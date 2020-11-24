import 'dart:io';
import 'package:bonyeza_kazi/common/constants/strings.dart';
import 'package:bonyeza_kazi/common/failures/user_update_failure.dart';
import 'package:bonyeza_kazi/src/domain/update_user_profile/i_update_user_profile_interface.dart';
import 'package:bonyeza_kazi/src/infrastructure/update_user_profile/models/update_user_profile_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

part 'update_user_profile_state.dart';
part 'update_user_profile_cubit.freezed.dart';

@injectable
class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit(this._iUpdateUserProfileFacade, this._pref)
      : super(UpdateUserProfileState.initial());

  final IUpdateUserProfileFacade _iUpdateUserProfileFacade;
  final SharedPreferences _pref;
  List<String> listOfSkills = [];
  List<String> listOfIDS = [];

  void usernameChanged(String username) {
    emit(state.copyWith.call(
      username: username,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void userBio(String bio) {
    emit(state.copyWith.call(
      bio: bio,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void passwordChanged(String password) {
    emit(state.copyWith.call(
      password: password,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void cityChanged(String city) {
    emit(state.copyWith.call(
      city: city,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void locationChanged(String location) {
    emit(state.copyWith.call(
      location: location,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void phoneChanged(String phone) {
    emit(state.copyWith.call(
      phone: phone,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void skillChanged(String skill) {
    listOfSkills.add(skill);

    emit(state.copyWith.call(
      skill: listOfSkills,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void removeSkillChanged(String skill) {
    listOfSkills.remove(skill);

    emit(state.copyWith.call(
      skill: listOfSkills,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void photoChanged(File photo) {
    emit(state.copyWith.call(
      photo: photo,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void workPhotosChanged(List<Asset> photos) {
    emit(state.copyWith.call(
      workPhotos: photos,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void dialCodeChanged(String dialCode) {
    emit(state.copyWith.call(
      dialcode: dialCode,
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: none(),
    ));
  }

  void updateClientProfile() async {
    Either<UserUpdateFailure, UpdateUserProfileModelData> failureOrSuccess;
    String userID = _pref.getString(USER_ID);
    String phone = _pref.getString(USER_PHONE);
    String userName = _pref.getString(USER_NAME);

    emit(state.copyWith.call(
      isSubmitting: true,
      userUpdateFailureOrSuccessOption: none(),
    ));

    String myPhone;

    if (state.phone == '') {
      if (phone.contains("+")) {
        myPhone = phone.substring(4);
      } else {
        myPhone = phone;
      }
    } else {
      myPhone = state.phone;
    }

    failureOrSuccess = await _iUpdateUserProfileFacade.updateUserProfile(
      id: userID,
      dialcode: state.dialcode,
      phone: myPhone,
      username: state.username == '' ? userName : state.username,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void updateServiceProviderProfileSkills() async {
    Either<UserUpdateFailure, UpdateUserProfileModelData> failureOrSuccess;
    String userID = _pref.getString(USER_ID);
    List<String> defaultSkills = [];
    defaultSkills.add('1');

    emit(state.copyWith.call(
      isSubmitting: true,
      userUpdateFailureOrSuccessOption: none(),
    ));

    if (listOfSkills.isNotEmpty) {
      for (var seletedCategory in listOfSkills) {
        var categoryID = getCategoryID(seletedCategory);
        listOfIDS.add(categoryID);
      }
    }
    for (var item in listOfIDS) {
      print("skill" + item);
    }

    failureOrSuccess = await _iUpdateUserProfileFacade.updateUserProfileSKills(
      id: userID,
      skills: listOfIDS.isEmpty ? defaultSkills : listOfIDS,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));

    listOfIDS.clear();
  }

  void updateServiceProviderProfile() async {
    Either<UserUpdateFailure, UpdateUserProfileModelData> failureOrSuccess;
    String userID = _pref.getString(USER_ID);
    String phone = _pref.getString(USER_PHONE);
    String username = _pref.getString(USER_NAME);
    String location = _pref.getString(USER_LOCATION);
    String city = _pref.getString(USER_CITY);
    String bio = _pref.getString(USER_BIO) ?? ' ';

    String myPhone;

    if (state.phone == '') {
      if (phone.contains("+")) {
        myPhone = phone.substring(4).trim();
      } else {
        myPhone = phone.trim();
      }
    } else {
      myPhone = state.phone.trim();
    }

    emit(state.copyWith.call(
      isSubmitting: true,
      userUpdateFailureOrSuccessOption: none(),
    ));

    final workPhotos = await convertToMultipart(state.workPhotos);

    failureOrSuccess = await _iUpdateUserProfileFacade.updateUserProfile(
      id: userID,
      city: state.city == '' ? city : state.city,
      dialcode: state.dialcode,
      location: state.location == '' ? location : state.location,
      phone: myPhone,
      username: state.username == '' ? username : state.username,
      bio: state.bio.isEmpty ? bio : state.bio,
      images: workPhotos,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  void updateProfilePic() async {
    Either<UserUpdateFailure, UpdateUserProfileModelData> failureOrSuccess;
    String userID = _pref.getString(USER_ID);

    emit(state.copyWith.call(
      isSubmitting: true,
      userUpdateFailureOrSuccessOption: none(),
    ));

    failureOrSuccess = await _iUpdateUserProfileFacade.updateUserProfilePic(
      id: userID,
      photo: state.photo,
    );

    emit(state.copyWith.call(
      isSubmitting: false,
      userUpdateFailureOrSuccessOption: optionOf(failureOrSuccess),
    ));
  }

  Future<List<MultipartFile>> convertToMultipart(List<Asset> assets) async {
    List<MultipartFile> myWorkPhotos = [];
    for (var workPhoto in assets) {
      ByteData byteData = await workPhoto.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();
      MultipartFile multipartFile = MultipartFile.fromBytes(
        imageData,
        filename: Uuid().v1(),
      );
      myWorkPhotos.add(multipartFile);
    }
    return myWorkPhotos;
  }

  String getCategoryID(String seletedCategory) {
    switch (seletedCategory) {
      case "Plumbing":
        return '1';
        break;
      case "Electrician":
        return '2';
        break;
      case "Cleaning Services":
        return '3';
        break;
      case "Furniture Making and Repair":
        return '4';
        break;
      case "Laundry":
        return '3';
        break;
      case "Home Cleaning":
        return '11';
        break;
      case "Gardening":
        return '4';
        break;
      case "Fumigation":
        return '5';
        break;
      case "Repairs":
        return '6';
        break;
      case "Moving":
        return '15';
        break;

      default:
        return '1';
    }
  }
}
