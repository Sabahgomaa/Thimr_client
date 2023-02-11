import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/shared/widgets/loading_progress.dart';

class SliderComponent extends StatelessWidget {
  SliderComponent({Key? key}) : super(key: key);
  final bloc = KiwiContainer().resolve<HomeBloc>()
    ..add(GetSliderEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (bloc.sliderData == null) {
            return LoadingProgress();
          } else {
            return CarouselSlider(
                options: CarouselOptions(
                  height: 190.h,
                  initialPage: 0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  scrollDirection: Axis.horizontal,
                ),
                items: bloc.sliderData!.data
                    .map((e) => Container(
                          child: Image(
                            image: NetworkImage(
                              '${e.media}',
                            ),
                            width: double.infinity,
                            fit: BoxFit.cover,
                            // height: 165.h,
                          ),
                        ))
                    .toList());
          }
        });
  }
}
