import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:freelance/model/category_model.dart';

import '../../../utils/app_styles.dart';

class HomeCategoriesItem extends StatefulWidget {
  final CategoryModel categoryModel;
  const HomeCategoriesItem(this.categoryModel, {super.key});

  @override
  State<HomeCategoriesItem> createState() => _HomeCategoriesItemState();
}

class _HomeCategoriesItemState extends State<HomeCategoriesItem> {
  bool tranlator = false;

  bool programer = false;

  bool uiux = false;

  bool it = false;

  bool mobile = false;

  @override
  void initState() {
    useIcon();

    super.initState();
  }

  void useIcon() {
    if (widget.categoryModel.id == 2) {
      tranlator = true;
    } else if (widget.categoryModel.id == 10) {
      it = true;
    } else if (widget.categoryModel.id == 8) {
      mobile = true;
    } else if (widget.categoryModel.id == 6) {
      uiux = true;
    } else if (widget.categoryModel.id == 1) {
      programer = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: 75,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              (tranlator)
                  ? Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.translate),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              (it)
                  ? Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.computer),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              (mobile)
                  ? Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.phone_android),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              (uiux)
                  ? Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.palette),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              (programer)
                  ? Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(Icons.terminal),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
              Flexible(
                  child: Text(
                widget.categoryModel.name,
                style: Styles.headLineStyle3,
              )),
            ],
          ),
        ));
  }
}
