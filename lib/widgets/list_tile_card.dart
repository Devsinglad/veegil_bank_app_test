

import '../src/widgets.dart';

class ListTileCard extends StatelessWidget {
  final String iconPath;
  final String title;
  final Function()? onTap;
  const ListTileCard({
    required this.iconPath,
    required this.title,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
            padding: REdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: primarySurfaceColor,
              borderRadius: BorderRadius.all(
                Radius.circular(6.r)
              )
            ),
      child: ListTile(
                onTap: onTap,
                contentPadding: REdgeInsets.all(0),
                leading: SvgPicture.asset(iconPath),
                title: Text(title,
                style: smallTextStyle,
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                color: primaryColor,
                size: 15.r,
                ),
              ),
    );
  }
}