import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/widgets/appbar_widget.dart';
import 'package:ew_app/widgets/buttons/back_arrow_button_widget.dart';
import 'package:ew_app/widgets/buttons/delete_confirm_button_widget.dart';
import 'package:ew_app/widgets/fields/editable_resized_field_widget.dart';
import 'package:ew_app/widgets/options_widget.dart';
import 'package:flutter/material.dart';

import 'package:ew_app/widgets/buttons/options_button_widget.dart';

import '../../widgets/buttons/main_button_widget.dart';
import '../../widgets/comment_widget.dart';
import '../../widgets/task_gallery_widget.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskViewState createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  bool _editable = false;
  bool _visibleOptionsMenu = false;
  bool _visibleDeleteMenu = false;
  bool _visibleStatusList = false;
  String taskStatus = 'In progress';

  void updateVisibleStatusList(String res) {
    setState(() {
      _visibleStatusList = false;
      taskStatus = res;
    });
  }

  void updateEditable() {
    setState(() {
      _editable = true;
      _visibleOptionsMenu = !_visibleOptionsMenu;
    });
  }

  // FIXME: The same voids here and in project_view. Add some controller for 3 dots
  void updateVisibleDeleteMenu() {
    setState(() {
      _visibleDeleteMenu = !_visibleDeleteMenu;
    });
  }

  void updateProject() {
    setState(() {
      // TODO: send saved project to backend
      _editable = false;
    });
  }

  void pressNoDelete() {
    setState(() {
      _visibleDeleteMenu = false;
      _visibleOptionsMenu = false;
    });
  }

  void pressYesDelete() {
    setState(() {
      // TODO: logic for delete task
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBarWidget(
        leftIcon: const BackArrowButtonWidget(),
        rightIconMenu: OptionsButtonWidget(),
        onRightIconPressed: () {
          setState(() {
            _visibleOptionsMenu = !_visibleOptionsMenu;
          });
        },
      ),
      body: Container(
        decoration: backgroundDecorationGradient,
        padding: const EdgeInsets.only(
          left: 14.0,
          right: 14.0,
          top: 100.0,
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  EditableResizedFieldWidget(
                    editable: _editable,
                    helpText: 'New task',
                    helpTextSize: 20,
                    inputTextSize: 20,
                    buttonColor: const Color(0x00FFFFFF),
                    fieldWidth: 330,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28),
                    child: EditableResizedFieldWidget(
                      editable: _editable,
                      helpText: 'Description',
                      helpTextSize: 15,
                      inputTextSize: 15,
                      helpTextColor: const Color(0xFF000000),
                      inputTextColor: const Color(0xFF000000),
                      buttonColor: const Color(0xFFDFDCE5),
                      fieldWidth: 330,
                      initialText: 'Projekt budowlany "Nowa Siedziba Firmy XYZ"'
                          ' wymaga natychmiastowej uwagi w związku z widocznymi'
                          ' opóźnieniami w pracach montażowych dotyczących'
                          ' stropu. Klient zgłasza, że proces montażu nie'
                          ' przebiega zgodnie z planem i może to wpłynąć na '
                          'termin realizacji całego projektu. Prosimy o '
                          'bezzwłoczne działania w celu zidentyfikowania '
                          'przyczyny opóźnień oraz podjęcia środków naprawczych'
                          ' w celu usprawnienia procesu montażu. W razie'
                          ' potrzeby prosimy o skonsultowanie się z'
                          ' odpowiednimi specjalistami i zarządem projektu w'
                          ' celu znalezienia optymalnych rozwiązań. Terminowość'
                          ' i jakość realizacji są kluczowe dla sukcesu tego'
                          ' projektu, dlatego liczymy na Państwa zaangażowanie'
                          ' i profesjonalizm w działaniu.'
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 1), child: TaskGalleryWidget(galleryCountElements: 21),),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: CommentWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: CommentWidget(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: AddCommentFieldWidget(fieldWidth: 312),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 30),
                    width: 312,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _visibleStatusList == false
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _visibleStatusList = !_visibleStatusList;
                                  });
                                },
                                child: taskStatusView(taskStatus))
                            : taskStatusListView(updateVisibleStatusList),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Created by Ivan',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              '27.05.23',
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 13.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  _editable
                      ? MainButtonWidget(
                          buttonColor: const Color(0x9037E888),
                          pathToSvg: 'assets/icons/done.svg',
                          onPressed: updateProject,
                        )
                      : const SizedBox(
                          width: 0,
                          height: 0,
                        )
                ],
              ),
              // TODO: set this menus in middle of screen, not view.
              _visibleOptionsMenu
                  ? OptionsWidget(
                      onPressedEdit: updateEditable,
                      onPressedDelete: updateVisibleDeleteMenu,
                    )
                  : Container(),
              _visibleDeleteMenu
                  ? DeleteConfirmButtonWidget(
                      onPressedNo: pressNoDelete,
                      onPressedYes: pressYesDelete,
                    )
                  : const SizedBox(
                      width: 0,
                      height: 0,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget taskStatusView(String status) {
  Color color;
  String text;

  if (status == 'In progress') {
    color = const Color(0x80EAB364);
    text = 'In progress';
  } else if (status == 'Done') {
    color = const Color(0x8037E888);
    text = 'Done';
  } else if (status == 'Ready') {
    color = const Color(0x80FBFDFF);
    text = 'Ready';
  } else {
    color = const Color(0x80E45151);
    text = 'Unknown';
  }

  return Container(
    width: 130,
    height: 32,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.25),
          blurRadius: 4,
          offset: Offset(0, 4),
        ),
      ],
      color: color,
    ),
    alignment: Alignment.center,
    child: Text(
      text,
      style: SafeGoogleFont(
        'Poppins',
        fontSize: 14.0,
        color: Colors.black,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}

Widget taskStatusListView(Function(String) voidCallback) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          voidCallback('Done');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('Done'),
        ),
      ),
      GestureDetector(
        onTap: () {
          voidCallback('In progress');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('In progress'),
        ),
      ),
      GestureDetector(
        onTap: () {
          voidCallback('Ready');
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: taskStatusView('Ready'),
        ),
      ),
    ],
  );
}
