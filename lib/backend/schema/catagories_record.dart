import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CatagoriesRecord extends FirestoreRecord {
  CatagoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "catagoryName" field.
  String? _catagoryName;
  String get catagoryName => _catagoryName ?? '';
  bool hasCatagoryName() => _catagoryName != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "subCatagoryRef" field.
  DocumentReference? _subCatagoryRef;
  DocumentReference? get subCatagoryRef => _subCatagoryRef;
  bool hasSubCatagoryRef() => _subCatagoryRef != null;

  // "subCatagories" field.
  List<DocumentReference>? _subCatagories;
  List<DocumentReference> get subCatagories => _subCatagories ?? const [];
  bool hasSubCatagories() => _subCatagories != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "catagoriesRef" field.
  DocumentReference? _catagoriesRef;
  DocumentReference? get catagoriesRef => _catagoriesRef;
  bool hasCatagoriesRef() => _catagoriesRef != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "orderPosition" field.
  List<int>? _orderPosition;
  List<int> get orderPosition => _orderPosition ?? const [];
  bool hasOrderPosition() => _orderPosition != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "imagePath" field.
  String? _imagePath;
  String get imagePath => _imagePath ?? '';
  bool hasImagePath() => _imagePath != null;

  void _initializeFields() {
    _catagoryName = snapshotData['catagoryName'] as String?;
    _slug = snapshotData['slug'] as String?;
    _id = snapshotData['id'] as String?;
    _subCatagoryRef = snapshotData['subCatagoryRef'] as DocumentReference?;
    _subCatagories = getDataList(snapshotData['subCatagories']);
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _catagoriesRef = snapshotData['catagoriesRef'] as DocumentReference?;
    _order = castToType<int>(snapshotData['order']);
    _orderPosition = getDataList(snapshotData['orderPosition']);
    _image = snapshotData['image'] as String?;
    _imagePath = snapshotData['imagePath'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Catagories');

  static Stream<CatagoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CatagoriesRecord.fromSnapshot(s));

  static Future<CatagoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CatagoriesRecord.fromSnapshot(s));

  static CatagoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CatagoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CatagoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CatagoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CatagoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CatagoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCatagoriesRecordData({
  String? catagoryName,
  String? slug,
  String? id,
  DocumentReference? subCatagoryRef,
  DateTime? createdAt,
  DocumentReference? catagoriesRef,
  int? order,
  String? image,
  String? imagePath,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catagoryName': catagoryName,
      'slug': slug,
      'id': id,
      'subCatagoryRef': subCatagoryRef,
      'createdAt': createdAt,
      'catagoriesRef': catagoriesRef,
      'order': order,
      'image': image,
      'imagePath': imagePath,
    }.withoutNulls,
  );

  return firestoreData;
}

class CatagoriesRecordDocumentEquality implements Equality<CatagoriesRecord> {
  const CatagoriesRecordDocumentEquality();

  @override
  bool equals(CatagoriesRecord? e1, CatagoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.catagoryName == e2?.catagoryName &&
        e1?.slug == e2?.slug &&
        e1?.id == e2?.id &&
        e1?.subCatagoryRef == e2?.subCatagoryRef &&
        listEquality.equals(e1?.subCatagories, e2?.subCatagories) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.catagoriesRef == e2?.catagoriesRef &&
        e1?.order == e2?.order &&
        listEquality.equals(e1?.orderPosition, e2?.orderPosition) &&
        e1?.image == e2?.image &&
        e1?.imagePath == e2?.imagePath;
  }

  @override
  int hash(CatagoriesRecord? e) => const ListEquality().hash([
        e?.catagoryName,
        e?.slug,
        e?.id,
        e?.subCatagoryRef,
        e?.subCatagories,
        e?.createdAt,
        e?.catagoriesRef,
        e?.order,
        e?.orderPosition,
        e?.image,
        e?.imagePath
      ]);

  @override
  bool isValidKey(Object? o) => o is CatagoriesRecord;
}
