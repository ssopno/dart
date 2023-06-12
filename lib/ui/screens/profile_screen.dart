import 'package:ecommerceprojct/ui/screens/complete_profile_screen.dart';
import 'package:ecommerceprojct/ui/utils/app_color.dart';
import 'package:ecommerceprojct/ui/utils/styles.dart';
import 'package:ecommerceprojct/ui/widget/common_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/profile_menu_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios),
            color: greyColor,
          ),
          title: const Text('Profile',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  isDark ? Icons.sunny : Icons.nights_stay,
                  color: greyColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/images/profile.jpg'),
                      ),
                    ),
                    Positioned(
                      bottom:0 ,
                      right:0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: primaryColor
                        ),
                        child: const  Icon(Icons.edit,color: greyColor,),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Crafty Bay',
                  style: titleTextStyle,
                ),
                Text(
                  'ishathi09@gmail.com',
                  style: subtitleTextStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 200,
                  child: CommonElevatedButton(
                    title: 'Complete profile',
                    onTap: () {
                      Get.to(const CompleteProfileScreen());
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(),
                const SizedBox(
                  height: 10,
                ),
                ProfileMenuWidget(
                  title: 'Settings',
                  onPress: () {},
                  icon: Icons.settings,
                  endIcon: true,
                ),
                ProfileMenuWidget(
                  title: 'Privacy',
                  onPress: () {},
                  icon: Icons.privacy_tip_outlined,
                  endIcon: true,
                ),
                ProfileMenuWidget(
                  title: 'User Management',
                  onPress: () {},
                  icon: Icons.verified_user,
                  endIcon: true,
                ),
                const Divider(
                  height: 8,
                ),
                ProfileMenuWidget(
                  title: 'Information',
                  onPress: () {},
                  icon: Icons.details,
                  endIcon: true,
                ),
                ProfileMenuWidget(
                  title: 'Log Out',
                  onPress: () {},
                  icon: Icons.logout,
                  endIcon: false,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ));
  }
}
