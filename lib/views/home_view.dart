import 'package:ew_app/constants/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/constants/url.dart' as consts;
import 'package:ew_app/api/project_api_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future projectsList = Future.value(null);

  @override
  void initState() {
    super.initState();
    // get all active projects
    projectsList = getProjectList(consts.apiProjectsActiveGet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: 150, left: 75),
        child: Column(
          children: [
            Container(
              child: Column(
                children: const [
                  HomeButtonWidget(
                    buttonColor: Color(0xFFBB6BD9),
                    textColor: Colors.white,
                    buttonText: 'Task',
                  ),
                  HomeButtonWidget(
                    buttonColor: Color(0xFF2F80ED),
                    textColor: Colors.white,
                    buttonText: 'Current projects',
                  ),
                  HomeButtonWidget(
                    buttonColor: Color(0xFF27AE60),
                    textColor: Colors.white,
                    buttonText: 'Finished projects',
                  ),
                  HomeButtonWidget(
                    buttonColor: Color(0xFFF2994A),
                    textColor: Colors.white,
                    buttonText: 'Calculator',
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
