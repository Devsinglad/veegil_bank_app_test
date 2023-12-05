

import '../../../src/dashboard_src.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  String storedPhone = '';

  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) async {
      var authApi = Provider.of<AuthApi>(context, listen: false);
      authApi.getStoredNumber()!;
      print(storedPhone);
      var snapshot = Provider.of<TransactionGetApi>(context, listen: false);
      await snapshot.getUsers(context);
    });
    super.initState();
  }

  final Validators _validators = Validators();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _amountController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var snapshot = Provider.of<TransactionGetApi>(context, listen: false);
    var withdrawApi = Provider.of<TransactionPostApi>(context);
    var authApi = Provider.of<AuthApi>(context);

    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        leadingWidth: 100.w,
        title: Text(
          'Withdraw',
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
              'Balance',
              style: mediumTextStyle,
            ),
            SizedBox(
              height: 12.h,
            ),
            BalanceCard(
                accountBalance: snapshot.userAccount?.balance.toString(),
                accountNumber: authApi.userNumber),
            SizedBox(
              height: 24.h,
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
              textControllor: _phoneNumberController,
              validator: (str) =>
                  _validators.validatesPhoneNumber(_phoneNumberController.text),
            ),
            SizedBox(
              height: 16.h,
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
                  _validators.validateEmptyTextField(_amountController.text),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\N',
                  style: heading2,
                ),
              ),
              textControllor: _amountController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 97.h,
            ),
            CElevatedButton(
                child: withdrawApi.buttonState == ButtonState.loading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Continue'),
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    withdrawApi.withdrawal(
                      phoneNumber: _phoneNumberController.text,
                      amount: _amountController.text,
                      context: context,
                    );
                  }

                }),
          ],
        ),
      ),
    );
  }
}