import 'package:veegil_bank_app_test/components/phone_number_field.dart';

import '../../../src/auth_src.dart';
import '../../../utils/enum.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: RPadding(
        padding: REdgeInsets.symmetric(
          horizontal: 24.w,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200.h,
                ),
                Text(
                  'Holla, Welcome Back!',
                  style: largeTextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Login or create an account and experience something amazing',
                  style: xSmallTextStyle,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 60.h,
                ),
                PhoneNumberField(
                  hintText: 'Phone Number',
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.phone,
                  textController: _phoneController,
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
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                      hintText: 'Password',
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
                  height: 12.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Forgot Password',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF767D88),
                    ),
                    // textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Consumer<AuthApi>(builder: (context, snapshot, _) {
                    return CElevatedButton(
                      child: snapshot.buttonState == ButtonState.idle ||
                              snapshot.buttonState == ButtonState.success
                          ? const Text('Sign In')
                          : const CircularProgressIndicator(
                              color: Colors.white),
                      onPressed: () {
                        snapshot.signIn(_phoneController.text,
                            _passwordController.text, context);
                      },
                    );
                  }),
                ),
                SizedBox(
                  height: 24.h,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteGenerator.registerPage,
                    );
                  },
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text.rich(
                      textAlign: TextAlign.left,
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Not Register? ', style: xSmallTextStyle),
                          TextSpan(
                              text: 'Create an Account',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF160D07),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}