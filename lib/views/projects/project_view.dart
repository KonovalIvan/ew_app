import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/menu_button_widget.dart';
import 'package:ew_app/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  void initState() {
    super.initState();
    // get current projects
    // currentProject = getCurrentProject(consts.apiProjectsAllUrl, id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(
        leftIcon: BackArrowButtonWidget(),
        rightIconMenu: MenuButtonWidget(),
      ),
      drawer: const MainDrawer(),
      body: Container(color: Colors.blue,),
    );
  }
}
