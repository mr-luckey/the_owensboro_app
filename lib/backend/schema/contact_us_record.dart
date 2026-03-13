import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ContactUsRecord extends FirestoreRecord {
  ContactUsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _message = snapshotData['message'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ContactUs');

  static Stream<ContactUsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ContactUsRecord.fromSnapshot(s));

  static Future<ContactUsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ContactUsRecord.fromSnapshot(s));

  static ContactUsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ContactUsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ContactUsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ContactUsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ContactUsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ContactUsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createContactUsRecordData({
  String? name,
  String? email,
  String? message,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'email': email,
      'message': message,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class ContactUsRecordDocumentEquality implements Equality<ContactUsRecord> {
  const ContactUsRecordDocumentEquality();

  @override
  bool equals(ContactUsRecord? e1, ContactUsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.message == e2?.message &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(ContactUsRecord? e) =>
      const ListEquality().hash([e?.name, e?.email, e?.message, e?.timestamp]);

  @override
  bool isValidKey(Object? o) => o is ContactUsRecord;
}
