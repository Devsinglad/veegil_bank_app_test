import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:veegil_bank_app_test/utils/enum.dart';
import 'package:veegil_bank_app_test/widgets/balance_card.dart';
import '../../data/auth/auth_request.dart';
import '../../data/transactions/transaction_get_request.dart';
import '../../utils/constants.dart';
import '../../config/routes.dart';
import '../../utils/helper.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      loadData();
    });
    super.initState();
  }


  void loadData()  {
    var transactApi = Provider.of<TransactionGetApi>(context, listen: false);
     transactApi.getUsers(context);
     transactApi.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    var transactApi = Provider.of<TransactionGetApi>(context);
    var authApi = Provider.of<AuthApi>(context);
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'History',
          style: mediumTextStyle,
        ),
      ),
      body: Padding(
        padding: REdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                transactApi.getTransactions();
              },
              child: Text(
                'Balance',
                style: mediumTextStyle,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            BalanceCard(
                accountNumber: authApi.userNumber,
                accountBalance:
                    ' ${transactApi.userAccount!.balance.toString()}'),
            SizedBox(
              height: 24.h,
            ),
            Visibility(
              visible: transactApi.buttonState == ButtonState.loading,
              child: Center(
                child: SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: const CircularProgressIndicator(
                    color: primaryColor,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: transactApi.buttonState == ButtonState.success,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemCount: transactApi.transactionList.length,
                padding: REdgeInsets.all(0),
                itemBuilder: (context, i) => ListTile(
                  title: Text(
                    '${transactApi.transactionList[i].phoneNumber}',
                    style: smallTextStyle,
                  ),
                  subtitle: Text(
                    '${transactApi.transactionList[i].created}',
                    style: xSmallTextStyle,
                  ),
                  trailing: transactApi.transactionList[i].type == credit
                      ? Text(
                          '+\N ${transactApi.transactionList[i].amount}',
                          style: mediumTextStyle.copyWith(color: Colors.green),
                        )
                      : Text(
                          '-\N ${transactApi.transactionList[i].amount}',
                          style: mediumTextStyle.copyWith(color: redColor),
                        ),
                ),
              ),
            ),
            Visibility(
                visible: transactApi.buttonState == ButtonState.idle,
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Text(
              'An Error Occurred...Try Again',
                      style: mediumTextStyle,
            ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}