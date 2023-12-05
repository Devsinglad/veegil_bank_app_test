import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank_app_test/src/main.dart';
import 'package:veegil_bank_app_test/utils/constants.dart';

import '../../config/routes.dart';
import '../../data/auth/auth_request.dart';

import '../../data/transactions/transaction_get_request.dart';
import '../../widgets/balance_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

String storedAccountNumber = '';

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      var authApi = Provider.of<AuthApi>(context, listen: false);
      authApi.getStoredNumber()!;
      var transactApi = Provider.of<TransactionGetApi>(context, listen: false);
      await transactApi.getUsers(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var transactApi = Provider.of<TransactionGetApi>(context);
    var authApi = Provider.of<AuthApi>(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: scaffoldColor,
        title: RPadding(
          padding: REdgeInsets.only(left: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello👋',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF160D07),
                ),
              ),
              Text('Welcome Back!', style: smallTextStyle),
            ],
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed(
              //   RouteGenerator.notificationPage,
              // );
            },
            child: SvgPicture.asset('assets/svg/notifications_icon.svg'),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: REdgeInsets.all(24),
        children: [
          BalanceCard(
              accountNumber: authApi.userNumber,
              accountBalance: ' ${transactApi.userAccount?.balance}'),
          SizedBox(
            height: 24.h,
          ),
          Row(
            children: [
              _card('assets/svg/send_icon.svg', 'Transfer', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferPage,
                );
              }),
              SizedBox(width: 20.w),
              _card('assets/svg/withdraw_icon.svg', 'Withdraw', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.withdrawPage,
                );
              }),
            ],
          ),
          SizedBox(
            height: 24.h,
          ),
          Text(
            'Send to Friends',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Consumer<TransactionGetApi>(builder: (context, snapshot, _) {
            return SizedBox(
              height: 56.h,
              width: double.maxFinite,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: snapshot.userList.length,
                  padding: REdgeInsets.all(0),
                  itemBuilder: (context, index) => Container(
                        width: 56.w,
                        height: 56.h,
                        margin: REdgeInsets.only(right: 12.w),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r))),
                        child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            child: Image.asset(
                              'assets/images/friends_image.png',
                              fit: BoxFit.fill,
                            )),
                      )),
            );
          }),

        ],
      ),
    );
  }

  _card(String icon, String title, Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            padding: REdgeInsets.symmetric(vertical: 22.h),
            decoration: BoxDecoration(
                color: const Color(0xFF3A3A3A),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: SvgPicture.asset(
              icon,
              width: 20.w,
              height: 20.h,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF767D88),
            ),
          )
        ],
      ),
    );
  }
}