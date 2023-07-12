import 'package:ew_app/constants/colors.dart';
import 'package:ew_app/constants/styles.dart';
import 'package:ew_app/constants/widgets/widgets.dart';
import 'package:ew_app/controllers/additional_information_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

class AdditionalInformationView extends StatefulWidget {
  const AdditionalInformationView(
      AdditionalInformationController additionalInformationController,
      {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdditionalInformationViewState createState() =>
      _AdditionalInformationViewState();
}

class _AdditionalInformationViewState extends State<AdditionalInformationView> {
  final AdditionalInformationController _additionalInformationController =
      AdditionalInformationController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarWidget(leftIcon: BackArrowWidget(),),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: backgroundDecorationGradient,
              padding: const EdgeInsets.only(
                left: 43.0,
                right: 43.0,
                top: 140.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Name *',
                      obscureText: true,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Surname',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Company name',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Address',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Building / Apartment',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'Post code',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 21.0),
                    child: InputFieldWidget(
                      fieldHeight: 33,
                      helpText: 'City',
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      left: 2,
                    ),
                  ),
                  Container(
                    width: 289.0,
                    height: 65.0,
                    margin: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    decoration: BoxDecoration(
                      color: buttonGreyColor,
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {
                        _additionalInformationController.register(context);
                      },
                      child: Text(
                        'Continue',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 33,
                          fontWeight: FontWeight.w400,
                          color: buttonRegisterTextColor,
                        ),
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
