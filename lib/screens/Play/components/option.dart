import 'package:app_emi/controllers/controllerQuestions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_emi/constants.dart';

class option extends StatelessWidget {
  const option({
    Key? key,
    required this.index,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<controllerQuestions>(
      init: controllerQuestions(),
      builder: (qnController) {
        Color getTheRightColor() {
          if (qnController.isAnwered) {
            if (index == qnController.correctAnswerd) {
              return greenColor;
            } else if (index == qnController.selectAnswer &&
                qnController.selectAnswer != qnController.correctAnswerd) {
              return redColor;
            }
          }
          return grayColor;
        }

        IconData getTheRightIcon() {
          return getTheRightColor() == redColor ? Icons.close : Icons.done;
          // if (qnController.isAnwered) {
          //   if (index == qnController.correctAnswerd) {
          //     return Icons.done;
          //   }
          // }
          // return Icons.close;
        }

        return InkWell(
          onTap: press,
          child: Container(
            margin: const EdgeInsets.only(top: defaultPadding),
            padding: const EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                color: getTheRightColor(),
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index + 1}. ${text}",
                  style: TextStyle(
                    fontSize: semiSmallFont,
                    color: getTheRightColor(),
                  ),
                ),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    color: getTheRightColor() == grayColor
                        ? Colors.transparent
                        : getTheRightColor(),
                    border: Border.all(color: getTheRightColor()),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(
                    // getTheRightIcon()
                    getTheRightIcon() == grayColor ? null : getTheRightIcon(),
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
