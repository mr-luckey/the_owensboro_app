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
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

String? challengeId;
String? videoUrl;
var challengeName;

class ChallengeWidgetNew extends StatefulWidget {
  const ChallengeWidgetNew({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<ChallengeWidgetNew> createState() => _ChallengeWidgetNewState();
}

class _ChallengeWidgetNewState extends State<ChallengeWidgetNew> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _listenToFirestore();
  }

  void _listenToFirestore() {
    FirebaseFirestore.instance
        .collection('challenges')
        .orderBy('createdAt', descending: true)
        .limit(1)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final newVideoUrl = doc['videoUrl'] as String?;
        final newChallengeName = doc['challengeName'] as String;
        final newChallengeId = doc.id;

        // Only update if data has changed
        if (videoUrl != newVideoUrl ||
            challengeName != newChallengeName ||
            challengeId != newChallengeId) {
          if (mounted) {
            setState(() {
              videoUrl = newVideoUrl;
              challengeName = newChallengeName;
              challengeId = newChallengeId;
              _isLoading = false;
            });
          }
        } else if (_isLoading) {
          setState(() => _isLoading = false);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AddChallengeWidget(),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 20),
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : (videoUrl == null ||
                        challengeName == null ||
                        challengeId == null)
                    ? Center(child: Text('No challenges found.'))
                    : ChallengeDisplayWidget(
                        key: ValueKey(challengeId), // Important!
                        videoUrl: videoUrl!,
                        challengeName: challengeName!,
                        challengeId: challengeId!,
                        onDelete: () async {
                          await FirebaseFirestore.instance
                              .collection('challenges')
                              .doc(challengeId)
                              .delete();
                        },
                      ),
          ),
        ],
      ),
    );
    // return Container(
    //   height: MediaQuery.of(context).size.height,
    //   width: double.infinity,
    //   color: Colors.black,
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       AddChallengeWidget(),
    //       Padding(
    //         padding: const EdgeInsets.only(left: 30, top: 20),
    //         child: StreamBuilder<QuerySnapshot>(
    //           stream: FirebaseFirestore.instance
    //               .collection('challenges')
    //               .orderBy('createdAt', descending: true)
    //               .snapshots(),
    //           builder: (context, snapshot) {
    //             if (snapshot.connectionState == ConnectionState.waiting) {
    //               return Center(child: CircularProgressIndicator());
    //             }

    //             if (snapshot.hasError) {
    //               return Center(child: Text('Error: ${snapshot.error}'));
    //             }

    //             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
    //               return Center(child: Text('No challenges found.'));
    //             }

    //             DocumentSnapshot mostRecentChallenge =
    //                 snapshot.data!.docs.first;

    //             videoUrl = mostRecentChallenge['videoUrl'];
    //             String challengeName = mostRecentChallenge['challengeName'];
    //             challengeId = mostRecentChallenge.id;

    //             return Container(
    //               color: Colors.deepOrangeAccent,
    //               height: 350,
    //               width: 700,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Align(
    //                     alignment: Alignment.topCenter,
    //                     child: AdminVideoPlayer(videoUrl: videoUrl ?? ""),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.all(10),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           challengeName,
    //                           style: TextStyle(
    //                             color: Color(0xffF6EED2),
    //                             fontSize: 16,
    //                             letterSpacing: 0.0,
    //                             fontWeight: FontWeight.bold,
    //                           ),
    //                         ),
    //                         Row(
    //                           children: [
    //                             GestureDetector(
    //                               onTap: () {
    //                                 showDialog(
    //                                   context: context,
    //                                   builder: (context) => AddBannerDialog(
    //                                     challengeId: challengeId,
    //                                     isEdit: true,
    //                                   ),
    //                                 );
    //                               },
    //                               child: Icon(
    //                                 Icons.edit,
    //                                 size: 20,
    //                                 color: Color(0xffF6EED2),
    //                               ),
    //                             ),
    //                             SizedBox(width: 10),
    //                             GestureDetector(
    //                               onTap: () {
    //                                 showDialog(
    //                                   context: context,
    //                                   builder: (context) => CustomDeleteDialog(
    //                                     onCancel: () {
    //                                       Navigator.pop(context);
    //                                     },
    //                                     onDelete: () async {
    //                                       await FirebaseFirestore.instance
    //                                           .collection('challenges')
    //                                           .doc(challengeId)
    //                                           .delete();

    //                                       setState(() {});
    //                                       Navigator.pop(context);
    //                                     },
    //                                   ),
    //                                 );
    //                               },
    //                               child: Icon(
    //                                 Icons.delete,
    //                                 size: 20,
    //                                 color: Color(0xffF6EED2),
    //                               ),
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}

class ChallengeDisplayWidget extends StatefulWidget {
  final String videoUrl;
  final String challengeName;
  final String challengeId;
  final Future<void> Function() onDelete;

  const ChallengeDisplayWidget({
    Key? key,
    required this.videoUrl,
    required this.challengeName,
    required this.challengeId,
    required this.onDelete,
  }) : super(key: key);

  @override
  State<ChallengeDisplayWidget> createState() => _ChallengeDisplayWidgetState();
}

class _ChallengeDisplayWidgetState extends State<ChallengeDisplayWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      color: Colors.deepOrangeAccent,
      height: 350,
      width: 700,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AdminVideoPlayer(
              key: ValueKey(widget.videoUrl),
              videoUrl: widget.videoUrl,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.challengeName,
                  style: TextStyle(
                    color: Color(0xffF6EED2),
                    fontSize: 16,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AddBannerDialog(
                            challengeId: widget.challengeId,
                            isEdit: true,
                          ),
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        size: 20,
                        color: Color(0xffF6EED2),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => CustomDeleteDialog(
                            onCancel: () {
                              Navigator.pop(context);
                            },
                            onDelete: () async {
                              await widget.onDelete();
                              Navigator.pop(context);
                            },
                          ),
                        );
                      },
                      child: Icon(
                        Icons.delete,
                        size: 20,
                        color: Color(0xffF6EED2),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
// class AdminVideoPlayer extends StatefulWidget {
//   final String videoUrl;

//   const AdminVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   State<AdminVideoPlayer> createState() => _AdminVideoPlayerState();
// }

// class _AdminVideoPlayerState extends State<AdminVideoPlayer> {
//   late VideoPlayerController _videoPlayerController;
//   ChewieController? _chewieController;
//   bool _isInitialized = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializePlayer();
//   }

//   Future<void> _initializePlayer() async {
//     _videoPlayerController = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//     );

//     await _videoPlayerController.initialize();

//     _chewieController = ChewieController(
//       videoPlayerController: _videoPlayerController,
//       autoPlay: false,
//       looping: false,
//       showControls: true,
//       materialProgressColors: ChewieProgressColors(
//         playedColor: Colors.blue,
//         handleColor: Colors.blueAccent,
//         backgroundColor: Colors.grey,
//         bufferedColor: Colors.lightBlue,
//       ),
//       placeholder: Container(
//         color: Colors.black,
//         child: const Center(child: CircularProgressIndicator()),
//       ),
//       autoInitialize: true,
//     );

//     setState(() {
//       _isInitialized = true;
//     });
//   }

//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isInitialized && _chewieController != null
//         ? SizedBox(height: 300, child: Chewie(controller: _chewieController!))
//         : Center(child: const CircularProgressIndicator());
//   }
// }
class AdminVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const AdminVideoPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<AdminVideoPlayer> createState() => _AdminVideoPlayerState();
}

class _AdminVideoPlayerState extends State<AdminVideoPlayer>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _isDisposed = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    if (_isDisposed) return;

    try {
      _videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );

      await _videoPlayerController!.initialize();

      if (_isDisposed || !mounted) {
        _videoPlayerController?.dispose();
        return;
      }

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController!,
        autoPlay: false,
        looping: false,
        showControls: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.blue,
          handleColor: Colors.blueAccent,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightBlue,
        ),
        placeholder: Container(
          color: Colors.black,
          child: const Center(child: CircularProgressIndicator()),
        ),
        autoInitialize: true,
      );

      if (mounted && !_isDisposed) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      print('Error initializing video player: $e');
      if (mounted && !_isDisposed) {
        setState(() {
          _isInitialized = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    _chewieController?.dispose();
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (!_isInitialized) {
      return Container(
        height: 300,
        color: Colors.black,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 300,
      child: Chewie(controller: _chewieController!),
    );
  }
}
// class ChallengeWidget extends StatefulWidget {
//   const ChallengeWidget({super.key});

//   @override
//   State<ChallengeWidget> createState() => _ChallengeWidgetState();
// }

// class _ChallengeWidgetState extends State<ChallengeWidget> {
//   String? videoUrl;
//   String? challengeId;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: double.infinity,
//       color: Colors.black,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           AddChallengeWidget(),
//           Padding(
//             padding: const EdgeInsets.only(left: 30, top: 20),
//             child: StreamBuilder<QuerySnapshot>(
//               stream: FirebaseFirestore.instance
//                   .collection('challenges')
//                   .orderBy('createdAt', descending: true)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }

//                 if (snapshot.hasError) {
//                   return Center(child: Text('Error: ${snapshot.error}'));
//                 }

//                 if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//                   return Center(child: Text('No challenges found.'));
//                 }

//                 DocumentSnapshot mostRecentChallenge =
//                     snapshot.data!.docs.first;

//                 videoUrl = mostRecentChallenge['videoUrl'];
//                 String challengeName = mostRecentChallenge['challengeName'];
//                 challengeId = mostRecentChallenge.id;

//                 return Container(
//                   color: Colors.deepOrangeAccent,
//                   height: 350,
//                   width: 700,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: AdminVideoPlayer(videoUrl: videoUrl ?? ""),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               challengeName,
//                               style: TextStyle(
//                                 color: Color(0xffF6EED2),
//                                 fontSize: 16,
//                                 letterSpacing: 0.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) => AddBannerDialog(
//                                         challengeId: challengeId,
//                                         isEdit: true,
//                                       ),
//                                     );
//                                   },
//                                   child: Icon(
//                                     Icons.edit,
//                                     size: 20,
//                                     color: Color(0xffF6EED2),
//                                   ),
//                                 ),
//                                 SizedBox(width: 10),
//                                 GestureDetector(
//                                   onTap: () {
//                                     showDialog(
//                                       context: context,
//                                       builder: (context) => CustomDeleteDialog(
//                                         onCancel: () {
//                                           Navigator.pop(context);
//                                         },
//                                         onDelete: () async {
//                                           await FirebaseFirestore.instance
//                                               .collection('challenges')
//                                               .doc(challengeId)
//                                               .delete();

//                                           setState(() {});
//                                           Navigator.pop(context);
//                                         },
//                                       ),
//                                     );
//                                   },
//                                   child: Icon(
//                                     Icons.delete,
//                                     size: 20,
//                                     color: Color(0xffF6EED2),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class AddChallengeWidget extends StatelessWidget {
  const AddChallengeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(-1, -1),
                child: Text(
                  'Challenge',
                  style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 48,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Admin can create, manage, and update weekly challenge videos easily.',
                style: TextStyle(
                  color: Color(0xffF6EED2),
                  fontSize: 16,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Builder(
            builder: (context) => InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                // if (challengeId != null) {
                //   print("challengeId null");
                // }

                showDialog(
                  context: context,
                  builder: (context) =>
                      AddBannerDialog(challengeId: null, isEdit: false),
                );
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.15,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.deepOrange),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Text(
                    'Add Challenge',
                    style: TextStyle(
                      color: Colors.deepOrange,
                      fontSize: 16,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VideoFileWrapper {
  final File? file; // For mobile
  final Uint8List? bytes; // For web
  final String? name; // File name for web
  final String? url; // For existing videos (edit mode)
  final bool isExisting; // Flag to indicate if this is an existing video

  VideoFileWrapper({
    this.file,
    this.bytes,
    this.name,
    this.url,
    this.isExisting = false,
  });

  bool get isWeb => bytes != null;
  bool get isMobile => file != null;
  bool get hasVideo => file != null || bytes != null;

  // Helper method to check if this wrapper has a new video
  bool get hasNewVideo => !isExisting && (file != null || bytes != null);

  // Helper method to check if this wrapper has an existing video
  bool get hasExistingVideo => isExisting && url != null;
}

class AddBannerDialog extends StatefulWidget {
  final String? challengeId;
  final bool isEdit;

  AddBannerDialog({Key? key, this.challengeId, this.isEdit = false})
      : super(key: key);

  @override
  State<AddBannerDialog> createState() => _AddBannerDialogState();
}

class _AddBannerDialogState extends State<AddBannerDialog> {
  final TextEditingController _bannerNameController = TextEditingController();
  final TextEditingController _challengeDescription = TextEditingController();

  bool _isVideoSelected = false;
  bool _isLoading = false;

  VideoFileWrapper? videoWrapper;

  @override
  void initState() {
    super.initState();

    if (widget.challengeId != null) {
      _loadChallengeData(widget.challengeId!);
    }
  }

  Future<void> _loadChallengeData(String challengeId) async {
    try {
      DocumentSnapshot challengeSnapshot = await FirebaseFirestore.instance
          .collection('challenges')
          .doc(challengeId)
          .get();

      if (challengeSnapshot.exists) {
        var challengeData = challengeSnapshot.data() as Map<String, dynamic>;

        _bannerNameController.text = challengeData['challengeName'] ?? '';
        _challengeDescription.text = challengeData['description'] ?? '';

        String videoUrl = challengeData['videoUrl'];
        log("videoUrl $videoUrl");
        // You can set the video wrapper here if necessary (e.g. using the videoUrl)
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error loading challenge data: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> createOrUpdateChallenge(
    String challengeName,
    String challengeDesc,
    VideoFileWrapper? videoWrapper,
  ) async {
    try {
      setState(() {
        _isLoading = true;
      });

      String finalVideoUrl;

      // Check if user selected a new video
      if (videoWrapper != null && videoWrapper.hasNewVideo) {
        // Upload new video to Firebase Storage
        log("Uploading new video...");

        String videoFileName =
            'challenges/${DateTime.now().millisecondsSinceEpoch}.mp4';
        Reference storageRef = FirebaseStorage.instance.ref(videoFileName);
        TaskSnapshot uploadTask;

        if (kIsWeb && videoWrapper.isWeb) {
          uploadTask = await storageRef.putData(
            videoWrapper.bytes!,
            SettableMetadata(contentType: 'video/mp4'),
          );
        } else if (videoWrapper.isMobile) {
          uploadTask = await storageRef.putFile(videoWrapper.file!);
        } else {
          throw Exception('Invalid video file wrapper state');
        }

        finalVideoUrl = await uploadTask.ref.getDownloadURL();
        log("New video uploaded: $finalVideoUrl");
      } else if (videoWrapper != null && videoWrapper.hasExistingVideo) {
        // Keep existing video URL (edit mode - no new video selected)
        finalVideoUrl = videoWrapper.url!;
        log("Using existing video URL: $finalVideoUrl");
      } else if (widget.challengeId != null &&
          videoUrl != null &&
          videoUrl!.isNotEmpty) {
        // Fallback: use the existing videoUrl from state (edit mode)
        finalVideoUrl = videoUrl!;
        log("Using stored video URL: $finalVideoUrl");
      } else {
        // No video available
        throw Exception('No video available. Please select a video.');
      }

      Map<String, dynamic> challengeData = {
        'challengeName': challengeName,
        'description': challengeDesc,
        'videoUrl': finalVideoUrl,
      };

      if (widget.challengeId == null) {
        // Create new challenge
        challengeData['createdAt'] = FieldValue.serverTimestamp();

        await FirebaseFirestore.instance
            .collection('challenges')
            .add(challengeData);

        log("Challenge created successfully");
      } else {
        // Update existing challenge
        challengeData['updatedAt'] = FieldValue.serverTimestamp();

        await FirebaseFirestore.instance
            .collection('challenges')
            .doc(widget.challengeId)
            .update(challengeData);

        log("Challenge updated successfully");
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Challenge ${widget.challengeId == null ? 'created' : 'updated'} successfully!',
            ),
            backgroundColor: Colors.green,
          ),
        );

        setState(() {
          _isLoading = false;
        });

        Navigator.of(context).pop();
      }
    } catch (e) {
      log("Error: ${e.toString()}");

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: const Color(0xFFF9F1E2),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.challengeId == null
                        ? 'Add Challenge'
                        : 'Edit Challenge',
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Challenge Name *',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB35E4E),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _bannerNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFF09A7A), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(fontSize: 16.0, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Challenge Description *',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFFB35E4E),
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _challengeDescription,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFF09A7A), width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Color(0xFFD0D0D0), width: 1.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                fillColor: Colors.white,
                filled: true,
              ),
              style: const TextStyle(fontSize: 16.0, color: Color(0xFF333333)),
            ),
            const SizedBox(height: 10.0),
            CustomVideoPickerWidget(
              initialVideoUrl: videoUrl,
              isEditMode: widget.isEdit,
              height: 300,
              primaryColor: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
              onVideoSelected: (wrapper) {
                if (wrapper != null && wrapper.hasVideo) {
                  videoWrapper = wrapper;
                  log('Video selected for ${kIsWeb ? 'web' : 'mobile'}');
                  _isVideoSelected = true;
                } else {
                  print('Video removed');
                  videoWrapper = null;
                  _isVideoSelected = false;
                }
              },
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: _isLoading
                  ? Center(
                      child: CircularProgressIndicator(
                        color: const Color(0xFFF09A7A),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        print('Banner Name: ${_bannerNameController.text}');

                        if (_bannerNameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Please enter a challenge name.',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (_challengeDescription.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Please enter a challenge description.',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else if (videoWrapper == null &&
                            widget.challengeId == null) {
                          // Only require video for new challenges (create mode)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Please select a video.'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        } else {
                          log("Processing challenge...");

                          widget.isEdit
                              ? createOrUpdateChallenge(
                                  _bannerNameController.text,
                                  _challengeDescription.text,
                                  videoWrapper,
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) => CheckChallenge(
                                    onYes: () async {
                                      createOrUpdateChallenge(
                                        _bannerNameController.text,
                                        _challengeDescription.text,
                                        videoWrapper,
                                      );
                                      Navigator.pop(context);
                                    },
                                    onNo: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF09A7A),
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        widget.challengeId == null
                            ? 'Create Challenge'
                            : 'Update Challenge',
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDeleteDialog extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onCancel;

  const CustomDeleteDialog({
    Key? key,
    required this.onDelete,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Delete Challenge',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Description
            Text(
              'Are you sure you want to delete this challenge?',
              style: TextStyle(fontSize: 16.0, color: Color(0xFF666666)),
            ),
            const SizedBox(height: 24.0),

            // Buttons (Yes / No)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Yes Button
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 40.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // No Button
                GestureDetector(
                  onTap: onCancel,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 40.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckChallenge extends StatelessWidget {
  final VoidCallback onYes;
  final VoidCallback onNo;

  const CheckChallenge({Key? key, required this.onYes, required this.onNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Title
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Challenge Update',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF333333),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Description
            Text(
              'Are you sure you want to update this challenge?',
              style: TextStyle(fontSize: 16.0, color: Color(0xFF666666)),
            ),
            const SizedBox(height: 24.0),

            // Buttons (Yes / No)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Yes Button
                GestureDetector(
                  onTap: onYes,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 40.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                // No Button
                GestureDetector(
                  onTap: onNo,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 14.0,
                      horizontal: 40.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomVideoPickerWidget extends StatefulWidget {
  final Function(VideoFileWrapper?)? onVideoSelected;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final Color? primaryColor;
  final String? initialVideoUrl; // For edit case
  final bool isEditMode; // To distinguish between create and edit

  const CustomVideoPickerWidget({
    Key? key,
    this.onVideoSelected,
    this.height,
    this.width,
    this.borderRadius,
    this.primaryColor,
    this.initialVideoUrl,
    this.isEditMode = false,
  }) : super(key: key);

  @override
  State<CustomVideoPickerWidget> createState() =>
      _CustomVideoPickerWidgetState();
}

class _CustomVideoPickerWidgetState extends State<CustomVideoPickerWidget> {
  VideoFileWrapper? _videoWrapper;
  VideoPlayerController? _controller;
  final ImagePicker _picker = ImagePicker();
  bool _isLoading = false;
  bool _hasNewVideo = false; // Track if user selected a new video

  Color get primaryColor => widget.primaryColor ?? Colors.deepPurple;

  @override
  void initState() {
    super.initState();
    // Load initial video in edit mode
    if (widget.isEditMode && widget.initialVideoUrl != null) {
      _loadInitialVideo();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _loadInitialVideo() async {
    setState(() => _isLoading = true);

    try {
      // Create a wrapper to indicate this is an existing video
      _videoWrapper = VideoFileWrapper(
        url: widget.initialVideoUrl,
        isExisting: true,
      );

      await _initializeVideoFromUrl(widget.initialVideoUrl!);
    } catch (e) {
      _showErrorSnackbar('Failed to load video: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _initializeVideoFromUrl(String url) async {
    _controller?.dispose();
    _controller = VideoPlayerController.networkUrl(Uri.parse(url))
      ..initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.addListener(() {
          setState(() {});
        });
      }).catchError((error) {
        _showErrorSnackbar('Failed to load video from URL');
      });
  }

  Future<void> _pickVideo(ImageSource source) async {
    setState(() => _isLoading = true);

    try {
      final XFile? pickedFile = await _picker.pickVideo(source: source);

      if (pickedFile != null) {
        _hasNewVideo = true; // Mark that a new video was selected

        if (kIsWeb) {
          // Web handling - read bytes
          final Uint8List videoBytes = await pickedFile.readAsBytes();
          _videoWrapper = VideoFileWrapper(
            bytes: videoBytes,
            name: pickedFile.name,
            isExisting: false,
          );
          await _initializeVideoWeb(pickedFile);
        } else {
          // Mobile handling
          _videoWrapper = VideoFileWrapper(
            file: File(pickedFile.path),
            isExisting: false,
          );
          await _initializeVideoMobile();
        }
        widget.onVideoSelected?.call(_videoWrapper);
      }
    } catch (e) {
      _showErrorSnackbar('Error: ${e.toString()}');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _initializeVideoMobile() async {
    if (_videoWrapper?.file == null) return;

    _controller?.dispose();
    _controller = VideoPlayerController.file(_videoWrapper!.file!)
      ..initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.addListener(() {
          setState(() {});
        });
      }).catchError((error) {
        _showErrorSnackbar('Failed to load video');
      });
  }

  Future<void> _initializeVideoWeb(XFile file) async {
    _controller?.dispose();
    _controller = VideoPlayerController.networkUrl(Uri.parse(file.path))
      ..initialize().then((_) {
        setState(() {});
        _controller!.setLooping(true);
        _controller!.addListener(() {
          setState(() {});
        });
      }).catchError((error) {
        _showErrorSnackbar('Failed to load video');
      });
  }

  void _showErrorSnackbar(String message) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.white),
              const SizedBox(width: 12),
              Expanded(child: Text(message)),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }
  }

  void _showSourceDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.isEditMode ? 'Change Video Source' : 'Choose Video Source',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            _buildSourceOption(
              icon: Icons.video_library_rounded,
              title: 'Gallery',
              subtitle:
                  kIsWeb ? 'Pick from your files' : 'Pick from your videos',
              color: primaryColor,
              onTap: () {
                Navigator.pop(context);
                _pickVideo(ImageSource.gallery);
              },
            ),
            if (!kIsWeb) ...[
              const SizedBox(height: 12),
              _buildSourceOption(
                icon: Icons.videocam_rounded,
                title: 'Camera',
                subtitle: 'Record a new video',
                color: Colors.red,
                onTap: () {
                  Navigator.pop(context);
                  _pickVideo(ImageSource.camera);
                },
              ),
            ],
            if (kIsWeb)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.blue, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Camera not available on web',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSourceOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return InkWell(
      onTap: _showSourceDialog,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              primaryColor.withOpacity(0.1),
              primaryColor.withOpacity(0.05),
            ],
          ),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
          border: Border.all(
            color: primaryColor.withOpacity(0.3),
            width: 2,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: primaryColor.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.play_circle_outline_rounded,
                size: 60,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Tap to Pick Video',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              kIsWeb ? 'From your files' : 'From gallery or camera',
              style: TextStyle(fontSize: 13, color: Colors.grey[600]),
            ),
            if (kIsWeb)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.orange.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.language, color: Colors.orange, size: 16),
                      const SizedBox(width: 6),
                      const Text(
                        'Running on Web',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: primaryColor),
              const SizedBox(height: 16),
              const Text(
                'Loading video...',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ],
          ),
        ),
      );
    }

    return Stack(
      children: [
        ClipRRect(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller!.value.size.width,
                height: _controller!.value.size.height,
                child: VideoPlayer(_controller!),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.4)],
              ),
            ),
          ),
        ),
        Positioned(
          top: 12,
          right: 12,
          child: Row(
            children: [
              _buildIconButton(
                icon: Icons.change_circle_rounded,
                onPressed: _showSourceDialog,
                tooltip: 'Change Video',
              ),
              const SizedBox(width: 8),
              _buildIconButton(
                icon: Icons.delete_rounded,
                onPressed: () {
                  setState(() {
                    _videoWrapper = null;
                    _controller?.dispose();
                    _controller = null;
                    _hasNewVideo = false;
                  });
                  widget.onVideoSelected?.call(null);
                },
                tooltip: 'Remove Video',
                color: Colors.red,
              ),
            ],
          ),
        ),
        // Show different badges for edit mode
        if (widget.isEditMode)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _hasNewVideo
                    ? Colors.green.withOpacity(0.9)
                    : Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    _hasNewVideo ? Icons.fiber_new_rounded : Icons.edit_rounded,
                    color: Colors.white,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _hasNewVideo ? 'New Video' : 'Current Video',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        else if (kIsWeb)
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.language, color: Colors.white, size: 14),
                  SizedBox(width: 6),
                  Text(
                    'Web Mode',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              });
            },
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(
                _controller!.value.isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                size: 48,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${_formatDuration(_controller!.value.position)} / ${_formatDuration(_controller!.value.duration)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: VideoProgressIndicator(
                  _controller!,
                  allowScrubbing: true,
                  padding: EdgeInsets.zero,
                  colors: VideoProgressColors(
                    playedColor: primaryColor,
                    bufferedColor: Colors.white.withOpacity(0.3),
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required String tooltip,
    Color? color,
  }) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: (color ?? Colors.white).withOpacity(0.9),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Icon(icon, color: color ?? Colors.black87, size: 20),
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 400,
      width: widget.width ?? double.infinity,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: _isLoading
          ? Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(color: primaryColor),
                    const SizedBox(height: 16),
                    Text(
                      kIsWeb ? 'Loading video from web...' : 'Loading video...',
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          : _videoWrapper == null
              ? _buildPlaceholder()
              : _buildVideoPlayer(),
    );
  }
}
