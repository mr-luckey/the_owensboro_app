// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class EditListingWidgetNew extends StatefulWidget {
  const EditListingWidgetNew({
    super.key,
    this.width,
    this.height,
    this.selectedRef,
    this.selectedRefSub,
  });

  final double? width;
  final double? height;
  final DocumentReference? selectedRef;
  final DocumentReference? selectedRefSub;

  @override
  State<EditListingWidgetNew> createState() => _EditListingWidgetNewState();
}

class _EditListingWidgetNewState extends State<EditListingWidgetNew> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CatagoryListingDropDown(selectedRef: widget.selectedRef),
        SizedBox(height: 10.0),
        SubCatagoryListing(selectedRef: widget.selectedRefSub),
      ],
    );
  }
}

class CatagoryListingDropDown extends StatefulWidget {
  const CatagoryListingDropDown({
    super.key,
    this.width,
    this.height,
    this.selectedRef,
  });

  final double? width;
  final double? height;
  final DocumentReference? selectedRef;

  @override
  State<CatagoryListingDropDown> createState() =>
      _CatagoryListingDropDownState();
}

class _CatagoryListingDropDownState extends State<CatagoryListingDropDown> {
  DocumentReference? selectedCategoryRef;
  late CollectionReference categoriesCollection;
  Future<QuerySnapshot>? _categoriesFuture; // ✅ Store future

  @override
  void initState() {
    super.initState();
    selectedCategoryRef = widget.selectedRef;
    _categoriesFuture = getCategories(); // ✅ Initialize once
  }

  @override
  void didUpdateWidget(CatagoryListingDropDown oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ✅ Reload if selectedRef changes
    if (oldWidget.selectedRef != widget.selectedRef) {
      selectedCategoryRef = widget.selectedRef;
      _categoriesFuture = getCategories();
    }
  }

  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection.get();
  }

  void refreshCategories() {
    setState(() {
      _categoriesFuture = getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _categoriesFuture, // ✅ Use stored future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: const Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFC6E50)),
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                const Text(
                  'Error loading categories',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 16),
                  onPressed: refreshCategories,
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: const Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: const Center(
              child: Text(
                'No categories found',
                style: TextStyle(color: Color(0xffFC6E50)),
              ),
            ),
          );
        }

        List<Map<String, dynamic>> categories = snapshot.data!.docs.map((doc) {
          return {
            'name': doc['catagoryName'],
            'reference': doc.reference,
          };
        }).toList();

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xfffcf8ea),
            border: Border.all(color: const Color(0xfffc6e50)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 42,
          child: DropdownButton<DocumentReference>(
            value: selectedCategoryRef,
            hint: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Please select a category'),
            ),
            isExpanded: true,
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_drop_down, color: Color(0xffFC6E50)),
            ),
            onChanged: (DocumentReference? newRef) {
              setState(() {
                selectedCategoryRef = newRef;
                print("selectedCategoryRef: ${selectedCategoryRef?.path}");
                FFAppState().selectedListingCatagoryRef = selectedCategoryRef;
              });
            },
            items: categories.map<DropdownMenuItem<DocumentReference>>(
              (Map<String, dynamic> category) {
                return DropdownMenuItem<DocumentReference>(
                  value: category['reference'],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category['name'],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFC6E50),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            underline: Container(),
          ),
        );
      },
    );
  }
}

// ============================================================================
// SUBCATEGORY DROPDOWN
// ============================================================================

class SubCatagoryListing extends StatefulWidget {
  const SubCatagoryListing({
    super.key,
    this.width,
    this.height,
    this.selectedRef,
  });

  final double? width;
  final double? height;
  final DocumentReference? selectedRef;

  @override
  State<SubCatagoryListing> createState() => _SubCatagoryListingState();
}

class _SubCatagoryListingState extends State<SubCatagoryListing> {
  DocumentReference? selectedSubCategoryRef;
  late CollectionReference categoriesCollection;
  Future<QuerySnapshot>? _subCategoriesFuture; // ✅ Store future

  @override
  void initState() {
    super.initState();
    selectedSubCategoryRef = widget.selectedRef;
    _subCategoriesFuture = getSubCategories(); // ✅ Initialize once
  }

  @override
  void didUpdateWidget(SubCatagoryListing oldWidget) {
    super.didUpdateWidget(oldWidget);
    // ✅ Reload if selectedRef changes
    if (oldWidget.selectedRef != widget.selectedRef) {
      selectedSubCategoryRef = widget.selectedRef;
      _subCategoriesFuture = getSubCategories();
    }
  }

  Future<QuerySnapshot> getSubCategories() async {
    categoriesCollection =
        FirebaseFirestore.instance.collection('SubCatagories');

    // ✅ Filter by parent category if available
    if (FFAppState().selectedListingCatagoryRef != null) {
      return await categoriesCollection
          .where('catagoriesRef',
              isEqualTo: FFAppState().selectedListingCatagoryRef)
          .get();
    }

    // Otherwise return all subcategories
    return await categoriesCollection.get();
  }

  void refreshSubCategories() {
    setState(() {
      _subCategoriesFuture = getSubCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: _subCategoriesFuture, // ✅ Use stored future
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: const Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: const Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffFC6E50)),
                ),
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, color: Colors.red, size: 16),
                const SizedBox(width: 4),
                const Text(
                  'Error loading subcategories',
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
                IconButton(
                  icon: const Icon(Icons.refresh, size: 16),
                  onPressed: refreshSubCategories,
                  padding: const EdgeInsets.all(4),
                ),
              ],
            ),
          );
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: const Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            height: 42,
            child: const Center(
              child: Text(
                'No subcategories found',
                style: TextStyle(color: Color(0xffFC6E50), fontSize: 14),
              ),
            ),
          );
        }

        List<Map<String, dynamic>> categories = snapshot.data!.docs.map((doc) {
          return {
            'name': doc['name'],
            'reference': doc.reference,
          };
        }).toList();

        return Container(
          decoration: BoxDecoration(
            color: const Color(0xfffcf8ea),
            border: Border.all(color: const Color(0xfffc6e50)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          height: 42,
          child: DropdownButton<DocumentReference>(
            value: selectedSubCategoryRef,
            hint: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Please select a subcategory'),
            ),
            isExpanded: true,
            icon: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_drop_down, color: Color(0xffFC6E50)),
            ),
            onChanged: (DocumentReference? newRef) {
              setState(() {
                selectedSubCategoryRef = newRef;
                print(
                    "selectedSubCategoryRef: ${selectedSubCategoryRef?.path}");
                FFAppState().selectedSubCatagoryRef = selectedSubCategoryRef;
              });
            },
            items: categories.map<DropdownMenuItem<DocumentReference>>(
              (Map<String, dynamic> category) {
                return DropdownMenuItem<DocumentReference>(
                  value: category['reference'],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category['name'],
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffFC6E50),
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            underline: Container(),
          ),
        );
      },
    );
  }
}
