import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:souqey/Components/CustomLoadingPlaceholder/CustomLoadingPlaceholder.dart';
import 'package:souqey/Config/AppConfigs.dart';
import 'package:souqey/Helpers/Size_Helper/MediaQuery_Size_Helper.dart';
import 'package:souqey/Screens/CategoriesScreen/Constants/CategoriesConsts.dart';
import 'package:souqey/Screens/CategoriesScreen/Controller/categories_controller_bloc.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';

class CategoriesView3 extends StatefulWidget {
  final CategoriesControllerBloc _categoriesController;

  const CategoriesView3({
    super.key,
    required final CategoriesControllerBloc categoriesController,
  }) : _categoriesController = categoriesController;

  @override
  State<CategoriesView3> createState() => _CategoriesView3State();
}

class _CategoriesView3State extends State<CategoriesView3> {
  @override
  void initState() {
    widget._categoriesController.add(
      CategoriesGetAllProductsOnCategoryEvent(
          categoryId: widget._categoriesController.categoriesModel!.data!.elementAt(widget._categoriesController.activeCategoryIdx!).id),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<CategoriesControllerBloc, CategoriesControllerState, int>(
          selector: (state) {
            return widget._categoriesController.categoryViews;
          },
          builder: (context, state) {
            return state == 2
                ? SizedBox(
                    height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 20.0.h,
                    child: ListView.separated(
                      shrinkWrap: true,
                      primary: true,
                      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget._categoriesController.subCategoriesModel!.results!.toInt(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.0.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: CategoriesConsts.color2,
                            borderRadius: BorderRadius.circular(30.0.sp),
                          ),
                          child: Center(
                            child: Text(
                              widget._categoriesController.subCategoriesModel!.data!.elementAt(index).name!,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: CategoriesConsts.color1,
                                fontFamily: TextFontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(
                        width: 12.0.w,
                      ),
                    ),
                  )
                : const SizedBox();
          },
        ),
        SizedBox(
          height: 20.0.h,
        ),
        Container(
          padding: EdgeInsets.zero,
          decoration: const BoxDecoration(color: CategoriesConsts.color1),
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 25.0.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.filter),
                label: const Text('Filters'),
                style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      color: CategoriesConsts.color2,
                      fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: TextFontFamily,
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
                  alignment: Alignment.centerLeft,
                  splashFactory: InkSparkle.splashFactory,
                  iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
                  iconSize: MaterialStatePropertyAll(22.0.sp),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: MaterialStatePropertyAll(EdgeInsets.all(5.0.sp)),
                ),
              ),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.sort),
                label: const Text('Sort-By'),
                style: ButtonStyle(
                  textStyle: MaterialStatePropertyAll(
                    TextStyle(
                      color: CategoriesConsts.color2,
                      fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: TextFontFamily,
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
                  alignment: Alignment.centerLeft,
                  iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
                  iconSize: MaterialStatePropertyAll(22.0.sp),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 5.0.h)),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.list),
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(CategoriesConsts.transparentColor),
                  alignment: Alignment.center,
                  iconColor: MaterialStatePropertyAll(CategoriesConsts.color2),
                  iconSize: MaterialStatePropertyAll(22.0.sp),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  tapTargetSize: MaterialTapTargetSize.padded,
                  padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 5.0.h)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0.h,
        ),
        BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
          bloc: widget._categoriesController,
          selector: (state) {
            return widget._categoriesController.isSuccessProductsOnCategoryService;
          },
          builder: (context, state) {
            return Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: state ? widget._categoriesController.productsOnCategoryModel!.results!.toInt() : 5,
                primary: true,
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 2.75.sp,
                  mainAxisSpacing: 30.0.h,
                  crossAxisSpacing: 20.0.w,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return state
                      ? Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: CategoriesConsts.color1,
                            borderRadius: BorderRadius.circular(15.0.sp),
                          ),
                          padding: EdgeInsets.zero,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  //product cover image
                                  Container(
                                    constraints: BoxConstraints.expand(
                                      width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 3.5.w,
                                      height: MediaQuery_Size_Helper.MAX_HEIGHT(context)!.h,
                                    ),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                          widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).imageCover!,
                                        ),
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        isAntiAlias: true,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.0.h,
                                  ),
                                  //product details
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget._categoriesController.productsOnCategoryModel!.data!
                                                    .elementAt(index)
                                                    .title!
                                                    .split(" ")
                                                    .sublist(0, 2)
                                                    .join(" ")
                                                    .length >
                                                12
                                            ? "${widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).title!.split(" ").sublist(0, 2).join(" ").substring(0, 12)}..."
                                            : widget._categoriesController.productsOnCategoryModel!.data!
                                                .elementAt(index)
                                                .title!
                                                .split(" ")
                                                .sublist(0, 2)
                                                .join(" "),
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: CategoriesConsts.color2,
                                          fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 19.0.sp,
                                          fontWeight: FontWeight.w800,
                                          fontFamily: BoldTextFontFamily,
                                        ),
                                      ),
                                      Text(
                                        widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).brand!.name!,
                                        softWrap: true,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: CategoriesConsts.color4,
                                          fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: TextFontFamily,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: widget._categoriesController.productsOnCategoryModel!.data!
                                                .elementAt(index)
                                                .ratingsAverage!
                                                .toDouble(),
                                            direction: Axis.horizontal,
                                            itemSize: 15.0.sp,
                                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                constraints: BoxConstraints.tight(Size(10.0.w, 10.0.h)),
                                                decoration: HomeConsts.containerStyle2(context),
                                              );
                                            },
                                          ),
                                          Text(
                                            '(${widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).ratingsQuantity!.toInt()})',
                                            softWrap: true,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                              color: CategoriesConsts.color4,
                                              fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 35.0.sp,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: TextFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "${widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).price!.ceil() + (widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).price!.ceil() * 0.2).ceil()}\$",
                                            softWrap: true,
                                            textAlign: TextAlign.justify,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: CategoriesConsts.color4,
                                              decoration: TextDecoration.lineThrough,
                                              decorationThickness: 3.0,
                                              decorationColor: CategoriesConsts.color4,
                                              fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: TextFontFamily,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0.w,
                                          ),
                                          Text(
                                            "${widget._categoriesController.productsOnCategoryModel!.data!.elementAt(index).price!.ceil()}\$",
                                            softWrap: true,
                                            textAlign: TextAlign.justify,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: CategoriesConsts.color3,
                                              fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
                                              fontWeight: FontWeight.w800,
                                              fontFamily: TextFontFamily,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 10.0.h,
                                width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 10.0.h,
                                child: FloatingActionButton(
                                  onPressed: () {},
                                  heroTag: Random(DateTime.now().microsecond),
                                  elevation: 8.0.sp,
                                  isExtended: true,
                                  shape: const CircleBorder(),
                                  backgroundColor: CategoriesConsts.color1,
                                  child: Icon(
                                    FontAwesomeIcons.heart,
                                    size: 18.0.sp,
                                    color: CategoriesConsts.color5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : const CustomLoadingPlaceholder();
                },
              ),
            );
          },
        )
      ],
    );
  }
}
