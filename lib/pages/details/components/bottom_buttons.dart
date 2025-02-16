import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/calendar.dart';

import '../../../utils/color.dart';
import '../../schedule/appointment_screen.dart';
import '../../schedule/schedule_screen.dart';

class BottomButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppColor.appPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Calendar(),
                ),
              );
            },
            child: Container(
              width: size.width * 0.6,
              height: 60,
              decoration: BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: AppColor.secondary.withOpacity(0.6),
                        offset: Offset(0, 10),
                        blurRadius: 10)
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    (Icons.calendar_month_outlined),
                    color: AppColor.white,
                  ),
                  Text(
                    ' prendre rendez-vous',
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
