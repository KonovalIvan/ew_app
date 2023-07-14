import 'package:ew_app/constants/patches.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/controllers/menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final MainMenuController _menuController = MainMenuController();

  @override
  Widget build(BuildContext context) {
    // TODO: Fix white borderRadius.
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0),
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF260D67),
              Color(0xFF572886),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.only(left: 17, top: 40.0),
              child: Row(
                children: [
                  // TODO: get image from admin widget
                  SizedBox(
                    width: 64.0,
                    height: 64.0,
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.width / 2.0),
                      ),
                      child: Image.asset(
                        'assets/images/base_user_profile.png',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Admin',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'admin@gmail.com',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _menuController.home(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Home',
                          elementIconPath: '$menuIconPath/home.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.projects(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Projects',
                          elementIconPath: '$menuIconPath/board.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.account(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Account',
                          elementIconPath: '$menuIconPath/account.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.currentTask(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Current task',
                          elementIconPath: '$menuIconPath/current.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.finishedProjects(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Finished projects',
                          elementIconPath: '$menuIconPath/finished.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.buildingRegulations(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Building regulations',
                          elementIconPath: '$menuIconPath/rules.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.settings(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Settings',
                          elementIconPath: '$menuIconPath/settings.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.push(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'Push',
                          elementIconPath: '$menuIconPath/push.svg',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          _menuController.faq(context);
                        },
                        child: const MenuElementWidget(
                          elementText: 'FAQ',
                          elementIconPath: '$menuIconPath/faq.svg',
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: GestureDetector(
                      onTap: () {
                        _menuController.logOut(context);
                      },
                      child: const MenuElementWidget(
                        elementText: 'Log out',
                        elementIconPath: '$menuIconPath/logout.svg',
                        paddingBottom: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuElementWidget extends StatefulWidget {
  const MenuElementWidget(
      {super.key,
      this.elementText,
      this.elementIconPath,
      this.paddingBottom,
      this.paddingTop,
      this.paddingLeft});

  final String? elementText;
  final String? elementIconPath;
  final double? paddingBottom;
  final double? paddingTop;
  final double? paddingLeft;

  @override
  // ignore: library_private_types_in_public_api
  _MenuElementWidgetState createState() => _MenuElementWidgetState();
}

class _MenuElementWidgetState extends State<MenuElementWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: widget.paddingTop ?? 13.0,
        bottom: widget.paddingBottom ?? 13.0,
        left: widget.paddingLeft ?? 18.0,
      ),
      child: Row(
        children: [
          widget.elementIconPath != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 6, right: 6),
                  child: SvgPicture.asset(
                    '${widget.elementIconPath}',
                    height: 16.0,
                    width: 30.0,
                  ),
                )
              : const SizedBox(
                  width: 6,
                  height: 0,
                ),
          Text(
            '${widget.elementText}',
            style: SafeGoogleFont(
              'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
