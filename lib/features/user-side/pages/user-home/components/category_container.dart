import 'package:flutter/material.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/image_strings.dart';
import '../../../../../core/widget/small_text.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        itemCount: 2,
        // padding: const EdgeInsets.symmetric(vertical: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 90,
                decoration: BoxDecoration(
                  color: AppColorPallete.whiteColor.withOpacity(.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.060),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 65,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImagePath.img),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 7),
                    const SmallText(
                      text: "hecscoo",
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
