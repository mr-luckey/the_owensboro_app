import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VoteRecord extends FirestoreRecord {
  VoteRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  bool hasLink() => _link != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _link = snapshotData['link'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('vote');

  static Stream<VoteRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VoteRecord.fromSnapshot(s));

  static Future<VoteRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VoteRecord.fromSnapshot(s));

  static VoteRecord fromSnapshot(DocumentSnapshot snapshot) => VoteRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VoteRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VoteRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VoteRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VoteRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVoteRecordData({
  String? title,
  String? link,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'link': link,
    }.withoutNulls,
  );

  return firestoreData;
}

class VoteRecordDocumentEquality implements Equality<VoteRecord> {
  const VoteRecordDocumentEquality();

  @override
  bool equals(VoteRecord? e1, VoteRecord? e2) {
    return e1?.title == e2?.title && e1?.link == e2?.link;
  }

  @override
  int hash(VoteRecord? e) => const ListEquality().hash([e?.title, e?.link]);

  @override
  bool isValidKey(Object? o) => o is VoteRecord;
}
