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

class DropDownWidgetNew extends StatefulWidget {
  const DropDownWidgetNew({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DropDownWidgetNew> createState() => _DropDownWidgetNewState();
}

class _DropDownWidgetNewState extends State<DropDownWidgetNew> {
  String? selectedCategoryName;
  String? selectedCategoryId;
  DocumentReference? selectedCategoryRef;

  /// Load categories once during widget initialization
  late final Future<List<Map<String, dynamic>>> _categoriesFuture;

  @override
  void initState() {
    super.initState();
    _categoriesFuture = _fetchCategories();
  }

  /// Fetch categories once using Future (no real-time updates)
  Future<List<Map<String, dynamic>>> _fetchCategories() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('Catagories').get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      return snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'name': doc['catagoryName'] ?? 'Unnamed Category',
          'reference': doc.reference,
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching categories: $e');
      rethrow;
    }
  }

  /// Handle dropdown selection changes
  void _onCategoryChanged(
      String? newValue, List<Map<String, dynamic>> categories) {
    setState(() {
      selectedCategoryName = newValue;

      var selectedCategory = categories.firstWhere(
        (category) => category['name'] == newValue,
        orElse: () => categories.first,
      );
      selectedCategoryId = selectedCategory['id'];
      selectedCategoryRef = selectedCategory['reference'];
      FFAppState().selectedCatagoryReference = selectedCategoryRef;
      print("selectedCategoryId ${selectedCategoryId}");
      print(
        "selectedCategoryRef ${selectedCategoryRef?.path}",
      );
    });

    // Optional callback for parent widgets
    // if (widget.onCategorySelected != null) {
    //   widget.onCategorySelected!(
    //     id: selectedCategoryId!,
    //     name: selectedCategoryName!,
    //     reference: selectedCategoryRef!,
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 55,
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: _categoriesFuture,
        builder: (context, snapshot) {
          // Loading State
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Error State
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading categories',
                style: TextStyle(color: Colors.red[400]),
              ),
            );
          }

          // Empty State
          final categories = snapshot.data ?? [];
          if (categories.isEmpty) {
            return const Center(
              child: Text(
                'No categories found',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }

          // Success State → Show Dropdown
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xfffcf8ea),
              border: Border.all(color: const Color(0xfffc6e50)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                value: selectedCategoryName,
                hint: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Please select a category',
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
                onChanged: (value) => _onCategoryChanged(value, categories),
                items: categories.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['name'],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
