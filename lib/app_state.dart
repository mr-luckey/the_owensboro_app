import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _selectedCatagoryId =
          prefs.getString('ff_selectedCatagoryId') ?? _selectedCatagoryId;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  DocumentReference? _selectedCatagoryReference;
  DocumentReference? get selectedCatagoryReference =>
      _selectedCatagoryReference;
  set selectedCatagoryReference(DocumentReference? value) {
    _selectedCatagoryReference = value;
  }

  String _selectedCatagoryId = '';
  String get selectedCatagoryId => _selectedCatagoryId;
  set selectedCatagoryId(String value) {
    _selectedCatagoryId = value;
    prefs.setString('ff_selectedCatagoryId', value);
  }

  DocumentReference? _selectedSubCatagoryRef;
  DocumentReference? get selectedSubCatagoryRef => _selectedSubCatagoryRef;
  set selectedSubCatagoryRef(DocumentReference? value) {
    _selectedSubCatagoryRef = value;
  }

  DocumentReference? _selectedListingCatagoryRef;
  DocumentReference? get selectedListingCatagoryRef =>
      _selectedListingCatagoryRef;
  set selectedListingCatagoryRef(DocumentReference? value) {
    _selectedListingCatagoryRef = value;
  }

  DocumentReference? _selectedistingSubCatagoryRef;
  DocumentReference? get selectedistingSubCatagoryRef =>
      _selectedistingSubCatagoryRef;
  set selectedistingSubCatagoryRef(DocumentReference? value) {
    _selectedistingSubCatagoryRef = value;
  }

  List<DocumentReference> _categoryList = [];
  List<DocumentReference> get categoryList => _categoryList;
  set categoryList(List<DocumentReference> value) {
    _categoryList = value;
  }

  void addToCategoryList(DocumentReference value) {
    categoryList.add(value);
  }

  void removeFromCategoryList(DocumentReference value) {
    categoryList.remove(value);
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
  }

  void updateCategoryListAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
  }

  void insertAtIndexInCategoryList(int index, DocumentReference value) {
    categoryList.insert(index, value);
  }

  String _selectedImagePath = '\'\'';
  String get selectedImagePath => _selectedImagePath;
  set selectedImagePath(String value) {
    _selectedImagePath = value;
  }

  String _selectedImage = '';
  String get selectedImage => _selectedImage;
  set selectedImage(String value) {
    _selectedImage = value;
  }

  String _listingImage = '';
  String get listingImage => _listingImage;
  set listingImage(String value) {
    _listingImage = value;
  }

  DocumentReference? _selectedProductRef;
  DocumentReference? get selectedProductRef => _selectedProductRef;
  set selectedProductRef(DocumentReference? value) {
    _selectedProductRef = value;
  }

  UserCopyDetailStruct _userCopyDetail = UserCopyDetailStruct();
  UserCopyDetailStruct get userCopyDetail => _userCopyDetail;
  set userCopyDetail(UserCopyDetailStruct value) {
    _userCopyDetail = value;
  }

  void updateUserCopyDetailStruct(Function(UserCopyDetailStruct) updateFn) {
    updateFn(_userCopyDetail);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
