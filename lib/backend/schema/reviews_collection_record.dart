import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsCollectionRecord extends FirestoreRecord {
  ReviewsCollectionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "review" field.
  String? _review;
  String get review => _review ?? '';
  bool hasReview() => _review != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _review = snapshotData['review'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _rating = castToType<double>(snapshotData['rating']);
    _productRef = snapshotData['productRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ReviewsCollection');

  static Stream<ReviewsCollectionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsCollectionRecord.fromSnapshot(s));

  static Future<ReviewsCollectionRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ReviewsCollectionRecord.fromSnapshot(s));

  static ReviewsCollectionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsCollectionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsCollectionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsCollectionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsCollectionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsCollectionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsCollectionRecordData({
  String? userName,
  String? review,
  DateTime? createdAt,
  double? rating,
  DocumentReference? productRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'review': review,
      'createdAt': createdAt,
      'rating': rating,
      'productRef': productRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsCollectionRecordDocumentEquality
    implements Equality<ReviewsCollectionRecord> {
  const ReviewsCollectionRecordDocumentEquality();

  @override
  bool equals(ReviewsCollectionRecord? e1, ReviewsCollectionRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.review == e2?.review &&
        e1?.createdAt == e2?.createdAt &&
        e1?.rating == e2?.rating &&
        e1?.productRef == e2?.productRef;
  }

  @override
  int hash(ReviewsCollectionRecord? e) => const ListEquality()
      .hash([e?.userName, e?.review, e?.createdAt, e?.rating, e?.productRef]);

  @override
  bool isValidKey(Object? o) => o is ReviewsCollectionRecord;
}
