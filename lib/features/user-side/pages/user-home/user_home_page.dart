import 'package:canteen/core/theme/color_pallete.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/util/image_strings.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/features/user-side/pages/user-home/components/category_container.dart';
import 'package:canteen/features/user-side/pages/user-home/components/poster_container.dart';
import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:canteen/features/user-side/widgets/app_bar_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/widget/big_text.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.defaultPadding,
          ),
          child: AppBarUser(),
        )),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            const SizedBox(height: Dimensions.defualtHeightForSpace),
            Expanded(
              child: FutureBuilder(
                future: HomePageProvider().getAll(),
                builder: (context, snapshot) {
                  return ListView.builder(
                    itemCount: 2,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          index == 0
                              ? const BigText(
                                  text: "What would you like to order",
                                  fontWeight: FontWeight.bold,
                                  textOverflow: TextOverflow.visible,
                                  textAlign: TextAlign.left,
                                  size: 35,
                                )
                              : SizedBox.shrink(),
                          index == 0 ? PosterContainer() : SizedBox.shrink(),
                          SizedBox(
                              height: index == 0
                                  ? Dimensions.defualtHeightForSpace
                                  : 0),
                          index == 0
                              ? BigText(text: "Categorys")
                              : SizedBox.shrink(),
                          SizedBox(
                              height: index == 0
                                  ? Dimensions.defualtHeightForSpace
                                  : 0),
                          index == 0 ? CategoryContainer() : SizedBox.shrink(),
                          SizedBox(
                              height: index == 0
                                  ? Dimensions.defualtHeightForSpace
                                  : 0),
                          const BigText(
                            text: "Most Popular",
                          ),
                          SizedBox(
                            height: 300,
                            child: ListView.builder(
                              itemCount: 2,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      right: Dimensions.defaultPadding),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.060),
                                            spreadRadius: 1,
                                            blurRadius: 10,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: 160,
                                                width: double.infinity,
                                                padding: const EdgeInsets.only(
                                                    left: 10, top: 10),
                                                decoration: const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                      ImagePath.img,
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 40,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white
                                                            .withOpacity(0.5),
                                                      ),
                                                      child: const Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.yellow,
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
                                                        color: Colors.white
                                                            .withOpacity(0.5),
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
                                            ],
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: SizedBox(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SmallText(
                                                    text:
                                                        "pdata[index].productName",
                                                    size: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SmallText(
                                                        text:
                                                            "₹pdata[index].productPrice",
                                                      ),
                                                      Spacer(),
                                                      SmallText(
                                                        text:
                                                            "pdata[index].productQuantity",
                                                        color: AppColorPallete
                                                            .greyColor,
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.delivery_dining,
                                                        color: AppColorPallete
                                                            .primaryColor,
                                                      ),
                                                      SizedBox(width: 5),
                                                      SmallText(
                                                        text: 'Free Dilivery',
                                                        size: 12,
                                                        color: AppColorPallete
                                                            .greyColor,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Icon(
                                                        Icons.timer_sharp,
                                                        color: AppColorPallete
                                                            .primaryColor,
                                                      ),
                                                      SizedBox(width: 5),
                                                      SmallText(
                                                        text: '10 - 15 mins',
                                                        size: 12,
                                                        color: AppColorPallete
                                                            .greyColor,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(height: 5),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: SmallText(
                                                      text:
                                                          "pdata[index].productDescription",
                                                      size: 12,
                                                      color: AppColorPallete
                                                          .greyColor,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
