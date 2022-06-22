// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:todo/bloc/main_cubit/main_cubit.dart';
import 'package:todo/views/register_screen.dart';

class IntroScreen extends StatelessWidget {
  CarouselController buttonCarouselController = CarouselController();

  IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = MainCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: List.generate(
                        cubit.sliderTexts.length,
                        (index) => Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                    height: 300,
                                    width: 300,
                                    child: SvgPicture.asset(
                                        "assets/images/intro${index + 1}.svg")),
                                Text(
                                  cubit.sliderTexts[index],
                                  overflow: TextOverflow.fade,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 25,
                                      fontFamily: "Tajawal",
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )),
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                        initialPage: 0,
                        enlargeCenterPage: true,
                        height: 420,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          cubit.changeSliderCurrentPage(index);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: DotsIndicator(
                      dotsCount: 3,
                      position: cubit.sliderCurrentPageIndex.toDouble(),
                      decorator: DotsDecorator(
                          color: const Color(0xffCCCCCC),
                          activeColor: const Color(0xff96BFD8),
                          activeSize: const Size(18.0, 9.0),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                            ModalRoute.withName('/'),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: const Color(0xff4E7D96),
                          elevation: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "GetStarted ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Tajawal"),
                            ),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}