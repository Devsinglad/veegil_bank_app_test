import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../components/c_elevated_button.dart';
import '../../../config/routes.dart';
import '../../../utils/constants.dart';

class WithDrawSuccess extends StatelessWidget {
  const WithDrawSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: REdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 160.h,
              ),
              Text(
                'Withdrawal Successful',
                style: largeTextStyle,
              ),
              SizedBox(
                height: 60.h,
              ),
              SvgPicture.asset('assets/svg/register_successful.svg'),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Your account withdrawal is being processed',
                style: xSmallTextStyle,
              ),
              SizedBox(
                height: 198.h,
              ),
              SizedBox(
                width: double.infinity,
                child: CElevatedButton(
                    child: const Text('Continue'),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        RouteGenerator.navigationPage,
                      );
                    }),
              )
            ],
          )
        ],
      ),
    );
  }
}