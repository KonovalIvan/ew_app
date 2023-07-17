import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/widgets/admin_widget.dart';
import 'package:ew_app/constants/widgets/menu_widget.dart';
import 'package:ew_app/constants/widgets/project_widget.dart';
import 'package:ew_app/constants/widgets/widgets_widget.dart';
import 'package:ew_app/controllers/projects_controller.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/constants/url.dart' as consts;
import 'package:ew_app/api/project_api_service.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        leftIcon: BackArrowWidget(),
        rightIconMenu: MenuWidget(),
      ),
      drawer: const Menu(),
      body: Container(color: Colors.blue,),
    );
  }
}
