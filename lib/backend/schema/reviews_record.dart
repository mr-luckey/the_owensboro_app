import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
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

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "reviewId" field.
  String? _reviewId;
  String get reviewId => _reviewId ?? '';
  bool hasReviewId() => _reviewId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _review = snapshotData['review'] as String?;
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _rating = castToType<double>(snapshotData['rating']);
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _reviewId = snapshotData['reviewId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Reviews')
          : FirebaseFirestore.instance.collectionGroup('Reviews');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Reviews').doc(id);

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  String? userName,
  String? review,
  DateTime? createdAt,
  double? rating,
  DocumentReference? productRef,
  DocumentReference? userRef,
  String? reviewId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'review': review,
      'createdAt': createdAt,
      'rating': rating,
      'productRef': productRef,
      'userRef': userRef,
      'reviewId': reviewId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.review == e2?.review &&
        e1?.createdAt == e2?.createdAt &&
        e1?.rating == e2?.rating &&
        e1?.productRef == e2?.productRef &&
        e1?.userRef == e2?.userRef &&
        e1?.reviewId == e2?.reviewId;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.userName,
        e?.review,
        e?.createdAt,
        e?.rating,
        e?.productRef,
        e?.userRef,
        e?.reviewId
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
