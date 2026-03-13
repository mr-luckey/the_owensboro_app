import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BannerRecord extends FirestoreRecord {
  BannerRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bannerName" field.
  String? _bannerName;
  String get bannerName => _bannerName ?? '';
  bool hasBannerName() => _bannerName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "CatagoryRef" field.
  DocumentReference? _catagoryRef;
  DocumentReference? get catagoryRef => _catagoryRef;
  bool hasCatagoryRef() => _catagoryRef != null;

  // "SubCatagoryRef" field.
  DocumentReference? _subCatagoryRef;
  DocumentReference? get subCatagoryRef => _subCatagoryRef;
  bool hasSubCatagoryRef() => _subCatagoryRef != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  void _initializeFields() {
    _bannerName = snapshotData['bannerName'] as String?;
    _image = snapshotData['image'] as String?;
    _catagoryRef = snapshotData['CatagoryRef'] as DocumentReference?;
    _subCatagoryRef = snapshotData['SubCatagoryRef'] as DocumentReference?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Banner');

  static Stream<BannerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BannerRecord.fromSnapshot(s));

  static Future<BannerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BannerRecord.fromSnapshot(s));

  static BannerRecord fromSnapshot(DocumentSnapshot snapshot) => BannerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BannerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BannerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BannerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BannerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBannerRecordData({
  String? bannerName,
  String? image,
  DocumentReference? catagoryRef,
  DocumentReference? subCatagoryRef,
  DocumentReference? productRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bannerName': bannerName,
      'image': image,
      'CatagoryRef': catagoryRef,
      'SubCatagoryRef': subCatagoryRef,
      'productRef': productRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class BannerRecordDocumentEquality implements Equality<BannerRecord> {
  const BannerRecordDocumentEquality();

  @override
  bool equals(BannerRecord? e1, BannerRecord? e2) {
    return e1?.bannerName == e2?.bannerName &&
        e1?.image == e2?.image &&
        e1?.catagoryRef == e2?.catagoryRef &&
        e1?.subCatagoryRef == e2?.subCatagoryRef &&
        e1?.productRef == e2?.productRef;
  }

  @override
  int hash(BannerRecord? e) => const ListEquality().hash([
        e?.bannerName,
        e?.image,
        e?.catagoryRef,
        e?.subCatagoryRef,
        e?.productRef
      ]);

  @override
  bool isValidKey(Object? o) => o is BannerRecord;
}
