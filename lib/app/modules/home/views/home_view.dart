import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var brown = const Color(0xFF846046);
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          width: 1.sw,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                color: brown,
              ),
              Icon(
                Icons.search,
                color: brown,
              ),
              Icon(
                Icons.shopping_cart,
                color: brown,
              ),
              Icon(
                Icons.person,
                color: brown,
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/images/Onboarding.png"),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: brown,
                      ),
                      Text(
                        "Bandung, Jawa Barat",
                        style: TextStyle(
                          color: brown,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Icon(
                    Icons.notifications_on_outlined,
                    color: brown,
                  )
                ],
              ),
              20.verticalSpace,
              Text(
                "Good morning, Admin!",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              20.verticalSpace,
              Container(
                width: 1.sw,
                height: 0.07.sh,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: brown,
                    ),
                    suffixIcon: Icon(
                      Icons.tune_outlined,
                      color: brown,
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: brown,
                    ),
                  ),
                ),
              ),
              10.verticalSpace,
              Text(
                "Coffe Menu",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              controller.obx(
                (state) => Flexible(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: controller.listCoffe.length,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 0.4.sw,
                        height: 0.28.sh,
                        margin: EdgeInsets.only(right: 20.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(30.r),
                          image: DecorationImage(
                              image: NetworkImage(
                                controller.listCoffe[index].image.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.5),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              Text(
                                controller.listCoffe[index].title.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              5.verticalSpace,
                              ReadMoreText(
                                controller.listCoffe[index].description
                                    .toString(),
                                trimLength: 100,
                                trimLines: 3,
                                colorClickableText: Colors.white,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: 'Show more',
                                trimExpandedText: 'Show less',
                                moreStyle: const TextStyle(color: Colors.amber),
                                lessStyle: const TextStyle(color: Colors.amber),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(
                                width: 1.sw,
                                height: 30.h,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.listCoffe[index]
                                          .ingredients?.length ??
                                      0,
                                  itemBuilder: (context, i) => Container(
                                    width: 0.3.sw,
                                    height: 40.h,
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                      color: brown,
                                      borderRadius: BorderRadius.circular(30.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      controller
                                          .listCoffe[index].ingredients![i]
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
                        ),
                      ).paddingSymmetric(vertical: 10.h);
                    },
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w, vertical: 10.h),
        ),
      ),
    );
  }
}
