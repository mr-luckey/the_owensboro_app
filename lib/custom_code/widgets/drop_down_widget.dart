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

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedCategoryName;
  String? selectedCategoryId;
  DocumentReference? selectedCategoryRef;
  late CollectionReference categoriesCollection;

  // Modified to return a Future that fetches categories
  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection
        .get(); // Fetch categories and return the result
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
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

        // Extract category names and IDs from Firestore documents
        List<Map<String, dynamic>> categories = snapshot.data!.docs.map((
          doc,
        ) {
          return {
            'id': doc.id,
            'name': doc['catagoryName'],
            'reference': doc.reference,
          };
        }).toList();

        return Container(
          decoration: BoxDecoration(
            color: Color(0xfffcf8ea),
            border: Border.all(color: Color(0xfffc6e50)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: selectedCategoryName,
                  hint: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Please select a category'),
                  ),
                  icon: SizedBox(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCategoryName = newValue;

                      var selectedCategory = categories.firstWhere(
                        (category) => category['name'] == newValue,
                        orElse: () => categories.first,
                      );
                      selectedCategoryId = selectedCategory['id'];
                      selectedCategoryRef = selectedCategory['reference'];
                      FFAppState().selectedCatagoryReference =
                          selectedCategoryRef;
                      print("selectedCategoryId ${selectedCategoryId}");
                      print(
                        "selectedCategoryRef ${selectedCategoryRef?.path}",
                      );
                    });
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
    );
  }
}
