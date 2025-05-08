import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomExpansionTileController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}

// Custom Expansion Tile Widget
class CustomExpansionTile extends StatelessWidget {
  final CustomExpansionTileController controller = Get.put(CustomExpansionTileController());
  final Widget? leading;
  final Widget title;
  final Widget subtitle;
  final List<Widget> children;
  final Color titleColor;
  final Color subtitleColor;
  final Color iconColor;

  CustomExpansionTile({
    this.leading,
    required this.title,
    this.subtitle = const SizedBox(),
    required this.children,
    this.titleColor = Colors.black, // Default title color
    this.subtitleColor = Colors.grey, // Default subtitle color
    this.iconColor = Colors.black, // Default icon color
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isExpanded = controller.isExpanded.value;
      return Container(
        decoration: BoxDecoration(
            color:  Colors.white,
            borderRadius: BorderRadius.circular(5)
        ),
        child: ExpansionTile(
          leading: leading != null ? IconTheme(
            data: IconThemeData(color: iconColor),
            child: leading!,
          ) : null,
          title: DefaultTextStyle(
            style: TextStyle(color: titleColor),
            child: title,
          ),
          subtitle: DefaultTextStyle(
            style: TextStyle(color: subtitleColor),
            child: subtitle,
          ),
          onExpansionChanged: (value) {
            controller.toggleExpansion();
          },
          initiallyExpanded: isExpanded,
          children: children,
        ),
      );
    });
  }
}