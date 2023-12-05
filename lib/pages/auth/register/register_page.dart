

import '../../../src/auth_src.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _passwordController = TextEditingController();

  final _confirmPasswordController = TextEditingController();

  final _phoneNumberController = TextEditingController();

  final Validators _validators = Validators();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: scaffoldColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: arrowBackColor,
          ),
        ),
        leadingWidth: 50.w,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: RPadding(
            padding: REdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 136.h,
                ),
                Text('Creating New Account', style: largeTextStyle),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Fill in your data correctly and completely, so you can proceed',
                  style: xSmallTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                PhoneNumberField(
                  readOnly: false,
                  hintText: 'Phone Number',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  textController: _phoneNumberController,
                  validator: (str) => _validators
                      .validatesPhoneNumber(_phoneNumberController.text),
                  prefixIcon: Text(
                    '+234',
                    style: hintTextStyle,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<PasswordProvider>(
                  builder: (context, pp, child) {
                    return CTextFormField(
                      textControllor: _passwordController,
                      obscureText: pp.isObscure,
                      keyboardType: TextInputType.text,
                      hintText: 'Password',
                      validator: (str) => _validators
                          .validatePassword(_passwordController.text),
                      suffixIcon: IconButton(
                        onPressed: () {
                          pp.toggleIsObscure();
                        },
                        icon: Icon(
                          pp.isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: primaryColor,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Consumer<ConfirmPasswordProvider>(
                  builder: (context, cp, child) {
                    return CTextFormField(
                      textControllor: _confirmPasswordController,
                      obscureText: cp.isObscure,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      hintText: 'Confirm Password',
                      validator: (str) => _validators.validateConfirmPassword(
                          _passwordController.text,
                          _confirmPasswordController.text),
                      suffixIcon: IconButton(
                        onPressed: () {
                          cp.toggleIsObscure();
                        },
                        icon: Icon(
                          cp.isObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: primaryColor,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                            text:
                                'By continuing I agree, that Bambank will use my data as stated in the ',
                            style: xSmallTextStyle),
                        TextSpan(
                          text: 'Privacy Policy.',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF160D07),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 98.h,
                ),
                SizedBox(
                    width: double.infinity,
                    child: Consumer<AuthApi>(builder: (context, snapshot, _) {
                      return CElevatedButton(
                          child: snapshot.buttonState == ButtonState.idle
                              ? const Text('Continue')
                              : const CircularProgressIndicator(
                                  color: Colors.white),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              snapshot.signUp(_phoneNumberController.text, _passwordController.text, context);
                            }
                          });
                    })),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}