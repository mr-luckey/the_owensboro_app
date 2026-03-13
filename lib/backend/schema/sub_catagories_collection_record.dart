import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubCatagoriesCollectionRecord extends FirestoreRecord {
  SubCatagoriesCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "subCatagoryRef" field.
  DocumentReference? _subCatagoryRef;
  DocumentReference? get subCatagoryRef => _subCatagoryRef;
  bool hasSubCatagoryRef() => _subCatagoryRef != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _id = snapshotData['id'] as String?;
    _subCatagoryRef = snapshotData['subCatagoryRef'] as DocumentReference?;
    _slug = snapshotData['slug'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SubCatagoriesCollection')
          : FirebaseFirestore.instance
              .collectionGroup('SubCatagoriesCollection');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SubCatagoriesCollection').doc(id);

  static Stream<SubCatagoriesCollectionRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => SubCatagoriesCollectionRecord.fromSnapshot(s));

  static Future<SubCatagoriesCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SubCatagoriesCollectionRecord.fromSnapshot(s));

  static SubCatagoriesCollectionRecord fromSnapshot(
          DocumentSnapshot snapshot) =>
      SubCatagoriesCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubCatagoriesCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubCatagoriesCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubCatagoriesCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubCatagoriesCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubCatagoriesCollectionRecordData({
  String? name,
  String? id,
  DocumentReference? subCatagoryRef,
  String? slug,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'id': id,
      'subCatagoryRef': subCatagoryRef,
      'slug': slug,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubCatagoriesCollectionRecordDocumentEquality
    implements Equality<SubCatagoriesCollectionRecord> {
  const SubCatagoriesCollectionRecordDocumentEquality();

  @override
  bool equals(
      SubCatagoriesCollectionRecord? e1, SubCatagoriesCollectionRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.id == e2?.id &&
        e1?.subCatagoryRef == e2?.subCatagoryRef &&
        e1?.slug == e2?.slug;
  }

  @override
  int hash(SubCatagoriesCollectionRecord? e) =>
      const ListEquality().hash([e?.name, e?.id, e?.subCatagoryRef, e?.slug]);

  @override
  bool isValidKey(Object? o) => o is SubCatagoriesCollectionRecord;
}
