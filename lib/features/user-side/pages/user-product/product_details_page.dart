import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/eleve_button.dart';
import 'package:canteen/features/user-side/pages/user-product/component/most_product_list.dart';
import 'package:canteen/features/user-side/pages/user-product/component/product_details_photo_frame.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/big_text.dart';
import '../../../../core/widget/small_text.dart';
import '../../../../model/product_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel pdata;
  const ProductDetailsPage({super.key, required this.pdata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              PhotoFrame(image: pdata.productImageString),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              SizedBox(
                width: double.infinity,
                child: BigText(
                  text: pdata.productName,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
              const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 22,
                  ),
                  SizedBox(width: 3),
                  SmallText(
                    text: '4.5',
                    size: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(width: 3),
                  SmallText(
                    text: '(200 Reviews)',
                    size: 11,
                    color: AppColorPallete.greyColor,
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigText(
                    text: "₹${pdata.productPrice}",
                    color: AppColorPallete.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    width: 120,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            side: MaterialStatePropertyAll(
                              BorderSide(
                                color: AppColorPallete.primaryColor,
                              ),
                            ),
                            minimumSize: MaterialStatePropertyAll(
                              Size(10, 10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.remove,
                            color: AppColorPallete.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const SmallText(
                          text: "1",
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(width: 5),
                        IconButton(
                          onPressed: () {},
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                AppColorPallete.primaryColor),
                            minimumSize: MaterialStatePropertyAll(
                              Size(10, 10),
                            ),
                          ),
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: SmallText(
                  text: pdata.productDescription,
                  color: AppColorPallete.greyColor,
                  textAlign: TextAlign.left,
                  size: 15,
                  textOverflow: TextOverflow.visible,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(
                    Icons.delivery_dining,
                    color: AppColorPallete.primaryColor,
                  ),
                  SizedBox(width: 5),
                  SmallText(
                    text: 'Free Dilivery',
                    size: 12,
                    color: AppColorPallete.greyColor,
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.timer_sharp,
                    color: AppColorPallete.primaryColor,
                  ),
                  SizedBox(width: 5),
                  SmallText(
                    text: '10 - 15 mins',
                    size: 12,
                    color: AppColorPallete.greyColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButtonCustom(
                onPressed: () {},
                color: AppColorPallete.primaryColor,
                borderColor: AppColorPallete.primaryColor,
                child: const SmallText(
                  text: "Add To Cart",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: BigText(
                  text: pdata.productCategory,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 10),
              MostPopularProducts(cat: pdata.productCategory),
            ],
          ),
        ),
      ),
    );
  }
}
