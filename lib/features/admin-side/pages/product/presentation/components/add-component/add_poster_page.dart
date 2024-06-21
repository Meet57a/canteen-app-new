import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_component_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/color_pallete.dart';
import '../../../../../../../core/util/constants.dart';

class AddAndEditPosterPage extends StatelessWidget {
  final String posterId;
  const AddAndEditPosterPage({
    super.key,
    required this.posterId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(
          title: posterId.isEmpty ? "Add Poster" : "Edit Poster",
        ),
      ),
      body: Consumer<AddAndEditComponentProvider>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.defaultPadding),
            child: Column(
              children: [
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                GestureDetector(
                  onTap: value.pickImage,
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor ==
                                AppColorPallete.backgroundColor
                            ? AppColorPallete.backgroundColor
                            : AppColorPallete.greyColor200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: AppColorPallete.greyColor200,
                        ),
                        image: value.base64Image.isNotEmpty
                            ? DecorationImage(
                                image: MemoryImage(
                                  value.image!,
                                ),
                                fit: BoxFit.cover,
                              )
                            : null),
                    child: Center(
                      child: (value.base64Image.isEmpty)
                          ? const Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
