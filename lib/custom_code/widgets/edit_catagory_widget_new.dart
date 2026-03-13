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

class EditCatagoryWidgetNew extends StatefulWidget {
  const EditCatagoryWidgetNew({
    super.key,
    this.width,
    this.height,
    this.selectedRef,
  });

  final double? width;
  final double? height;
  final DocumentReference? selectedRef;

  @override
  State<EditCatagoryWidgetNew> createState() => _EditCatagoryWidgetNewState();
}

class _EditCatagoryWidgetNewState extends State<EditCatagoryWidgetNew> {
  DocumentReference? selectedCategoryRef;
  late CollectionReference categoriesCollection;
  Future<QuerySnapshot>? _categoriesFuture;

  @override
  void initState() {
    super.initState();
    // Initialize with passed reference
    selectedCategoryRef = widget.selectedRef;
    // Initialize the future once
    _categoriesFuture = getCategories();
  }

  @override
  void didUpdateWidget(EditCatagoryWidgetNew oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reload data if the widget is rebuilt with different parameters
    if (oldWidget.selectedRef != widget.selectedRef) {
      selectedCategoryRef = widget.selectedRef;
      _categoriesFuture = getCategories();
    }
  }

  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection.get();
  }

  // Method to refresh the data
  void refreshCategories() {
    setState(() {
      _categoriesFuture = getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 42,
      child: FutureBuilder<QuerySnapshot>(
        future: _categoriesFuture, // ✅ Use stored future
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Container(
              decoration: BoxDecoration(
                color: const Color(0xfffcf8ea),
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline,
                        color: Colors.red, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      'Error loading categories',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                    IconButton(
                      icon: const Icon(Icons.refresh, size: 16),
                      onPressed: refreshCategories,
                    ),
                  ],
                ),
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
              child: const Center(
                child: Text(
                  'No categories found',
                  style: TextStyle(color: Color(0xffFC6E50)),
                ),
              ),
            );
          }

          List<Map<String, dynamic>> categories =
              snapshot.data!.docs.map((doc) {
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
                  // ✅ Added setState to trigger rebuild
                  selectedCategoryRef = newRef;
                  print("selectedCategoryRef: ${selectedCategoryRef?.path}");
                  FFAppState().selectedCatagoryReference = selectedCategoryRef;
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
      ),
    );
  }
}
