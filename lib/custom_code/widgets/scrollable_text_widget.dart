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

import 'dart:developer';

import 'dart:async';

import 'package:marquee/marquee.dart';

class ScrollableTextWidget extends StatefulWidget {
  const ScrollableTextWidget({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ScrollableTextWidget> createState() => _ScrollableTextWidgetState();
}

class _ScrollableTextWidgetState extends State<ScrollableTextWidget> {
  List<Map<String, dynamic>> bannerItems = [];

  final ScrollController _scrollController = ScrollController();
  double scrollPosition = 0;
  Timer? autoScrollTimer;

  @override
  void initState() {
    super.initState();
    fetchBanners();
  }

  @override
  void dispose() {
    autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> fetchBanners() async {
    try {
      final firestore = FirebaseFirestore.instance;
      final querySnapshot = await firestore.collection('Banner').get();

      List<Map<String, dynamic>> items = [];

      for (var doc in querySnapshot.docs) {
        final data = doc.data();

        items.add({
          "image": data["image"] ?? "",
          "bannerName": data["bannerName"] ?? "",
          "CatagoryRef": data["CatagoryRef"], // Add category reference
          "SubCatagoryRef": data["SubCatagoryRef"],
          "productRef": data["productRef"],
        });
      }

      setState(() {
        bannerItems = items;
      });

      if (items.isNotEmpty) startAutoScroll();
    } catch (e) {
      print("Error fetching banners: $e");
      setState(() {
        bannerItems = [];
      });
    }
  }

  void startAutoScroll() {
    autoScrollTimer = Timer.periodic(Duration(milliseconds: 25), (timer) {
      if (!_scrollController.hasClients) return;

      scrollPosition += 1;

      final maxScroll = _scrollController.position.maxScrollExtent;
      _scrollController.jumpTo(scrollPosition % (maxScroll + 200));
    });
  }

  navigateToCategoryOrSubCategory(Map<String, dynamic> bannerItem) async {
    final categoryRef = bannerItem["CatagoryRef"];
    final subcategoryRef = bannerItem["SubCatagoryRef"];
    final productRef = bannerItem["productRef"];

    if (categoryRef != null) {
      if (productRef != null) {
        // Fetch the product document and navigate to ProductDetailScreen
        DocumentSnapshot productDoc = await productRef.get();
        var selectedProductRecord = ProductsRecord.fromSnapshot(productDoc);
        context.pushNamed(
          "ListingDetailPage",
          extra: {
            "product": selectedProductRecord,
          },
        );

        log("Product Detail");
      } else if (subcategoryRef != null) {
        // Fetch the subcategory document and navigate to SubCategoryScreen
        DocumentSnapshot subCatagoryDoc = await subcategoryRef.get();
        var selectedSubCategoryRecord =
            SubCatagoriesRecord.fromSnapshot(subCatagoryDoc);
        context.pushNamed(
          "SubCatagoryScreen",
          extra: {
            "subCatagoriesRef": selectedSubCategoryRecord,
          },
        );

        log("Sub Category");
      } else {
        // Fetch the category document and navigate to EventsEntertainmentScreenCopy
        DocumentSnapshot catDoc = await categoryRef.get();
        var selectedCategoryRecord = CatagoriesRecord.fromSnapshot(catDoc);
        context.pushNamed(
          "EventsEntertainmentScreenCopy",
          extra: <String, dynamic>{
            "catagories": selectedCategoryRecord,
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final safeItems = bannerItems;

    return Container(
      height: 80,
      color: FlutterFlowTheme.of(context).secondaryBackground,
      child: safeItems.isEmpty
          ? Center(
              child: Text(
                "Loading banners...",
                style: TextStyle(color: Colors.white),
              ),
            )
          : ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: safeItems.length * 1000,
              itemBuilder: (context, index) {
                final item = safeItems[index % safeItems.length];
                final imageUrl = item["image"];
                final text = item["bannerName"];

                return GestureDetector(
                  onTap: () => navigateToCategoryOrSubCategory(item),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          text,
                          style: TextStyle(
                            color:
                                FlutterFlowTheme.of(context).dashboardSelection,
                            fontSize: 18,
                            fontFamily: 'Courier',
                          ),
                        ),
                        const SizedBox(width: 8),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
