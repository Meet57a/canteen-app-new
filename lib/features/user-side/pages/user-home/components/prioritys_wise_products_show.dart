import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/small_text.dart';
import '../../user-product/product_details_page.dart';

class PrioritysWiseProductsShow extends StatelessWidget {
  const PrioritysWiseProductsShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.productData.prioritys.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            value.getProductPriorityWise(
                value.productData.prioritys[index].name);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: value.productData.prioritys[index].name),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    itemCount: value.productsListPriorityWise.length,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            right: Dimensions.defaultPadding),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetailsPage(
                                        pdata: value
                                            .productsListPriorityWise[index])));
                          },
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.060),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 160,
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        value.productsListPriorityWise[index]
                                            .productImageString,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            SizedBox(width: 3),
                                            SmallText(
                                              text: "4.5",
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.favorite_border,
                                            size: 23,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: value
                                              .productsListPriorityWise[index]
                                              .productName,
                                          size: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        Row(
                                          children: [
                                            SmallText(
                                              text: value
                                                  .productsListPriorityWise[
                                                      index]
                                                  .productPrice,
                                            ),
                                            const Spacer(),
                                            SmallText(
                                              text: value
                                                  .productsListPriorityWise[
                                                      index]
                                                  .productQuantity,
                                              color: AppColorPallete.greyColor,
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          children: [
                                            Icon(
                                              Icons.delivery_dining,
                                              color:
                                                  AppColorPallete.primaryColor,
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
                                              color:
                                                  AppColorPallete.primaryColor,
                                            ),
                                            SizedBox(width: 5),
                                            SmallText(
                                              text: '10 - 15 mins',
                                              size: 12,
                                              color: AppColorPallete.greyColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        SizedBox(
                                          width: double.infinity,
                                          child: SmallText(
                                            text: value
                                                .productsListPriorityWise[index]
                                                .productDescription,
                                            size: 12,
                                            color: AppColorPallete.greyColor,
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
