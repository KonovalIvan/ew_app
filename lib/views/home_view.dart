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
      appBar: const AppBarWidget(
        rightIconMenu: MenuButtonWidget(),
      ),
      drawer: const MainDrawer(),
      body: FutureBuilder<void>(
        future: _homeController.getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // TODO: In future projects in view i can add bool, and if true use
            //  CircularProgressIndicator in stack top when response getted,
            //  redirect to new view.
            return Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      colors: [
                        Color(0xFF260D67),
                        Color(0xFF572886),
                      ],
                    ),
                  ),
                ),
                const Center(
                    child: CircularProgressIndicator()),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error text: ${snapshot.error}');
          } else {
            return Column(
              children: [
                // TODO: create updated projects/task in case user back
                UserCardWidget(
                  activeProjects: _homeController.activeProjects,
                  activeTasks: _homeController.activeTasks,
                  userFirstName: _homeController.userFirstName,
                  email: _homeController.email,
                ),
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
            );
          }
        },
      ),
    );
  }
}
