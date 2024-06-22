import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:canteen/core/util/constants.dart';
import 'package:canteen/core/widget/big_text.dart';
import 'package:canteen/core/widget/small_text.dart';
import 'package:canteen/features/user-side/pages/cart/cart_page.dart';
import 'package:canteen/features/user-side/pages/user-home/components/category_container.dart';
import 'package:canteen/features/user-side/pages/user-home/components/poster_container.dart';
import 'package:canteen/features/user-side/pages/user-home/components/prioritys_wise_products_show.dart';
import 'package:canteen/features/user-side/pages/user-home/provider/home_page_provider.dart';
import 'package:canteen/features/user-side/widgets/app_bar_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/color_pallete.dart';
import '../../../../core/util/image_strings.dart';

class HomePageUser extends StatefulWidget {
  const HomePageUser({super.key});

  @override
  State<HomePageUser> createState() => _HomePageUserState();
}

class _HomePageUserState extends State<HomePageUser> {
  final homePageProvider = HomePageProvider();
  @override
  Widget build(BuildContext context) {
    // final value = Provider.of<HomePageProvider>(context, listen: false);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SafeArea(
          child: AppBarUser(),
        ),
      ),
      bottomNavigationBar: BottomBarBubble(
        color: AppColorPallete.primaryColor,
        items: [
          BottomBarItem(
            iconData: Icons.home,
            label: "Home",
          ),
          BottomBarItem(
            iconData: Icons.search,
            label: "Search",
          ),
          BottomBarItem(
            iconData: Icons.favorite,
            label: "Favorite",
          ),
          BottomBarItem(
            iconData: Icons.person,
            label: "Profile",
          ),
        ],
        onSelect: (value) {
        
        },
      ),
      body: FutureBuilder(
        future: homePageProvider.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const SingleChildScrollView(
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "What would you like to order",
                    color: AppColorPallete.primaryColor,
                    size: 32,
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.bold,
                    textOverflow: TextOverflow.visible,
                  ),
                  SizedBox(height: Dimensions.defualtHeightForSpace),
                  PosterContainer(),
                  SizedBox(height: Dimensions.defualtHeightForSpace),
                  Divider(),
                  BigText(
                    text: "Categorys",
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: Dimensions.defualtHeightForSpace),
                  CategoryContainer(),
                  SizedBox(height: Dimensions.defualtHeightForSpace),
                  PrioritysWiseProductsShow(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
