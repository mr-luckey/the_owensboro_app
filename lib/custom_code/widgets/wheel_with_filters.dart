// Automatic FlutterFlow imports
import 'package:get/get.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/index.dart';
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:math';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class WheelWithFilters extends StatefulWidget {
  const WheelWithFilters({
    super.key,
    this.width,
    this.height,
    this.selectedDoc,
  });

  final double? width;
  final double? height;
  final Future Function(ProductsRecord? product)? selectedDoc;

  @override
  State<WheelWithFilters> createState() => _WheelWithFiltersState();
}

class _WheelWithFiltersState extends State<WheelWithFilters> {
  StreamController<int> controller = StreamController<int>.broadcast();

  // Categories data
  List<String> allCategories = [];
  List<String> selectedCategories = [];
  Map<String, bool> categoryCheckboxes = {};
  Map<String, DocumentReference> categoryRefs = {}; // Store category references

  // Subcategories data
  List<String> allSubcategories = [];
  List<String> selectedSubcategories = [];
  Map<String, bool> subcategoryCheckboxes = {};
  Map<String, DocumentReference> subcategoryRefs =
      {}; // Store subcategory references

  // Products data
  List<String> allProducts = [];
  List<String> wheelProducts = [];

  bool isLoadingProducts = true;
  bool isSpinning = false;
  String? selectedValue;

  final List<Color> segmentColors = [
    Colors.cyan,
    Colors.pink,
    Colors.orange,
    Colors.deepPurple,
    Colors.red,
    Colors.green,
    Colors.amber,
    Colors.blue,
    Colors.teal,
    Colors.indigo,
  ];

  @override
  void initState() {
    super.initState();
    _loadInitialData();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  // Initial data load
  Future<void> _loadInitialData() async {
    setState(() {
      isLoadingProducts = true;
    });

    // Load all products by default
    QuerySnapshot productsSnapshot =
        await FirebaseFirestore.instance.collection('Products').limit(10).get();

    setState(() {
      wheelProducts = productsSnapshot.docs
          .map((doc) => doc['productName'].toString())
          .toList();
      isLoadingProducts = false;
    });
  }

  // Load categories from Firestore
  Future<void> loadCategories() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Catagories').get();

    setState(() {
      allCategories =
          snapshot.docs.map((doc) => doc['catagoryName'].toString()).toList();

      // Store category references
      for (var doc in snapshot.docs) {
        categoryRefs[doc['catagoryName'].toString()] = doc.reference;
      }

      categoryCheckboxes = Map.fromIterable(
        allCategories,
        value: (v) => selectedCategories.contains(v),
      );
    });
  }

  // Load subcategories based on selected categories
  Future<void> loadSubcategories() async {
    if (selectedCategories.isEmpty) {
      setState(() {
        allSubcategories = [];
        subcategoryCheckboxes = {};
      });
      return;
    }

    // Get references of selected categories
    List<DocumentReference> selectedCategoryRefs = selectedCategories
        .map((categoryName) => categoryRefs[categoryName])
        .whereType<DocumentReference>()
        .toList();

    if (selectedCategoryRefs.isEmpty) {
      setState(() {
        allSubcategories = [];
        subcategoryCheckboxes = {};
      });
      return;
    }

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('SubCatagories')
        .where('catagoriesRef', whereIn: selectedCategoryRefs)
        .get();

    setState(() {
      allSubcategories =
          snapshot.docs.map((doc) => doc['name'].toString()).toList();

      // Store subcategory references
      for (var doc in snapshot.docs) {
        subcategoryRefs[doc['name'].toString()] = doc.reference;
      }

      subcategoryCheckboxes = Map.fromIterable(
        allSubcategories,
        value: (v) => selectedSubcategories.contains(v),
      );
    });
  }

  // Load products based on selected subcategories
  Future<void> loadProducts() async {
    if (selectedSubcategories.isEmpty && selectedCategories.isEmpty) {
      // If no filters selected, load default products
      await _loadInitialData();
      return;
    }

    Query query = FirebaseFirestore.instance.collection('Products');

    // If subcategories are selected, filter by subcategory references
    if (selectedSubcategories.isNotEmpty) {
      List<DocumentReference> selectedSubcategoryRefs = selectedSubcategories
          .map((subcategoryName) => subcategoryRefs[subcategoryName])
          .whereType<DocumentReference>()
          .toList();

      if (selectedSubcategoryRefs.isNotEmpty) {
        query = query.where('subCatagoryRef', whereIn: selectedSubcategoryRefs);
      }
    }
    // If only categories are selected (no subcategories), filter by category references
    else if (selectedCategories.isNotEmpty) {
      List<DocumentReference> selectedCategoryRefs = selectedCategories
          .map((categoryName) => categoryRefs[categoryName])
          .whereType<DocumentReference>()
          .toList();

      if (selectedCategoryRefs.isNotEmpty) {
        query = query.where('catagoryRef', whereIn: selectedCategoryRefs);
      }
    }

    QuerySnapshot snapshot = await query.limit(10).get();

    setState(() {
      wheelProducts =
          snapshot.docs.map((doc) => doc['productName'].toString()).toList();
    });
  }

  // Category Selection Dialog
  Future<void> showCategorySelectionDialog() async {
    if (allCategories.isEmpty) {
      await loadCategories();
    }

    // Update checkboxes to reflect currently selected categories
    for (var category in allCategories) {
      if (!categoryCheckboxes.containsKey(category)) {
        categoryCheckboxes[category] = selectedCategories.contains(category);
      }
    }

    Map<String, bool> tempCheckboxes = Map.from(categoryCheckboxes);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            int selectedCount =
                tempCheckboxes.values.where((v) => v == true).length;

            return AlertDialog(
              title: Text('Choose Categories ($selectedCount)'),
              content: Container(
                height: 500,
                width: double.maxFinite,
                child: allCategories.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: allCategories.length,
                        itemBuilder: (context, index) {
                          String category = allCategories[index];
                          bool isChecked = tempCheckboxes[category] ?? false;

                          return CheckboxListTile(
                            title: Text(category),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setDialogState(() {
                                tempCheckboxes[category] = value ?? false;
                              });
                            },
                          );
                        },
                      ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    int selectedCount =
                        tempCheckboxes.values.where((v) => v == true).length;

                    if (selectedCount == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select at least one category.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      categoryCheckboxes = tempCheckboxes;
                      selectedCategories = categoryCheckboxes.entries
                          .where((entry) => entry.value == true)
                          .map((entry) => entry.key)
                          .toList();

                      // Reset subcategories when categories change
                      selectedSubcategories = [];
                      subcategoryCheckboxes = {};
                      allSubcategories = [];
                    });

                    Get.back();

                    // Load products by categories only
                    await loadProducts();
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // Subcategory Selection Dialog (independent)
  Future<void> showSubcategorySelectionDialog() async {
    // First check if categories are selected
    if (selectedCategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select categories first.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Load subcategories if not already loaded
    if (allSubcategories.isEmpty) {
      await loadSubcategories();
    }

    if (allSubcategories.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No subcategories found for selected categories.'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    // Update checkboxes to reflect currently selected subcategories
    for (var subcategory in allSubcategories) {
      if (!subcategoryCheckboxes.containsKey(subcategory)) {
        subcategoryCheckboxes[subcategory] = selectedSubcategories.contains(
          subcategory,
        );
      }
    }

    Map<String, bool> tempCheckboxes = Map.from(subcategoryCheckboxes);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            int selectedCount =
                tempCheckboxes.values.where((v) => v == true).length;

            return AlertDialog(
              title: Text('Choose Subcategories ($selectedCount/10)'),
              content: Container(
                height: 500,
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: allSubcategories.length,
                  itemBuilder: (context, index) {
                    String subcategory = allSubcategories[index];
                    bool isChecked = tempCheckboxes[subcategory] ?? false;

                    return CheckboxListTile(
                      title: Text(subcategory),
                      value: isChecked,
                      onChanged: (bool? value) {
                        if (value == true && selectedCount >= 10) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You can select maximum 10 subcategories.',
                              ),
                              duration: Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        setDialogState(() {
                          tempCheckboxes[subcategory] = value ?? false;
                        });
                      },
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    int selectedCount =
                        tempCheckboxes.values.where((v) => v == true).length;

                    if (selectedCount == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Please select at least one subcategory.',
                          ),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }

                    setState(() {
                      subcategoryCheckboxes = tempCheckboxes;
                      selectedSubcategories = subcategoryCheckboxes.entries
                          .where((entry) => entry.value == true)
                          .map((entry) => entry.key)
                          .toList();
                    });

                    Get.back();

                    // Load products based on selected subcategories
                    await loadProducts();
                  },
                  child: const Text('Apply'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  DocumentReference? selectedProductRef;
  ProductsRecord? selectedProductRecord;

  Future<void> fetchSelectedProductDocument(String productName) async {
    try {
      print("Fetching document for product: $productName");

      QuerySnapshot productSnapshot = await FirebaseFirestore.instance
          .collection('Products')
          .where('productName', isEqualTo: productName)
          .limit(1)
          .get();

      if (productSnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = productSnapshot.docs.first;
        print("✅ Product Document Found!");
        print("Document ID: ${doc.id}");
        selectedProductRecord = ProductsRecord.fromSnapshot(doc);

        selectedProductRef = doc.reference;

        Get.toNamed(ListingDetailPageWidget.routePath, arguments: <String, dynamic>{'product': selectedProductRecord});
      } else {
        selectedProductRecord = null;
        selectedProductRef = null;
        print("❌ Product document not found: $productName");
      }
    } catch (e) {
      selectedProductRecord = null;
      selectedProductRef = null;
      print("❌ Error fetching product document: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: selectedSubcategories.isEmpty
              ? MainAxisAlignment.center
              : MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await showCategorySelectionDialog();
              },
              child: Text(
                selectedCategories.isEmpty
                    ? 'Select Categories'
                    : 'Edit Categories',
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
              ),
            ),
            const SizedBox(width: 10),
            if (selectedCategories.isNotEmpty)
              ElevatedButton(
                onPressed: selectedCategories.isEmpty
                    ? null
                    : () async {
                        await showSubcategorySelectionDialog();
                      },
                child: Text(
                  selectedSubcategories.isEmpty
                      ? 'Select Subcategories'
                      : 'Edit Subcategories',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: FlutterFlowTheme.of(context).primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
          ],
        ),

        // Row(
        //   mainAxisAlignment: selectedSubcategories.isEmpty
        //       ? MainAxisAlignment.center
        //       : MainAxisAlignment.start,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () async {
        //         await showCategorySelectionDialog();
        //       },
        //       child: Text(
        //         selectedCategories.isEmpty
        //             ? 'Select Categories'
        //             : 'Edit Categories',
        //       ),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor:
        //             FlutterFlowTheme.of(context).dashboardSelection,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 16,
        //           vertical: 12,
        //         ),
        //       ),
        //     ),
        //     const SizedBox(width: 10),
        //     ElevatedButton(
        //       onPressed: selectedCategories.isEmpty
        //           ? null
        //           : () async {
        //               await showSubcategorySelectionDialog();
        //             },
        //       child: Text(
        //         selectedSubcategories.isEmpty
        //             ? 'Select Subcategories'
        //             : 'Edit Subcategories',
        //       ),
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor:
        //             FlutterFlowTheme.of(context).dashboardSelection,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: 16,
        //           vertical: 12,
        //         ),
        //       ),
        //     ),
        //   ],
        // ),

        const SizedBox(height: 10),
        if (selectedCategories.isNotEmpty || selectedSubcategories.isNotEmpty)
          TextButton(
            onPressed: () async {
              setState(() {
                selectedCategories = [];
                selectedSubcategories = [];
                categoryCheckboxes = {};
                subcategoryCheckboxes = {};
                allSubcategories = [];
              });
              await _loadInitialData();
            },
            child: const Text(
              'Clear All Filters',
              style: TextStyle(color: Colors.red),
            ),
          ),
        const SizedBox(height: 10),

        Expanded(
          child: Center(
            child: isLoadingProducts
                ? const CircularProgressIndicator()
                : wheelProducts.isEmpty
                    ? const Text('No products available to spin.')
                    : wheelProducts.length < 2
                        ? const Text('Not enough products to spin!')
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: widget.height,
                                width: widget.width,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  shape: BoxShape.circle,
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFF101F3C),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: FortuneWheel(
                                      onAnimationEnd: () async {
                                        print(
                                          "Wheel stopped. Selected value: $selectedValue",
                                        );

                                        if (selectedValue != null) {
                                          await fetchSelectedProductDocument(
                                            selectedValue!,
                                          );
                                        }

                                        setState(() {
                                          isSpinning = false;
                                        });
                                      },
                                      selected: controller.stream,
                                      hapticImpact: HapticImpact.heavy,
                                      animateFirst: false,
                                      indicators: const <FortuneIndicator>[
                                        FortuneIndicator(
                                          alignment: Alignment.topCenter,
                                          child: TriangleIndicator(
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                      items: [
                                        for (int i = 0;
                                            i < wheelProducts.length && i < 10;
                                            i++)
                                          FortuneItem(
                                            child: Text(
                                              wheelProducts[i],
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            style: FortuneItemStyle(
                                              color: segmentColors[
                                                  i % segmentColors.length],
                                              borderColor: Colors.white,
                                              borderWidth: 1,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (isSpinning || wheelProducts.isEmpty)
                                      return;

                                    setState(() {
                                      isSpinning = true;
                                    });

                                    final selected = Random().nextInt(
                                      wheelProducts.length,
                                    );
                                    selectedValue = wheelProducts[selected];
                                    controller.add(selected);

                                    print("Wheel spinning to: $selectedValue");
                                  },
                                  child: Container(
                                    height: 80,
                                    width: 80,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blueAccent,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black38,
                                          blurRadius: 10,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'SPIN',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
          ),
        ),
      ],
    );
  }
}
