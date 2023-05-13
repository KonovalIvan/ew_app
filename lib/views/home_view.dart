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
      body: FutureBuilder(
        future: projectsList,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data.projects.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data.projects[index].name}'),
                    subtitle:
                        Text('${snapshot.data.projects[index].description}'),
                    isThreeLine: true,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Text('Error');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
