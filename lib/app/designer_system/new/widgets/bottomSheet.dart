import 'package:event_driver_arch/app/designer_system/new/styles/colors/colors.dart';
import 'package:event_driver_arch/app/designer_system/new/styles/texts/heading_texts.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {super.key,
      required this.title,
      required this.message,
      required this.icon});

  final String title;
  final String message;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded( 
          child: Container(
            height: 200,
            color: Colors.transparent,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: icon,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      title,
                      style: CustomHeadingTextStyle.body.copyWith(
                        color: CustomColors.primaryColorDark,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(
                      message,
                      style: CustomHeadingTextStyle.caption.copyWith(
                        color: CustomColors.primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(16),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors.backgroundColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Ok',
                              style: CustomHeadingTextStyle.caption.copyWith(
                                color: CustomColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
