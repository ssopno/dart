
import 'package:flutter/material.dart';

import '../utils/app_color.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key, required this.title, required this.onPress, required this.icon, required this.endIcon, this.textColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;
  final IconData icon;
  final bool endIcon;
  final Color? textColor;




  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading:Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: primaryColor.withOpacity(0.1),
        ),
        child:  Icon(icon,color: primaryColor,),
      ) ,
      title:  Text(title,style: Theme.of(context).textTheme.bodyText1?.apply(color: textColor),
      ),
      trailing:endIcon? Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: greyColor.withOpacity(0.1),
        ),
        child: const  Icon(Icons.arrow_forward_ios,color: softGreyColor,),
      ):null
    );
  }
}
