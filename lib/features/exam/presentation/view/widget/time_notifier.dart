import 'dart:async';
import 'package:exam_app/config/appColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimerNotifierWidget extends StatefulWidget {
  int timeOfExam;
  TimerNotifierWidget({required this.timeOfExam, super.key});

  @override
  State<TimerNotifierWidget> createState() => TimerNotifierWidgetState();
}

class TimerNotifierWidgetState extends State<TimerNotifierWidget> {
  late Timer timer;
  int value = 0;
  void startTime() {
    timer = Timer.periodic(Duration(seconds: 1), (index) {
      widget.timeOfExam--;
      if (widget.timeOfExam == 00) {
        timer.cancel();
        // showDialog(
        //     barrierDismissible: false,
        //     context: context,
        //     builder: (context) {
        //       return AlertDialog(
        //         content: Column(
        //           children: [
        //             Text(
        //               'Time out',
        //               style:
        //                   TextStyle(fontSize: 20.sp, color: AppColor.redError),
        //             ),
        //             ElevatedButton(onPressed: () {}, child: Text('view Score'))
        //           ],
        //           mainAxisSize: MainAxisSize.min,
        //         ),
        //       );
        //     });
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('${widget.timeOfExam}');
  }
}
