

import '../../../src/auth_src.dart';

class RegisterSuccessPage extends StatelessWidget {
  const RegisterSuccessPage({super.key});

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
                'Register Successful',
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
                'Congratulations your account is ready to use',
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
                        RouteGenerator.loginPage,
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