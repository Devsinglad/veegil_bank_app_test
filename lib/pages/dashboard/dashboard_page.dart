import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank_app_test/src/main.dart';
import 'package:veegil_bank_app_test/utils/constants.dart';

import '../../config/routes.dart';
import '../../data/auth/auth_request.dart';
import '../../data/local_database.dart/abstractive_hive_storage.dart';
import '../../data/local_database.dart/local_db.dart';
import '../../data/transactions/transaction_get_request.dart';
import '../../widgets/balance_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}
String? storedAccountNumber;
class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    var authApi = Provider.of<AuthApi>(context, listen: false);
    var transactApi = Provider.of<TransactionGetApi>(context, listen: false);
    storedAccountNumber = authApi.getStoredNumber();
    transactApi.getUsers();
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var transactApi = Provider.of<TransactionGetApi>(context, listen: false);


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
            onTap: ()  {
              transactApi.getUsers();
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
           BalanceCard(accountNumber: storedAccountNumber!,accountBalance: '10,000'),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _card('assets/svg/send_icon.svg', 'Transfer', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferPage,
                );
              }),
              _card('assets/svg/withdraw_icon.svg', 'Withdraw', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.withdrawPage,
                );
              }),
              _card('assets/svg/bill_icon.svg', 'Payment', () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.paymentPage,
                );
              })
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
          SizedBox(
            height: 56.h,
            width: double.maxFinite,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: transactApi.userList.length,
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
          ),
          SizedBox(
            height: 24.h,
          ),


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