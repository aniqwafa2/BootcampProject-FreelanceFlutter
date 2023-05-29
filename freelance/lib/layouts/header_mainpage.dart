import 'package:flutter/material.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/utils/app_styles.dart';

class MainPageHeader extends StatelessWidget {
  final String title;

  const MainPageHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Styles.headLineStyle3,
        ),
        const RoundedImage(
          image: AssetImage('assets/images/profile.jpg'),
        )
      ],
    );
  }
}
