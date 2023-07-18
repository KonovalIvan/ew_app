import 'package:ew_app/controllers/home_controller.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/menu_button_widget.dart';
import 'package:ew_app/widgets/buttons/home_button_widget.dart';
import 'package:ew_app/widgets/main_drawer_widget.dart';
import 'package:ew_app/widgets/views/user_card_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController _homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(rightIconMenu: MenuButtonWidget(),),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          const UserCardWidget(),
          Container(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 44.0),
                  child: HomeButtonWidget(
                    buttonColor: const Color(0xFFBB6BD9),
                    textColor: Colors.white,
                    buttonText: 'Task',
                    onPressed: () {
                      _homeController.task(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 44.0),
                  child: HomeButtonWidget(
                    buttonColor: const Color(0xFF2F80ED),
                    textColor: Colors.white,
                    buttonText: 'Projects',
                    onPressed: () {
                      _homeController.projects(context);
                    },
                  ),
                ),
                HomeButtonWidget(
                  buttonColor: const Color(0xFFF2994A),
                  textColor: Colors.white,
                  buttonText: 'Calculator',
                  onPressed: () {
                    _homeController.calculator(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
