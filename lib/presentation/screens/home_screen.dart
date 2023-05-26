import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';

import 'package:test_color_app/presentation/screens/providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homePvdr = Provider.of<HomeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: InkWell(
          enableFeedback: true,
          onTap: () {
            homePvdr.generateRandomColor();
            homePvdr.isTimeToShake = !homePvdr.isTimeToShake;
            homePvdr.generateRandomFontSize();
            homePvdr.isAnimate = !homePvdr.isAnimate;
          },
          child: Pulse(
            animate: homePvdr.isAnimate,
            child: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              color: homePvdr.color,
              child: ShakeWidget(
                shakeConstant: ShakeRotateConstant2(),
                autoPlay: homePvdr.isTimeToShake,
                duration: const Duration(milliseconds: 100),
                child: Text(
                  homePvdr.randomFontSize == 201
                      ? 'Welcome! Press anywhere on the screen...'
                      : 'Hello There!',
                  style: GoogleFonts.caveat(
                    fontSize: homePvdr.randomFontSize.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textScaleFactor: 1.5,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
