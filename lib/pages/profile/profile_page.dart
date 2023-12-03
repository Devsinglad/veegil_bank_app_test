import 'package:badges/badges.dart' as badges;


import '../../src/profile_src.dart';
import '../../widgets/toast.dart';



class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: scaffoldColor,
        title: Text(
          'Profile',
          style: mediumTextStyle,
        ),
      ),
      body: Center(
        child: RPadding(
          padding: REdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                badges.Badge(
                  badgeContent: SvgPicture.asset('assets/svg/pencil_icon.svg'),
                  showBadge: true,
                  position: badges.BadgePosition.bottomEnd(),
                  badgeStyle: badges.BadgeStyle(
                      badgeColor: secondaryFocusColor,
                      padding: REdgeInsets.all(8)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      child: Image.asset('assets/images/profile_picture.png')),
                ),
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  'M Hanivan Adif',
                  style: largeTextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'youremailinhere@mail.com',
                  style: xSmallTextStyle,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Container(
                  padding: REdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile Completed',
                        style: smallTextStyle.copyWith(color: whiteColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Settings',
                    style: mediumTextStyle,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                ListTileCard(
                  iconPath: 'assets/svg/manage_notif_icon.svg',
                  title: 'Manage Notification',
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteGenerator.manageNotificationPage,
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTileCard(
                  iconPath: 'assets/svg/logout_icon.svg',
                  title: 'Log Out',
                  onTap: () {
                    ToastService.showToast(context, message: 'Log Out Successful',isError: false);
                    Navigator.of(context).pushReplacementNamed(
                      RouteGenerator.loginPage,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}