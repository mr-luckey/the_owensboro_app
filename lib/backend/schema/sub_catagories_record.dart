import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCatagoriesRecord extends FirestoreRecord {
  SubCatagoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "catagoriesRef" field.
  DocumentReference? _catagoriesRef;
  DocumentReference? get catagoriesRef => _catagoriesRef;
  bool hasCatagoriesRef() => _catagoriesRef != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "selectedCatagory" field.
  String? _selectedCatagory;
  String get selectedCatagory => _selectedCatagory ?? '';
  bool hasSelectedCatagory() => _selectedCatagory != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "parentId" field.
  String? _parentId;
  String get parentId => _parentId ?? '';
  bool hasParentId() => _parentId != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  void _initializeFields() {
    _catagoriesRef = snapshotData['catagoriesRef'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _slug = snapshotData['slug'] as String?;
    _selectedCatagory = snapshotData['selectedCatagory'] as String?;
    _id = snapshotData['id'] as String?;
    _parentId = snapshotData['parentId'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _image = snapshotData['image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SubCatagories');

  static Stream<SubCatagoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubCatagoriesRecord.fromSnapshot(s));

  static Future<SubCatagoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubCatagoriesRecord.fromSnapshot(s));

  static SubCatagoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubCatagoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCatagoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCatagoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCatagoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCatagoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCatagoriesRecordData({
  DocumentReference? catagoriesRef,
  String? name,
  String? slug,
  String? selectedCatagory,
  String? id,
  String? parentId,
  int? order,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catagoriesRef': catagoriesRef,
      'name': name,
      'slug': slug,
      'selectedCatagory': selectedCatagory,
      'id': id,
      'parentId': parentId,
      'order': order,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCatagoriesRecordDocumentEquality
    implements Equality<SubCatagoriesRecord> {
  const SubCatagoriesRecordDocumentEquality();

  @override
  bool equals(SubCatagoriesRecord? e1, SubCatagoriesRecord? e2) {
    return e1?.catagoriesRef == e2?.catagoriesRef &&
        e1?.name == e2?.name &&
        e1?.slug == e2?.slug &&
        e1?.selectedCatagory == e2?.selectedCatagory &&
        e1?.id == e2?.id &&
        e1?.parentId == e2?.parentId &&
        e1?.order == e2?.order &&
        e1?.image == e2?.image;
  }

  @override
  int hash(SubCatagoriesRecord? e) => const ListEquality().hash([
        e?.catagoriesRef,
        e?.name,
        e?.slug,
        e?.selectedCatagory,
        e?.id,
        e?.parentId,
        e?.order,
        e?.image
      ]);

  @override
  bool isValidKey(Object? o) => o is SubCatagoriesRecord;
}
