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

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    this.width,
    this.height,
    this.onStartTime,
    this.onEndTime,
    this.initialStartTime,
    this.initialEndTime,
    this.isRequired,
    this.errorMessage,
  });

  final double? width;
  final double? height;
  final Future Function(String? startTIme)? onStartTime;
  final Future Function(String? endTime)? onEndTime;
  final String? initialStartTime;
  final String? initialEndTime;
  final bool? isRequired;
  final String? errorMessage;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  @override
  void initState() {
    super.initState();
    // Convert incoming string times (like "9:30 AM") into TimeOfDay
    startTime = _parseTime(widget.initialStartTime);
    endTime = _parseTime(widget.initialEndTime);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialStartTime != null) {
        widget.onStartTime?.call(widget.initialStartTime);
      }
      if (widget.initialEndTime != null) {
        widget.onEndTime?.call(widget.initialEndTime);
      }
    });
  }

  /// 🕓 Converts a string like "9:30 AM" or "17:00" → TimeOfDay
  TimeOfDay? _parseTime(String? timeString) {
    if (timeString == null || timeString.isEmpty) return null;

    try {
      // Handle both "9:30 AM" and "09:30" formats
      final time = timeString.trim().toUpperCase();
      final parts = time.split(' ');

      final timeParts = parts[0].split(':');
      int hour = int.parse(timeParts[0]);
      int minute = int.parse(timeParts[1]);

      if (parts.length > 1) {
        final period = parts[1];
        if (period == 'PM' && hour < 12) hour += 12;
        if (period == 'AM' && hour == 12) hour = 0;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      debugPrint('⚠️ Invalid time format: $timeString');
      return null;
    }
  }

  /// Converts TimeOfDay → formatted string like "9:30 AM"
  String formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  Future<void> selectTime() async {
    final TimeOfDay? pickedStart = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.dial,
      context: context,
      initialTime: startTime ?? TimeOfDay.now(),
      helpText: 'Start Time',
    );

    if (pickedStart != null) {
      final TimeOfDay? pickedEnd = await showTimePicker(
        context: context,
        initialTime: pickedStart,
        helpText: 'End Time',
      );

      if (pickedEnd != null) {
        setState(() {
          startTime = pickedStart;
          endTime = pickedEnd;
          final localizations = MaterialLocalizations.of(context);
          String? startTimeString = startTime != null
              ? localizations.formatTimeOfDay(startTime!)
              : null;
          String? endTimeString =
              endTime != null ? localizations.formatTimeOfDay(endTime!) : null;
          widget.onStartTime?.call(startTimeString);
          widget.onEndTime?.call(endTimeString);
        });
      }
    }
  }

  String getDisplayText() {
    if (startTime == null && endTime == null) {
      return '';
    } else if (endTime == null) {
      return formatTimeOfDay(startTime!);
    } else {
      return '${formatTimeOfDay(startTime!)} - ${formatTimeOfDay(endTime!)}';
    }
  }

  String? validateTime(String? value) {
    if (widget.isRequired! && (startTime == null || endTime == null)) {
      return widget.errorMessage;
    }

    // Additional validation: End time should be after start time
    if (startTime != null && endTime != null) {
      final startMinutes = startTime!.hour * 60 + startTime!.minute;
      final endMinutes = endTime!.hour * 60 + endTime!.minute;

      if (endMinutes <= startMinutes) {
        return 'End time must be after start time';
      }
    }

    return null;
  }

  // Method to trigger validation from outside (optional)
  bool validate() {
    return _formFieldKey.currentState?.validate() ?? false;
  }

  String? errorText;
  final GlobalKey<FormFieldState> _formFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Time',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10),
        FormField<String>(
          key: _formFieldKey,
          validator: validateTime,
          builder: (FormFieldState<String> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: selectTime,
                  child: Container(
                    width: double.infinity,
                    height: 42.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFF8ED),
                      border: Border.all(
                        color: field.hasError
                            ? Colors.red
                            : const Color(0xFFE07A5F),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              getDisplayText().isEmpty
                                  ? 'Start Time - End Time'
                                  : getDisplayText(),
                              style: TextStyle(
                                fontSize: 16,
                                color: getDisplayText().isEmpty
                                    ? Colors.black38
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          // const Icon(
                          //   Icons.access_time,
                          //   color: Color(0xFFE07A5F),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ✅ Error message display
                if (field.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                    child: Text(
                      field.errorText ?? '',
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
