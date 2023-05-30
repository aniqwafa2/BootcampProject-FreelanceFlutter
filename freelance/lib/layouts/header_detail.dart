import 'package:flutter/material.dart';
import 'package:freelance/model_widget/rounded_image.dart';
import 'package:freelance/utils/app_styles.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Navigator.pop(context),
          borderRadius: buttonPojokKananBorder,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Text(
              "Back",
              style: Styles.headLineStyle3,
            ),
          ),
        ),
        const RoundedImage(
          image: AssetImage('assets/images/profile.jpg'),
        )
      ],
    );
  }
}
