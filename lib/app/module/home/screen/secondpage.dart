import 'package:cbn_tv_usa/app/module/auth/screen/welcome_screen.dart';
import 'package:cbn_tv_usa/app/module/home/controller/home_controller.dart';
import 'package:cbn_tv_usa/app/module/home/screen/profile_menu_widget.dart';
import 'package:cbn_tv_usa/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PageScreen extends StatelessWidget {
  const PageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(builder: (context, controller, child) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// -- IMAGE
                Stack(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: const Image(
                              image: NetworkImage(
                                  'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg'))),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: primaryColor),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text("Sample User",
                    style: Theme.of(context).textTheme.headlineMedium),
                Text("sample@gmail.com",
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),

                /// -- BUTTON
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (builder)=> WelcomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        side: BorderSide.none,
                        shape: const StadiumBorder()),
                    child: const Text("Edit Profile",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),

                /// -- MENU
                ProfileMenuWidget(
                    title: "Settings",
                    icon: LineAwesomeIcons.cog,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Billing Details",
                    icon: LineAwesomeIcons.wallet,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "User Management",
                    icon: LineAwesomeIcons.user_check,
                    onPress: () {}),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                    title: "Information",
                    icon: LineAwesomeIcons.info,
                    onPress: () {}),
                ProfileMenuWidget(
                    title: "Logout",
                    icon: LineAwesomeIcons.alternate_sign_out,
                    textColor: Colors.red,
                    endIcon: false,
                    onPress: () {}),
              ],
            ),
          ),
        ),
      );
    });
  }
}
