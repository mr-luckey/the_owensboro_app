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

class ListingDropDownWidgetNew extends StatefulWidget {
  const ListingDropDownWidgetNew({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ListingDropDownWidgetNew> createState() =>
      _ListingDropDownWidgetNewState();
}

class _ListingDropDownWidgetNewState extends State<ListingDropDownWidgetNew> {
  String? selectedCategoryName;
  String? selectedCategoryId;
  DocumentReference? selectedCategoryRef;
  DocumentReference? selectedSubCategoryRef;
  List<Map<String, dynamic>> subCategories = [];
  late CollectionReference categoriesCollection;
  String? selectedSubCategoryName;

  // ✅ Store the future to prevent recreation on every build
  Future<QuerySnapshot>? _categoriesFuture;
  bool _isLoadingSubCategories = false;

  @override
  void initState() {
    super.initState();
    // ✅ Initialize the future once
    _categoriesFuture = getCategories();
  }

  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection.get();
  }

  Future<void> getSubCategories(DocumentReference categoryRef) async {
    // ✅ Add loading state
    setState(() {
      _isLoadingSubCategories = true;
    });

    try {
      QuerySnapshot subCategorySnapshot = await FirebaseFirestore.instance
          .collection('SubCatagories')
          .where('catagoriesRef', isEqualTo: categoryRef)
          .get();

      setState(() {
        subCategories = subCategorySnapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'name': doc['name'],
            'reference': doc.reference
          };
        }).toList();

        // Reset the sub-category selection if no sub-categories are found
        if (subCategories.isEmpty) {
          selectedSubCategoryName = null;
          selectedSubCategoryRef = null;
          FFAppState().selectedSubCatagoryRef = null;
        }

        _isLoadingSubCategories = false;
      });

      print("Subcategories for category ${categoryRef.path}: $subCategories");
    } catch (e) {
      setState(() {
        _isLoadingSubCategories = false;
        subCategories = [];
      });
      print("Error loading subcategories: $e");
    }
  }

  // ✅ Method to refresh categories if needed
  void refreshCategories() {
    setState(() {
      _categoriesFuture = getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Dropdown
        FutureBuilder<QuerySnapshot>(
          future: _categoriesFuture, // ✅ Use stored future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xfffcf8ea),
                  border: Border.all(color: Color(0xfffc6e50)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 42,
                child: Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xffFC6E50)),
                    ),
                  ),
                ),
              );
            }

            if (snapshot.hasError) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xfffcf8ea),
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 16),
                    SizedBox(width: 4),
                    Text('Error loading categories',
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                    IconButton(
                      icon: Icon(Icons.refresh, size: 16),
                      onPressed: refreshCategories,
                      padding: EdgeInsets.all(4),
                    ),
                  ],
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xfffcf8ea),
                  border: Border.all(color: Color(0xfffc6e50)),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                height: 42,
                child: Center(
                  child: Text(
                    'No categories found',
                    style: TextStyle(color: Color(0xffFC6E50)),
                  ),
                ),
              );
            }

            List<Map<String, dynamic>> categories = snapshot.data!.docs.map(
              (doc) {
                return {
                  'id': doc.id,
                  'name': doc['catagoryName'],
                  'reference': doc.reference,
                };
              },
            ).toList();

            return Container(
              decoration: BoxDecoration(
                color: Color(0xfffcf8ea),
                border: Border.all(color: Color(0xfffc6e50)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 42,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedCategoryName,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Please select a category'),
                      ),
                      isExpanded: true,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_drop_down,
                            color: Color(0xffFC6E50)),
                      ),
                      onChanged: (String? newValue) async {
                        setState(() {
                          selectedCategoryName = newValue;

                          var selectedCategory = categories.firstWhere(
                            (category) => category['name'] == newValue,
                            orElse: () => categories.first,
                          );
                          selectedCategoryId = selectedCategory['id'];
                          selectedCategoryRef = selectedCategory['reference'];
                          FFAppState().selectedListingCatagoryRef =
                              selectedCategoryRef;

                          // Reset sub-category selection when category changes
                          selectedSubCategoryName = null;
                          selectedSubCategoryRef = null;
                          FFAppState().selectedSubCatagoryRef = null;
                          subCategories =
                              []; // ✅ Clear old subcategories immediately
                        });

                        // Fetch subcategories when a category is selected
                        if (selectedCategoryRef != null) {
                          await getSubCategories(selectedCategoryRef!);
                        }
                      },
                      items: categories.map<DropdownMenuItem<String>>((
                        Map<String, dynamic> category,
                      ) {
                        return DropdownMenuItem<String>(
                          value: category['name'],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category['name'],
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffFC6E50),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      underline: Container(),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // ✅ Show loading indicator for subcategories
        if (selectedCategoryRef != null && _isLoadingSubCategories)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfffcf8ea),
                border: Border.all(color: Color(0xfffc6e50)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 42,
              child: Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Color(0xffFC6E50)),
                  ),
                ),
              ),
            ),
          ),

        // Sub-Category Dropdown (only show if subCategories are available)
        if (selectedCategoryRef != null &&
            !_isLoadingSubCategories &&
            subCategories.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xfffcf8ea),
                border: Border.all(color: Color(0xfffc6e50)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: 42,
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButton<String>(
                      value: selectedSubCategoryName,
                      hint: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Please select a sub-category'),
                      ),
                      isExpanded: true,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.arrow_drop_down,
                            color: Color(0xffFC6E50)),
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSubCategoryName = newValue;
                          var selectedSubCategory = subCategories.firstWhere(
                              (subCategory) => subCategory['name'] == newValue,
                              orElse: () => {'reference': null});

                          // Retrieve the reference
                          selectedSubCategoryRef =
                              selectedSubCategory['reference'];
                          FFAppState().selectedSubCatagoryRef =
                              selectedSubCategoryRef;

                          // Optionally print or use the reference
                          print(
                              "Selected Sub-Category Reference: ${selectedSubCategoryRef?.path}");
                        });
                      },
                      items: subCategories.map<DropdownMenuItem<String>>(
                        (Map<String, dynamic> subCategory) {
                          return DropdownMenuItem<String>(
                            value: subCategory['name'],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subCategory['name'],
                                style: TextStyle(
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
                  ),
                ],
              ),
            ),
          ),

        if (selectedCategoryRef != null &&
            !_isLoadingSubCategories &&
            subCategories.isEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              'No sub-categories available for this category.',
              style: TextStyle(
                color: Color(0xffFC6E50),
                fontSize: 14,
              ),
            ),
          ),
      ],
    );
  }
}
