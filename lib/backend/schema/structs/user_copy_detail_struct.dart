// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserCopyDetailStruct extends FFFirebaseStruct {
  UserCopyDetailStruct({
    String? name,
    String? email,
    String? phoneNumber,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _email = email,
        _phoneNumber = phoneNumber,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "phoneNumber" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;

  bool hasPhoneNumber() => _phoneNumber != null;

  static UserCopyDetailStruct fromMap(Map<String, dynamic> data) =>
      UserCopyDetailStruct(
        name: data['name'] as String?,
        email: data['email'] as String?,
        phoneNumber: data['phoneNumber'] as String?,
      );

  static UserCopyDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? UserCopyDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'email': _email,
        'phoneNumber': _phoneNumber,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'phoneNumber': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserCopyDetailStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserCopyDetailStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phoneNumber'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserCopyDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserCopyDetailStruct &&
        name == other.name &&
        email == other.email &&
        phoneNumber == other.phoneNumber;
  }

  @override
  int get hashCode => const ListEquality().hash([name, email, phoneNumber]);
}

UserCopyDetailStruct createUserCopyDetailStruct({
  String? name,
  String? email,
  String? phoneNumber,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserCopyDetailStruct(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserCopyDetailStruct? updateUserCopyDetailStruct(
  UserCopyDetailStruct? userCopyDetail, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userCopyDetail
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserCopyDetailStructData(
  Map<String, dynamic> firestoreData,
  UserCopyDetailStruct? userCopyDetail,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userCopyDetail == null) {
    return;
  }
  if (userCopyDetail.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userCopyDetail.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userCopyDetailData =
      getUserCopyDetailFirestoreData(userCopyDetail, forFieldValue);
  final nestedData =
      userCopyDetailData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userCopyDetail.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserCopyDetailFirestoreData(
  UserCopyDetailStruct? userCopyDetail, [
  bool forFieldValue = false,
]) {
  if (userCopyDetail == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userCopyDetail.toMap());

  // Add any Firestore field values
  userCopyDetail.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserCopyDetailListFirestoreData(
  List<UserCopyDetailStruct>? userCopyDetails,
) =>
    userCopyDetails
        ?.map((e) => getUserCopyDetailFirestoreData(e, true))
        .toList() ??
    [];
