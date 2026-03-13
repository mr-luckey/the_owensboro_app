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

// class EditCatagoryDropDown extends StatefulWidget {
//   EditCatagoryDropDown({
//     super.key,
//     this.width,
//     this.height,
//     this.selectedRef,
//   });

//   final double? width;
//   final double? height;
//   DocumentReference? selectedRef; // 🔹 change from id → reference

//   @override
//   State<EditCatagoryDropDown> createState() => _EditCatagoryDropDownState();
// }

// class _EditCatagoryDropDownState extends State<EditCatagoryDropDown> {
//   DocumentReference? selectedCategoryRef;
//   late CollectionReference categoriesCollection;

//   Future<QuerySnapshot> getCategories() async {
//     categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
//     return await categoriesCollection.get();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<QuerySnapshot>(
//       future: getCategories(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (snapshot.hasError) {
//           return Center(child: Text('Error: ${snapshot.error}'));
//         }

//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return const Center(child: Text('No categories found'));
//         }

//         // 🔹 Extract categories list
//         List<Map<String, dynamic>> categories = snapshot.data!.docs.map((doc) {
//           return {
//             'name': doc['catagoryName'],
//             'reference': doc.reference, // 🔹 Use reference directly
//           };
//         }).toList();

//         // 🔹 Set current value based on reference
//         DocumentReference? dropdownValue;
//         final categoryRefs = categories.map((c) => c['reference']).toList();

//         if (categoryRefs.contains(widget.selectedRef)) {
//           dropdownValue = widget.selectedRef;
//         }

//         return Container(
//           decoration: BoxDecoration(
//             color: const Color(0xfffcf8ea),
//             border: Border.all(color: const Color(0xfffc6e50)),
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//           child: DropdownButton<DocumentReference>(
//             value: dropdownValue, // 🔹 reference-based value
//             hint: const Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text('Please select a category'),
//             ),
//             isExpanded: true,
//             icon: const SizedBox(),
//             onChanged: (DocumentReference? newRef) {
//               setState(() {
//                 widget.selectedRef = newRef;
//                 selectedCategoryRef = newRef;

//                 FFAppState().selectedCatagoryReference = selectedCategoryRef;
//                 // .print("selectedCategoryRef: ${selectedCategoryRef?.path}");
//               });
//             },
//             items: categories.map<DropdownMenuItem<DocumentReference>>(
//               (Map<String, dynamic> category) {
//                 return DropdownMenuItem<DocumentReference>(
//                   value: category['reference'], // 🔹 Use reference as value
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(category['name']),
//                   ),
//                 );
//               },
//             ).toList(),
//             underline: Container(),
//           ),
//         );
//       },
//     );
//   }
// }
//
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
///
/// FFAppState().selectedCatagoryReference = selectedCategoryRef; //
/// .print("selectedCategoryRef: ${selectedCategoryRef?.path}"); }); }, items:
/// categories.map<DropdownMenuItem<DocumentReference>>( (Map<String, dynamic>
/// category) { return DropdownMenuItem<DocumentReference>( value:
/// category['reference'], // 🔹 Use reference as value child: Padding(
/// padding: const EdgeInsets.all(8.0), child: Text(category['name']), ), );
/// }, ).toList(), underline: Container(), ), ); }, ); } }
class EditCatagoryDropDown extends StatefulWidget {
  EditCatagoryDropDown({
    super.key,
    this.width,
    this.height,
    this.selectedRef,
  });

  final double? width;
  final double? height;
  final DocumentReference? selectedRef; // Keep this final
  @override
  State<EditCatagoryDropDown> createState() => _EditCatagoryDropDownState();
}

class _EditCatagoryDropDownState extends State<EditCatagoryDropDown> {
  DocumentReference? selectedCategoryRef;
  late CollectionReference categoriesCollection;

  @override
  void initState() {
    super.initState();
    // initialize with passed reference
    selectedCategoryRef = widget.selectedRef;
  }

  Future<QuerySnapshot> getCategories() async {
    categoriesCollection = FirebaseFirestore.instance.collection('Catagories');
    return await categoriesCollection.get();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: getCategories(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No categories found'));
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
          child: DropdownButton<DocumentReference>(
            value: selectedCategoryRef, // ✅ use local state value
            hint: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Please select a category'),
            ),
            isExpanded: true,
            icon: const SizedBox(),
            onChanged: (DocumentReference? newRef) {
              setState(() {
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
        );
      },
    );
  }
}
