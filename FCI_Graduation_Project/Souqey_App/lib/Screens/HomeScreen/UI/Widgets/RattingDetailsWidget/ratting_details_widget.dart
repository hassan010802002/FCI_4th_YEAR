import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:souqey/Screens/HomeScreen/Constants/HomeConsts.dart';
import 'package:souqey/Screens/HomeScreen/Controller/home_controller_bloc.dart';

class RattingDetailsWidget extends StatefulWidget {
  final HomeControllerBloc _homeController;
  final int _categoryViewIdx;
  final int _productViewIdx;

  const RattingDetailsWidget({
    super.key,
    required HomeControllerBloc homeController,
    required int categoryViewIdx,
    required int productViewIdx,
  })  : _homeController = homeController,
        _categoryViewIdx = categoryViewIdx,
        _productViewIdx = productViewIdx;

  @override
  _RattingDetailsWidgetState createState() => _RattingDetailsWidgetState();
}

class _RattingDetailsWidgetState extends State<RattingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBarIndicator(
          rating: widget._homeController.productsFilterData!
              .elementAt(widget._categoryViewIdx)
              .values
              .toList()
              .elementAt(0)
              .elementAt(widget._productViewIdx)
              .ratingsAverage!
              .toDouble(),
          direction: Axis.horizontal,
          itemSize: 20.0.sp,
          itemPadding: EdgeInsets.symmetric(horizontal: 3.0.w),
          itemBuilder: (context, index) {
            return Container(
              constraints: BoxConstraints.tight(Size(10.0.w, 10.0.h)),
              decoration: HomeConsts.containerStyle2(context),
            );
          },
        ),
        Text(
          '(${widget._homeController.productsFilterData!.elementAt(widget._categoryViewIdx).values.toList().elementAt(0).elementAt(widget._productViewIdx).ratingsQuantity!.toInt()})',
          softWrap: true,
          textAlign: TextAlign.start,
          style: HomeConsts.style3(context),
        ),
      ],
    );
  }
}
