import 'package:provider/provider.dart';

import '../providers/password_provider.dart';
import '../src/widgets.dart';

class BalanceCard extends StatelessWidget {
  final String? accountNumber;
  final String? accountBalance;

  const BalanceCard({super.key, this.accountNumber, this.accountBalance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95.h,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 10.h,
            left: 5.w,
            right: 5.w,
            child: Container(
              width: 319.w,
              height: 88.h,
              decoration: BoxDecoration(
                  // boxShadow: kDefaultBoxShadow,
                  color: yellowColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
            ),
          ),
          Positioned(
            child: Container(
              width: 3327.w,
              height: 88.h,
              decoration: BoxDecoration(
                  // boxShadow: kDefaultBoxShadow,
                  color: yellowColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.r))),
            ),
          ),
          Positioned(
            child: SvgPicture.asset('assets/svg/dashboard_card.svg'),
          ),
          Positioned(child:
              Consumer<PasswordProvider>(builder: (context, snapshot, _) {
            return Padding(
              padding:  EdgeInsets.all(5.spMax),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Current Balance',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF160D07),
                            ),
                          ),
                          IconButton(
                              iconSize: 15,
                              onPressed: () {
                                snapshot.toggleIsObscure();
                              },
                              icon: Icon(snapshot.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))
                        ],
                      ),
                      Text(
                        'Account Number',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF160D07),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.isObscure ? 'N$accountBalance' : '*******',
                        style: heading2,
                      ),
                      Text(
                        accountNumber ?? '',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF160D07),
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          }))
        ],
      ),
    );
  }
}