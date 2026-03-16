// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/index.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:drop_down_search_field/drop_down_search_field.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  // List<String> selectedItems = [];
  // final TextEditingController _searchController = TextEditingController();
  // String? selectedProductDetails = ''; // Store selected product details
  // String? selectedProductId; // Store the selected product's document ID

  // // Fetch products from Firestore based on the search query
  // Future<List<Map<String, dynamic>>> fetchSuggestions(String query) async {
  //   await Future.delayed(
  //     const Duration(milliseconds: 300),
  //   ); // Simulate network delay

  //   // Reference to your Firestore collection
  //   final productRef = FirebaseFirestore.instance.collection('Products');

  //   // Get the products from Firestore
  //   QuerySnapshot querySnapshot;
  //   if (query.isEmpty) {
  //     // Fetch all products if query is empty
  //     querySnapshot = await productRef.get();
  //   } else {
  //     // Filter products by search query
  //     querySnapshot = await productRef
  //         .where('productName', isGreaterThanOrEqualTo: query)
  //         .where('productName', isLessThanOrEqualTo: query + '\uf8ff')
  //         .get();
  //   }

  //   // Extract complete product data from the documents
  //   List<Map<String, dynamic>> suggestions = [];
  //   for (var doc in querySnapshot.docs) {
  //     // final selectedData = doc.data();

  //     String productName = doc['productName'] ?? 'Unknown Product';

  //     suggestions.add({
  //       'id': doc.id, // Store document ID
  //       'productName': productName,
  //     });
  //   }

  //   return suggestions;
  // }

  // // Fetch the complete product details based on the selected product ID
  // Future<void> fetchProductDetails(String productId) async {
  //   try {
  //     DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
  //         .collection('Products')
  //         .doc(productId)
  //         .get();

  //     if (docSnapshot.exists) {
  //       var productData = docSnapshot.data() as Map<String, dynamic>;

  //       setState(() {
  //         selectedProductDetails = 'Name: ${productData['productName']}\n'
  //             'Price: ${productData['price']}\n'
  //             'Description: ${productData['description']}';
  //       });

  //       var selectedProductRecord = ProductsRecord.fromSnapshot(docSnapshot);
  //       context.pushNamed(
  //         "ListingDetailPage",
  //         extra: {
  //           "product": selectedProductRecord,
  //         },
  //       );
  //     }
  //   } catch (e) {
  //     // log("Error fetching product details: $e");
  //   }
  // }

  List<String> selectedItems = [];
  final TextEditingController _searchController = TextEditingController();
  String? selectedProductDetails = ''; // Store selected product details
  String? selectedProductId; // Store the selected product's document ID

// Fetch products from Firestore based on the search query
  Future<List<Map<String, dynamic>>> fetchSuggestions(String query) async {
    // debugger();
    // log("query $query");
    await Future.delayed(
      const Duration(milliseconds: 300),
    ); // Simulate network delay

    // Reference to your Firestore collection
    final productRef = FirebaseFirestore.instance.collection('Products');

    // Get all products from Firestore
    QuerySnapshot querySnapshot = await productRef.get();

    // Extract complete product data from the documents
    List<Map<String, dynamic>> suggestions = [];
    Set<String> addedProductNames =
        {}; // Track added product names to avoid duplicates
    String searchLower = query.toLowerCase().trim();

    for (var doc in querySnapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;

      String productName = (data['productName'] ?? '').toString().toLowerCase();
      String originalProductName = data['productName'] ?? 'Unknown Product';
      String category = (data['category'] ?? '').toString().toLowerCase();
      String subcategory = (data['subcategory'] ?? '').toString().toLowerCase();

      bool shouldAdd = false;

      // If query is empty, show all products
      if (query.isEmpty) {
        shouldAdd = true;
      }
      // Agar user ne category name search kiya (e.g., "Food")
      // To us category ki saari products dikhao (saari subcategories ki)
      else if (category.contains(searchLower)) {
        shouldAdd = true;
      }
      // Agar subcategory match ho rahi hai
      else if (subcategory.contains(searchLower)) {
        shouldAdd = true;
      }
      // Agar product name match ho raha hai
      else if (productName.contains(searchLower)) {
        shouldAdd = true;
      }

      // Only add if product name not already added (no duplicate names)
      if (shouldAdd && !addedProductNames.contains(productName)) {
        addedProductNames.add(productName);
        suggestions.add({
          'id': doc.id,
          'productName': originalProductName,
          'category': data['category'] ?? '',
          'subcategory': data['subcategory'] ?? '',
        });
      }
    }

    return suggestions;
  }

// Fetch the complete product details based on the selected product ID
  Future<void> fetchProductDetails(String productId) async {
    try {
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('Products')
          .doc(productId)
          .get();

      if (docSnapshot.exists) {
        var productData = docSnapshot.data() as Map<String, dynamic>;
        setState(() {
          selectedProductDetails = 'Name: ${productData['productName']}\n'
              'Price: ${productData['price']}\n'
              'Description: ${productData['description']}';
        });

        var selectedProductRecord = ProductsRecord.fromSnapshot(docSnapshot);
        Get.toNamed(
          ListingDetailPageWidget.routePath,
          arguments: {'product': selectedProductRecord},
        );
      }
    } catch (e) {
      // log("Error fetching product details: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    // return DropDownSearchField(
    //   isMultiSelectDropdown: false,
    //   textFieldConfiguration: TextFieldConfiguration(
    //     controller: _searchController,
    //     decoration: const InputDecoration(
    //       fillColor: Colors.white,
    //       filled: true,
    //       hintText: "Search here...",
    //       // labelText: 'Search here...',
    //       border: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       enabledBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       focusedBorder: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),

    //       contentPadding: EdgeInsets.all(12.0),
    //       suffixIcon: Icon(Icons.arrow_drop_down),
    //     ),
    //   ),
    //   suggestionsCallback: (pattern) async {
    //     return await fetchSuggestions(pattern);
    //   },
    //   itemBuilder: (context, Map<String, dynamic> suggestion) {
    //     return ListTile(
    //       title: Text(suggestion['productName'] ?? 'Unknown'),
    //     );
    //   },
    //   onSuggestionSelected: (Map<String, dynamic> suggestion) {
    //     // Store the selected product's document ID
    //     selectedProductId = suggestion['id'];
    //     _searchController.text = suggestion['productName'] ?? 'Unknown';

    //     // Fetch the complete details of the selected product using the document ID
    //     if (selectedProductId != null) {
    //       fetchProductDetails(selectedProductId!);
    //     }
    //   },
    //   displayAllSuggestionWhenTap: true,
    //   suggestionsBoxDecoration: SuggestionsBoxDecoration(
    //     constraints: BoxConstraints(
    //       maxHeight: 200, // Set your desired height here (e.g., 200 pixels)
    //     ),
    //     elevation: 4.0,
    //     borderRadius: BorderRadius.circular(10),
    //   ),
    // );
    return DropDownSearchField(
      isMultiSelectDropdown: false,
      textFieldConfiguration: TextFieldConfiguration(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 20, right: 10),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
          ),
          hintText: "Search Owensboro...",
          hintStyle: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
      ),
      suggestionsCallback: (pattern) async {
        return await fetchSuggestions(pattern);
      },
      itemBuilder: (context, Map<String, dynamic> suggestion) {
        String subtitle = '';
        if (suggestion['category'] != null &&
            suggestion['category'].toString().isNotEmpty) {
          subtitle = suggestion['category'];
          if (suggestion['subcategory'] != null &&
              suggestion['subcategory'].toString().isNotEmpty) {
            subtitle += ' - ${suggestion['subcategory']}';
          }
        }

        return ListTile(
          title: Text(suggestion['productName'] ?? 'Unknown'),
          subtitle: subtitle.isNotEmpty
              ? Text(
                  subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                )
              : null,
        );
      },
      onSuggestionSelected: (Map<String, dynamic> suggestion) {
        selectedProductId = suggestion['id'];
        _searchController.text = suggestion['productName'] ?? 'Unknown';

        if (selectedProductId != null) {
          fetchProductDetails(selectedProductId!);
        }
      },
      displayAllSuggestionWhenTap: true,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        constraints: BoxConstraints(maxHeight: 200),
        elevation: 4.0,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
