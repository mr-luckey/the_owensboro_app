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

class ListingDropDownSelection extends StatefulWidget {
  const ListingDropDownSelection({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ListingDropDownSelection> createState() =>
      _ListingDropDownSelectionState();
}

class _ListingDropDownSelectionState extends State<ListingDropDownSelection> {
  String? selectedCategoryName;
  String? selectedCategoryId;
  DocumentReference? selectedCategoryRef;
  DocumentReference? selectedSubCategoryRef;
  DocumentReference? ProductRef;
  List<Map<String, dynamic>> subCategories = [];
  List<Map<String, dynamic>> products = [];
  late CollectionReference categoriesCollection;
  String? selectedSubCategoryName;
  String? selectedProductName;
  bool isLoadingSubCategories = false;
  bool isLoadingProducts = false;

  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection.get();
  }

  getSubCategories(DocumentReference categoryRef) async {
    setState(() {
      isLoadingSubCategories = true;
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
        }
        isLoadingSubCategories = false;
      });

      print("Subcategories for category ${categoryRef.path}: $subCategories");

      // If no subcategories, load products based on category
      if (subCategories.isEmpty) {
        getProductsByCategory(categoryRef);
      }
    } catch (e) {
      setState(() {
        isLoadingSubCategories = false;
      });
      print("Error loading subcategories: $e");
    }
  }

  getProductsByCategory(DocumentReference categoryRef) async {
    setState(() {
      isLoadingProducts = true;
      products = [];
      selectedProductName = null;
    });

    try {
      QuerySnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('catagoryRef', isEqualTo: categoryRef)
          .get();

      setState(() {
        products = productSnapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'name': doc['productName'],
            'reference': doc.reference,
            'imageUrl': doc['imageUrl'] ?? '',
            'about': doc['about'] ?? '',
          };
        }).toList();
        isLoadingProducts = false;
      });

      print(
          "Products for category ${categoryRef.path}: ${products.length} products found");
    } catch (e) {
      setState(() {
        isLoadingProducts = false;
      });
      print("Error loading products by category: $e");
    }
  }

  getProductsBySubCategory(DocumentReference subCategoryRef) async {
    setState(() {
      isLoadingProducts = true;
      products = [];
      selectedProductName = null;
    });

    try {
      QuerySnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('subCatagoryRef', isEqualTo: subCategoryRef)
          .get();

      setState(() {
        products = productSnapshot.docs.map((doc) {
          return {
            'id': doc.id,
            'name': doc['productName'],
            'reference': doc.reference,
            'imageUrl': doc['imageUrl'] ?? '',
            'about': doc['about'] ?? '',
          };
        }).toList();
        isLoadingProducts = false;
      });

      print(
          "Products for subcategory ${subCategoryRef.path}: ${products.length} products found");
    } catch (e) {
      setState(() {
        isLoadingProducts = false;
      });
      print("Error loading products by subcategory: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Dropdown
        FutureBuilder<QuerySnapshot>(
          future: getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return Center(child: Text('No categories found'));
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
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xfffcf8ea),
                border: Border.all(color: Color(0xfffc6e50)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButton<String>(
                value: selectedCategoryName,
                hint: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Please select a category'),
                ),
                icon: SizedBox(),
                isExpanded: true,
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

                    // Reset sub-category and product selection when category changes
                    selectedSubCategoryName = null;
                    selectedProductName = null;
                    subCategories = [];
                    products = [];
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
                      child: Text(category['name']),
                    ),
                  );
                }).toList(),
                underline: Container(),
              ),
            );
          },
        ),

        SizedBox(height: 8.0),

        // Sub-Category Dropdown (only show if subCategories are available)
        if (isLoadingSubCategories)
          Center(child: CircularProgressIndicator())
        else if (subCategories.isNotEmpty)
          Container(
            height: 40.0,
            decoration: BoxDecoration(
              color: Color(0xfffcf8ea),
              border: Border.all(color: Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButton<String>(
              value: selectedSubCategoryName,
              hint: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Please select a sub-category'),
              ),
              icon: SizedBox(),
              isExpanded: true,
              onChanged: (String? newValue) async {
                setState(() {
                  selectedSubCategoryName = newValue;
                  selectedProductName = null;

                  var selectedSubCategory = subCategories.firstWhere(
                      (subCategory) => subCategory['name'] == newValue,
                      orElse: () => {'reference': null});

                  // Retrieve the reference
                  selectedSubCategoryRef = selectedSubCategory['reference'];
                  FFAppState().selectedSubCatagoryRef = selectedSubCategoryRef;

                  print(
                      "Selected Sub-Category Reference: ${selectedSubCategoryRef?.path}");
                });

                // Load products based on selected subcategory
                if (selectedSubCategoryRef != null) {
                  await getProductsBySubCategory(selectedSubCategoryRef!);
                }
              },
              items: subCategories.map<DropdownMenuItem<String>>(
                (Map<String, dynamic> subCategory) {
                  return DropdownMenuItem<String>(
                    value: subCategory['name'],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(subCategory['name']),
                    ),
                  );
                },
              ).toList(),
              underline: Container(),
            ),
          )
        else if (subCategories.isEmpty && selectedCategoryRef != null)
          Text(
            'No sub-categories available for this category.',
            style: TextStyle(color: Colors.grey),
          ),

        SizedBox(height: 8.0),

        // Product Dropdown
        if (isLoadingProducts)
          Center(child: CircularProgressIndicator())
        else if (products.isNotEmpty)
          Container(
            decoration: BoxDecoration(
              color: Color(0xfffcf8ea),
              border: Border.all(color: Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButton<String>(
              value: selectedProductName,
              hint: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Please select a product'),
              ),
              icon: SizedBox(),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedProductName = newValue;

                  var selectedProduct = products.firstWhere(
                      (product) => product['name'] == newValue,
                      orElse: () => {'reference': null});
                  ProductRef = selectedProduct['reference'];
                  FFAppState().selectedProductRef = ProductRef;

                  print("Selected Product: ${selectedProduct['name']}");
                  print(
                      "Product Reference: ${selectedProduct['reference']?.path}");
                });
              },
              items: products.map<DropdownMenuItem<String>>(
                (Map<String, dynamic> product) {
                  return DropdownMenuItem<String>(
                    value: product['name'],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product['name'],
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ).toList(),
              underline: Container(),
            ),
          )
        else if (products.isEmpty &&
            (selectedSubCategoryRef != null ||
                (selectedCategoryRef != null && subCategories.isEmpty)))
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              'No products available',
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    );
  }
}
