import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductsRecord extends FirestoreRecord {
  ProductsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "catagoryRef" field.
  DocumentReference? _catagoryRef;
  DocumentReference? get catagoryRef => _catagoryRef;
  bool hasCatagoryRef() => _catagoryRef != null;

  // "subCatagoryRef" field.
  DocumentReference? _subCatagoryRef;
  DocumentReference? get subCatagoryRef => _subCatagoryRef;
  bool hasSubCatagoryRef() => _subCatagoryRef != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "productName" field.
  String? _productName;
  String get productName => _productName ?? '';
  bool hasProductName() => _productName != null;

  // "productLocation" field.
  String? _productLocation;
  String get productLocation => _productLocation ?? '';
  bool hasProductLocation() => _productLocation != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "contactInfo" field.
  String? _contactInfo;
  String get contactInfo => _contactInfo ?? '';
  bool hasContactInfo() => _contactInfo != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "lastTime" field.
  DateTime? _lastTime;
  DateTime? get lastTime => _lastTime;
  bool hasLastTime() => _lastTime != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "productRef" field.
  DocumentReference? _productRef;
  DocumentReference? get productRef => _productRef;
  bool hasProductRef() => _productRef != null;

  // "productId" field.
  String? _productId;
  String get productId => _productId ?? '';
  bool hasProductId() => _productId != null;

  // "ReviewCollecRef" field.
  List<DocumentReference>? _reviewCollecRef;
  List<DocumentReference> get reviewCollecRef => _reviewCollecRef ?? const [];
  bool hasReviewCollecRef() => _reviewCollecRef != null;

  // "reviewRef" field.
  List<DocumentReference>? _reviewRef;
  List<DocumentReference> get reviewRef => _reviewRef ?? const [];
  bool hasReviewRef() => _reviewRef != null;

  // "reviewReference" field.
  DocumentReference? _reviewReference;
  DocumentReference? get reviewReference => _reviewReference;
  bool hasReviewReference() => _reviewReference != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "startTimeString" field.
  String? _startTimeString;
  String get startTimeString => _startTimeString ?? '';
  bool hasStartTimeString() => _startTimeString != null;

  // "endTimeString" field.
  String? _endTimeString;
  String get endTimeString => _endTimeString ?? '';
  bool hasEndTimeString() => _endTimeString != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "locationUrl" field.
  String? _locationUrl;
  String get locationUrl => _locationUrl ?? '';
  bool hasLocationUrl() => _locationUrl != null;

  // "websiteUrl" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  // "facebookUrl" field.
  String? _facebookUrl;
  String get facebookUrl => _facebookUrl ?? '';
  bool hasFacebookUrl() => _facebookUrl != null;

  void _initializeFields() {
    _catagoryRef = snapshotData['catagoryRef'] as DocumentReference?;
    _subCatagoryRef = snapshotData['subCatagoryRef'] as DocumentReference?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _productName = snapshotData['productName'] as String?;
    _productLocation = snapshotData['productLocation'] as String?;
    _about = snapshotData['about'] as String?;
    _image = snapshotData['image'] as String?;
    _contactInfo = snapshotData['contactInfo'] as String?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _lastTime = snapshotData['lastTime'] as DateTime?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _productRef = snapshotData['productRef'] as DocumentReference?;
    _productId = snapshotData['productId'] as String?;
    _reviewCollecRef = getDataList(snapshotData['ReviewCollecRef']);
    _reviewRef = getDataList(snapshotData['reviewRef']);
    _reviewReference = snapshotData['reviewReference'] as DocumentReference?;
    _order = castToType<int>(snapshotData['order']);
    _startTimeString = snapshotData['startTimeString'] as String?;
    _endTimeString = snapshotData['endTimeString'] as String?;
    _time = snapshotData['time'] as String?;
    _locationUrl = snapshotData['locationUrl'] as String?;
    _websiteUrl = snapshotData['websiteUrl'] as String?;
    _facebookUrl = snapshotData['facebookUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Products');

  static Stream<ProductsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProductsRecord.fromSnapshot(s));

  static Future<ProductsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProductsRecord.fromSnapshot(s));

  static ProductsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProductsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProductsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProductsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProductsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProductsRecordData({
  DocumentReference? catagoryRef,
  DocumentReference? subCatagoryRef,
  String? shortDescription,
  String? productName,
  String? productLocation,
  String? about,
  String? image,
  String? contactInfo,
  DateTime? startTime,
  DateTime? lastTime,
  String? imageUrl,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? productRef,
  String? productId,
  DocumentReference? reviewReference,
  int? order,
  String? startTimeString,
  String? endTimeString,
  String? time,
  String? locationUrl,
  String? websiteUrl,
  String? facebookUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'catagoryRef': catagoryRef,
      'subCatagoryRef': subCatagoryRef,
      'shortDescription': shortDescription,
      'productName': productName,
      'productLocation': productLocation,
      'about': about,
      'image': image,
      'contactInfo': contactInfo,
      'startTime': startTime,
      'lastTime': lastTime,
      'imageUrl': imageUrl,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'productRef': productRef,
      'productId': productId,
      'reviewReference': reviewReference,
      'order': order,
      'startTimeString': startTimeString,
      'endTimeString': endTimeString,
      'time': time,
      'locationUrl': locationUrl,
      'websiteUrl': websiteUrl,
      'facebookUrl': facebookUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProductsRecordDocumentEquality implements Equality<ProductsRecord> {
  const ProductsRecordDocumentEquality();

  @override
  bool equals(ProductsRecord? e1, ProductsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.catagoryRef == e2?.catagoryRef &&
        e1?.subCatagoryRef == e2?.subCatagoryRef &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.productName == e2?.productName &&
        e1?.productLocation == e2?.productLocation &&
        e1?.about == e2?.about &&
        e1?.image == e2?.image &&
        e1?.contactInfo == e2?.contactInfo &&
        e1?.startTime == e2?.startTime &&
        e1?.lastTime == e2?.lastTime &&
        e1?.imageUrl == e2?.imageUrl &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.productRef == e2?.productRef &&
        e1?.productId == e2?.productId &&
        listEquality.equals(e1?.reviewCollecRef, e2?.reviewCollecRef) &&
        listEquality.equals(e1?.reviewRef, e2?.reviewRef) &&
        e1?.reviewReference == e2?.reviewReference &&
        e1?.order == e2?.order &&
        e1?.startTimeString == e2?.startTimeString &&
        e1?.endTimeString == e2?.endTimeString &&
        e1?.time == e2?.time &&
        e1?.locationUrl == e2?.locationUrl &&
        e1?.websiteUrl == e2?.websiteUrl &&
        e1?.facebookUrl == e2?.facebookUrl;
  }

  @override
  int hash(ProductsRecord? e) => const ListEquality().hash([
        e?.catagoryRef,
        e?.subCatagoryRef,
        e?.shortDescription,
        e?.productName,
        e?.productLocation,
        e?.about,
        e?.image,
        e?.contactInfo,
        e?.startTime,
        e?.lastTime,
        e?.imageUrl,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.productRef,
        e?.productId,
        e?.reviewCollecRef,
        e?.reviewRef,
        e?.reviewReference,
        e?.order,
        e?.startTimeString,
        e?.endTimeString,
        e?.time,
        e?.locationUrl,
        e?.websiteUrl,
        e?.facebookUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is ProductsRecord;
}
