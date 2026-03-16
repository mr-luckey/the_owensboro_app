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

class WheelMobile extends StatefulWidget {
  const WheelMobile({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<WheelMobile> createState() => _WheelMobileState();
}

class _WheelMobileState extends State<WheelMobile> {
  StreamController<int> controller = StreamController<int>.broadcast();

  late CollectionReference categoriesCollection;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    _loadCategoriesOnce();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  var value;
  List<String> options = [];
  bool isLoadingCategories = true;

  // Future<void> _loadCategoriesOnce() async {
  //   categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
  //   QuerySnapshot snapshot = await categoriesCollection.get();

  //   setState(() {
  //     options =
  //         snapshot.docs.map((doc) => doc['catagoryName'].toString()).toList();
  //     isLoadingCategories = false;
  //   });
  // }

  Future<void> _loadCategoriesOnce() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    QuerySnapshot snapshot = await categoriesCollection.get();

    setState(() {
      options =
          snapshot.docs.map((doc) => doc['catagoryName'].toString()).toList();
      isLoadingCategories = false;

      // Initialize selectedCategories with the first 10 categories
      selectedCategories = options.take(10).toList();
      // Initialize categoryCheckboxes based on selectedCategories
      categoryCheckboxes =
          Map.fromIterable(selectedCategories, value: (v) => true);
    });
  }

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
    Colors.lime,
    Colors.deepOrange,
    Colors.lightBlue,
    Colors.lightGreen,
    Colors.purple,
    Colors.yellow,
    Colors.brown,
    Colors.blueGrey,
  ];

  List<String> allCategories = [];
  List<String> selectedCategories = [];
  Map<String, bool> categoryCheckboxes = {};

  // Future<void> loadCategories() async {
  //   if (allCategories.isEmpty) {
  //     allCategories = List.from(options);
  //     for (var category in allCategories) {
  //       categoryCheckboxes[category] = false;
  //     }
  //   }
  //   setState(() {});
  // }
  Future<void> loadCategories() async {
    // Load all available categories from the firestore
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('Catagories').get();
    allCategories =
        snapshot.docs.map((doc) => doc['catagoryName'].toString()).toList();
  }

  Future<void> showCategorySelectionDialog() async {
    // Initialize tempCheckboxes based on selectedCategories
    Map<String, bool> tempCheckboxes = Map.from(categoryCheckboxes);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            int selectedCount =
                tempCheckboxes.values.where((v) => v == true).length;

            return AlertDialog(
              title: Text('Choose Categories (${selectedCount}/10)'),
              content: Container(
                height: 300,
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
                              if (value == true && selectedCount >= 10) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'You can select a maximum of 10 categories.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }
                              if (value == false && selectedCount <= 8) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                        'You must select at least 8 categories.'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                return;
                              }

                              setDialogState(() {
                                tempCheckboxes[category] = value ?? false;
                              });
                              // if (value == true && selectedCount >= 15) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //           'You can select a maximum of 15 categories.'),
                              //       duration: Duration(seconds: 2),
                              //     ),
                              //   );
                              //   return;
                              // }

                              // // Prevent deselecting if selected count is less than 10
                              // if (value == false && selectedCount <= 10) {
                              //   ScaffoldMessenger.of(context).showSnackBar(
                              //     const SnackBar(
                              //       content: Text(
                              //           'You must select at least 10 categories.'),
                              //       duration: Duration(seconds: 2),
                              //     ),
                              //   );
                              //   return;
                              // }

                              // // Update the state of tempCheckboxes
                              // setDialogState(() {
                              //   tempCheckboxes[category] = value ?? false;
                              // });
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
                  onPressed: () {
                    setState(() {
                      categoryCheckboxes = tempCheckboxes;
                      selectedCategories = categoryCheckboxes.entries
                          .where((entry) => entry.value == true)
                          .map((entry) => entry.key)
                          .toList();
                    });

                    print('Selected Categories: $selectedCategories');
                    Get.back();
                  },
                  child: const Text('Update'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  int? selectedIndex;
  DocumentReference? selectedCategoryRef;
  CatagoriesRecord? selectedCategoryRecord;

  Future<void> fetchSelectedCategoryDocument(String categoryName) async {
    try {
      print("Fetching document for category: $categoryName");

      QuerySnapshot categorySnapshot = await FirebaseFirestore.instance
          .collection('Catagories')
          .where('catagoryName', isEqualTo: categoryName)
          .limit(1)
          .get();

      if (categorySnapshot.docs.isNotEmpty) {
        DocumentSnapshot doc = categorySnapshot.docs.first;

        selectedCategoryRecord = CatagoriesRecord.fromSnapshot(doc);
        selectedCategoryRef = doc.reference;

        print("✅ Category Document Found!");
        print("Document ID: ${doc.id}");
        print("Document Reference: ${selectedCategoryRef!.path}");
        print("Category Name: ${selectedCategoryRecord!.catagoryName}");

        // await widget.selectedDoc?.call(selectedCategoryRecord);

        Get.toNamed(EventsEntertainmentScreenCopyWidget.routePath, arguments: <String, dynamic>{'catagories': selectedCategoryRecord});
      } else {
        print("❌ Category document not found: $categoryName");
        selectedCategoryRecord = null;
        selectedCategoryRef = null;
      }
    } catch (e) {
      print("❌ Error fetching category document: $e");
      selectedCategoryRecord = null;
      selectedCategoryRef = null;
    }
  }

  bool isSpinning = false;

  @override
  Widget build(BuildContext context) {
    List<String> wheelCategories =
        selectedCategories.isEmpty ? options : selectedCategories;

    return Column(
      children: [
        Expanded(
          child: Center(
            child: isLoadingCategories
                ? const CircularProgressIndicator()
                : options.isEmpty
                    ? const Text(
                        'No categories found.',
                        style: TextStyle(color: Colors.white),
                      )
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
                                padding: const EdgeInsets.all(20),
                                child: FortuneWheel(
                                  onAnimationEnd: () async {
                                    // print(
                                    //     "Wheel stopped. Selected value: $selectedValue");
                                    // if (selectedValue != null && !isSpinning) {
                                    //   return; // Prevent double execution
                                    // }

                                    // if (selectedValue != null) {
                                    //   await fetchSelectedCategoryDocument(
                                    //       selectedValue!);
                                    // }

                                    // setState(() {
                                    //   isSpinning = false;
                                    // });
                                    print(
                                        "Wheel stopped. Selected value: $selectedValue");
                                    if (selectedValue != null && !isSpinning) {
                                      return; // Prevent double execution
                                    }

                                    if (selectedValue != null) {
                                      await fetchSelectedCategoryDocument(
                                          selectedValue!);
                                    }

                                    setState(() {
                                      isSpinning = false;
                                    });
                                  },
                                  selected: controller.stream,
                                  hapticImpact: HapticImpact.heavy,
                                  indicators: const <FortuneIndicator>[
                                    FortuneIndicator(
                                      alignment: Alignment.topCenter,
                                      child: TriangleIndicator(
                                          color: Colors.yellow),
                                    ),
                                  ],
                                  items: [
                                    for (int i = 0;
                                        i < wheelCategories.length && i < 10;
                                        i++)
                                      FortuneItem(
                                        child: Text(
                                          wheelCategories[i],
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.white),
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
                                // if (isSpinning || wheelCategories.isEmpty)
                                //   return;

                                // setState(() {
                                //   isSpinning = true;
                                // });

                                // final selected =
                                //     Random().nextInt(wheelCategories.length);
                                // selectedValue = wheelCategories[selected];
                                // controller.add(selected);

                                // print("Wheel spinning to: $selectedValue");
                                if (isSpinning || wheelCategories.isEmpty)
                                  return;

                                setState(() {
                                  isSpinning = true;
                                });

                                final selected =
                                    Random().nextInt(wheelCategories.length);
                                selectedValue = wheelCategories[selected];
                                controller.add(selected);

                                print("Wheel spinning to: $selectedValue");
                              },
                              child: Container(
                                height: 50,
                                width: 50,
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
                                      fontSize: 12,
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
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // if (selectedCategories.isNotEmpty)
              //   Text(
              //     'Showing ${selectedCategories.length} selected categories',
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //     ),
              //   ),
              // const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (allCategories.isEmpty) {
                    loadCategories().then((_) {
                      showCategorySelectionDialog();
                    });
                  } else {
                    showCategorySelectionDialog();
                  }
                },
                child: Text(selectedCategories.isEmpty
                    ? 'Choose Categories'
                    : 'Edit Categories'),
              ),
              // if (selectedCategoryRecord != null) ...[
              //   const SizedBox(height: 10),
              //   Text(
              //     'Selected: ${selectedCategoryRecord!.catagoryName}',
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontWeight: FontWeight.bold,
              //       fontSize: 16,
              //       letterSpacing: 1.2,
              //     ),
              //   ),
              // ],
            ],
          ),
        ),
      ],
    );
  }
}
