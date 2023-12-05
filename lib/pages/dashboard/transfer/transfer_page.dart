

import '../../../src/dashboard_src.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    var transactApi = Provider.of<TransactionGetApi>(context);

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'Transfer',
          style: mediumTextStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
            size: 20.r,
          ),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: REdgeInsets.all(24),
        children: [
          Text(
            'Bank transfer',
            style: mediumTextStyle,
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color(0xFFF5F5F6),
                borderRadius: BorderRadius.all(Radius.circular(6.r))),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteGenerator.transferBankPage,
                );
              },
              contentPadding: REdgeInsets.all(0),
              leading: SvgPicture.asset('assets/svg/bank_card_icon.svg'),
              title: Text(
                'Bank Veegil',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF160D07),
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: primaryColor,
                size: 15.r,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'History',
                style: mediumTextStyle,
              ),
              const Icon(
                Icons.more_horiz,
                color: primaryColor,
              )
            ],
          ),
          SizedBox(
            height: 16.h,
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
              ))        ],
      ),
    );
  }
}