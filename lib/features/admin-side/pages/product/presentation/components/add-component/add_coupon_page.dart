import 'package:canteen/core/widget/app_bar_widget.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/core/widget/txt_field.dart';
import 'package:canteen/features/admin-side/pages/product/presentation/provider/add_component_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../core/theme/color_pallete.dart';
import '../../../../../../../core/util/constants.dart';
import '../../../../../../../core/widget/big_text.dart';

class AddAndEditCouponPage extends StatelessWidget {
  final String couponId;
  const AddAndEditCouponPage({
    super.key,
    required this.couponId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBarWidget(
          title: couponId.isEmpty ? "Add Coupon" : "Edit Coupon",
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
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                Form(
                  child: Column(
                    children: [
                      TxtField(
                        hintText: "Enter Coupon Name Or Id",
                        controller: value.couponNameOrIdController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Coupon Name Or Id";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: Dimensions.defualtHeightForSpace),
                      TxtField(
                        hintText: "Enter Coupon Value Or Discounted Price",
                        controller: value.couponPriceController,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Please Enter Coupon Value Or Discounted Price";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimensions.defualtHeightForSpace),
                ElevatedButtonCustom(
                  color: Theme.of(context).scaffoldBackgroundColor ==
                          AppColorPallete.backgroundColor
                      ? AppColorPallete.orangeColorWitgOpeDarkMode
                      : AppColorPallete.orangeColorWitgOpeLightMode,
                  borderColor: AppColorPallete.primaryColor,
                  child: Row(
                    children: [
                      BigText(
                        text: couponId.isEmpty ? "Add Coupon" : "Update Coupon",
                        color: AppColorPallete.whiteColor,
                      ),
                      const SizedBox(width: Dimensions.defualtWidthForSpace),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: AppColorPallete.whiteColor,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
