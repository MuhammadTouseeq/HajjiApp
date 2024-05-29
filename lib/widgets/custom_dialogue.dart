
import 'package:flutter/material.dart';
import 'package:hajjiapp/widgets/custom_text.dart';
import '../core/utils/color_constant.dart';
import '../core/utils/responsive.dart';
import '../core/utils/size_utils.dart';
import '../theme/app_style.dart';

class CustomDialogue extends StatelessWidget {
  final String dialogueBoxHeading;
  final String dialogueBoxText;
  final VoidCallback actionOnYes;
  final VoidCallback actionOnNo;

  CustomDialogue(
      {Key? key,
      required this.dialogueBoxHeading,
      required this.dialogueBoxText,
      required this.actionOnNo,
      required this.actionOnYes})
      : super(key: key);

  Responsive responsive = Responsive();

  @override
  Widget build(BuildContext context) {
    responsive.setContext(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Container(
        height: responsive.setHeight(19),
        width: responsive.setWidth(10),
        child: Column(
          children: [
            SizedBox(
              height: responsive.setHeight(3),
            ),
            MyText(title: "Exit"),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
              child: MyText(
                title: dialogueBoxText,
                clr: ColorConstant.black900,
                center: true,
              )
            ),
            Spacer(),
            const Spacer(),
            Container(
              height: 0.7,
              color: ColorConstant.textfieldborder.withOpacity(0.6),
            ),

            // Row()
            Container(
              height: responsive.setHeight(6),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: actionOnNo,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.transparent)),
                        child: MyText(
                          title: "No",
                        )
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: ColorConstant.textfieldborder.withOpacity(0.6),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: actionOnYes,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(color: Colors.transparent)),
                        child: MyText(
                          title: "yes",
                        )
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