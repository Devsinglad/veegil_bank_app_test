

import '../../../src/dashboard_src.dart';

class TransferBankPage extends StatefulWidget {
  const TransferBankPage({super.key});

  @override
  State<TransferBankPage> createState() => _TransferBankPageState();
}

class _TransferBankPageState extends State<TransferBankPage> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      var authApi = Provider.of<AuthApi>(context, listen: false);
       authApi.getStoredNumber()!;
      var snapshot = Provider.of<TransactionGetApi>(context, listen: false);
      await snapshot.getUsers(context);
    });
    super.initState();
  }

  final Validators _validators = Validators();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    amountController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot = Provider.of<TransactionGetApi>(context, listen: false);
    var transfer = Provider.of<TransactionPostApi>(context);
    var authApi = Provider.of<AuthApi>(context);

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
      body: Form(
        key: _formKey,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: REdgeInsets.all(24),
          shrinkWrap: true,
          children: [
            Text(
              'Bank',
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
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/bank_card_icon.svg'),
                  SizedBox(width: 10.w),
                  Text(
                    'Bank Veegil',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF160D07),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'Phone Number',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 16.h,
            ),
            CTextFormField(
              hintText: '081 *** *** 12',
              keyboardType: TextInputType.phone,
              textControllor: phoneNumberController,
              validator: (str) => _validators
                  .validateEmptyTextField(phoneNumberController.text),
            ),
            SizedBox(
              height: 16.h,
            ),
            InkWell(
              onTap: () => buildShowModalBottomSheet(context),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'view all Numbers',
                  style: mediumTextStyle,
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Balance',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            BalanceCard(
              accountNumber: authApi.userNumber,
              accountBalance: snapshot.userAccount?.balance.toString(),
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Amount',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            CTextFormField(
              validator: (str) =>
                  _validators.validateEmptyTextField(amountController.text),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\N',
                  style: heading2,
                ),
              ),
              textControllor: amountController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 30.h,
            ),
            CElevatedButton(
              child: transfer.buttonState == ButtonState.loading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text('Transfer'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  transfer.transfer(
                    phoneNumber: phoneNumberController.text,
                    amount: amountController.text,
                    context: context,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    var snapshot = Provider.of<TransactionGetApi>(context, listen: false);
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      shape: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.maxFinite,
          child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: snapshot.userList.length,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () {
                        phoneNumberController.text =
                            snapshot.userList[i].phoneNumber;
                        setState(() {});
                        Navigator.pop(context);
                      },
                      leading: Text(
                        snapshot.userList[i].phoneNumber,
                        style: mediumTextStyle,
                      ),
                    ),
                    const Divider(
                      color: Colors.grey,
                    ),
                  ],
                );
              }),
        );
      },
    );
  }
}