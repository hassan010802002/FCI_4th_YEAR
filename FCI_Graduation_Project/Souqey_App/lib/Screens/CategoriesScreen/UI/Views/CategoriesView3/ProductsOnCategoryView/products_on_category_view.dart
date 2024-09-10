import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
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

class ProductsOnCategoryView extends StatelessWidget {
  final CategoriesControllerBloc _categoriesController;
  final bool state;
  final bool layout;

  const ProductsOnCategoryView({
    super.key,
    required final CategoriesControllerBloc categoriesController,
    required this.state,
    required this.layout,
  }) : _categoriesController = categoriesController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: state
          ? _categoriesController.productsOnCategoryModel!.results!.toInt() <= 40
              ? _categoriesController.productsOnCategoryModel!.results!.toInt()
              : 40
          : 5,
      primary: true,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: layout ? 2 : 1,
        childAspectRatio: layout ? 0.5 : 2.75.sp,
        mainAxisSpacing: 15.0.h,
        crossAxisSpacing: 10.0.w,
      ),
      itemBuilder: (BuildContext context, int index) {
        return state
            ? layout
                ? Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: CategoriesConsts.color1,
                      borderRadius: BorderRadius.circular(15.0.sp),
                    ),
                    padding: EdgeInsets.zero,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //product cover image
                        Container(
                          constraints: BoxConstraints.expand(
                            width: MediaQuery_Size_Helper.MAX_WIDTH(context)!.w,
                            height: MediaQuery_Size_Helper.MAX_HEIGHT(context)! / 3.5.h,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                _categoriesController.productsOnCategoryModel!.data!.elementAt(index).imageCover!,
                              ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              isAntiAlias: true,
                            ),
                            borderRadius: BorderRadius.circular(20.0.sp),
                          ),
                        ),
                        //product details
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //product ratting
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: _categoriesController.productsOnCategoryModel!.data!.elementAt(index).ratingsAverage!.toDouble(),
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
                                      '(${_categoriesController.productsOnCategoryModel!.data!.elementAt(index).ratingsQuantity!.toInt()})',
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
                                //product brand
                                Text(
                                  _categoriesController.productsOnCategoryModel!.data!.elementAt(index).brand!.name!,
                                  softWrap: true,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: CategoriesConsts.color4,
                                    fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 26.0.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: TextFontFamily,
                                  ),
                                ),
                                //product title
                                AutoSizeText(
                                  _categoriesController.textLengthTest(_categoriesController.productsOnCategoryModel!.data!
                                      .elementAt(index)
                                      .title!
                                      .split(" ")
                                      .sublist(0, 2)
                                      .join(" "))!,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  minFontSize: 20,
                                  textScaleFactor: 0.8,
                                  stepGranularity: 2,
                                  style: TextStyle(
                                    color: CategoriesConsts.color2,
                                    fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 24.0.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: BoldTextFontFamily,
                                  ),
                                ),
                                //product price
                                Text(
                                  "${_categoriesController.productsOnCategoryModel!.data!.elementAt(index).price!.ceil()}\$",
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  style: TextStyle(
                                    color: CategoriesConsts.color3,
                                    fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 22.0.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: TextFontFamily,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 10.0.h,
                              width: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 10.0.h,
                              child: BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
                                bloc: _categoriesController,
                                selector: (state) {
                                  return _categoriesController.favoriteProductsIdx.contains(index);
                                },
                                builder: (context, state) {
                                  return FloatingActionButton(
                                    key: _categoriesController.key!,
                                    onPressed: () {
                                      _categoriesController.checkFavoriteProduct(context, _categoriesController.activeProductIdx);
                                    },
                                    heroTag: Random(DateTime.now().microsecond),
                                    elevation: 8.0.sp,
                                    isExtended: true,
                                    shape: const CircleBorder(),
                                    backgroundColor: CategoriesConsts.color1,
                                    child: Icon(
                                      state ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                      size: 18.0.sp,
                                      color: state ? CategoriesConsts.color3 : CategoriesConsts.color5,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
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
                                    _categoriesController.productsOnCategoryModel!.data!.elementAt(index).imageCover!,
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
                                AutoSizeText(
                                  _categoriesController.textLengthTest(_categoriesController.productsOnCategoryModel!.data!
                                      .elementAt(index)
                                      .title!
                                      .split(" ")
                                      .sublist(0, 2)
                                      .join(" "))!,
                                  softWrap: true,
                                  textAlign: TextAlign.justify,
                                  maxLines: 2,
                                  overflow: TextOverflow.clip,
                                  maxFontSize: 30,
                                  minFontSize: 25,
                                  textScaleFactor: 0.9,
                                  stepGranularity: 5,
                                  style: TextStyle(
                                    color: CategoriesConsts.color2,
                                    fontSize: MediaQuery_Size_Helper.MAX_WIDTH(context)! / 20.0.sp,
                                    fontWeight: FontWeight.w800,
                                    fontFamily: BoldTextFontFamily,
                                  ),
                                ),
                                Text(
                                  _categoriesController.productsOnCategoryModel!.data!.elementAt(index).brand!.name!,
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
                                      rating: _categoriesController.productsOnCategoryModel!.data!.elementAt(index).ratingsAverage!.toDouble(),
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
                                      '(${_categoriesController.productsOnCategoryModel!.data!.elementAt(index).ratingsQuantity!.toInt()})',
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
                                      "${_categoriesController.productsOnCategoryModel!.data!.elementAt(index).price!.ceil()}\$",
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
                          child: BlocSelector<CategoriesControllerBloc, CategoriesControllerState, bool>(
                            bloc: _categoriesController,
                            selector: (state) {
                              return _categoriesController.favoriteProductsIdx.contains(index);
                            },
                            builder: (context, state) {
                              return FloatingActionButton(
                                onPressed: () {
                                  _categoriesController.checkFavoriteProduct(context, index);
                                },
                                heroTag: Random(DateTime.now().microsecond),
                                elevation: 8.0.sp,
                                isExtended: true,
                                shape: const CircleBorder(),
                                backgroundColor: CategoriesConsts.color1,
                                child: Icon(
                                  state ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                                  size: 18.0.sp,
                                  color: state ? CategoriesConsts.color3 : CategoriesConsts.color5,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
            : const CustomLoadingPlaceholder();
      },
    );
  }
}
