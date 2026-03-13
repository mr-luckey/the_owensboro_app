// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatagoryStruct extends FFFirebaseStruct {
  CatagoryStruct({
    String? name,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static CatagoryStruct fromMap(Map<String, dynamic> data) => CatagoryStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  static CatagoryStruct? maybeFromMap(dynamic data) =>
      data is Map ? CatagoryStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static CatagoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CatagoryStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CatagoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CatagoryStruct && name == other.name && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id]);
}

CatagoryStruct createCatagoryStruct({
  String? name,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CatagoryStruct(
      name: name,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CatagoryStruct? updateCatagoryStruct(
  CatagoryStruct? catagory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    catagory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCatagoryStructData(
  Map<String, dynamic> firestoreData,
  CatagoryStruct? catagory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (catagory == null) {
    return;
  }
  if (catagory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && catagory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final catagoryData = getCatagoryFirestoreData(catagory, forFieldValue);
  final nestedData = catagoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = catagory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCatagoryFirestoreData(
  CatagoryStruct? catagory, [
  bool forFieldValue = false,
]) {
  if (catagory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(catagory.toMap());

  // Add any Firestore field values
  catagory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCatagoryListFirestoreData(
  List<CatagoryStruct>? catagorys,
) =>
    catagorys?.map((e) => getCatagoryFirestoreData(e, true)).toList() ?? [];
