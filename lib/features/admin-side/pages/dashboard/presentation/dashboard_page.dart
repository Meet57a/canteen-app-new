import 'package:canteen/features/admin-side/controller/product_controller.dart';
import 'package:canteen/features/admin-side/data/product_data.dart';
import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../../core/theme/color_pallete.dart';
import '../../../../../core/util/constants.dart';
import '../../../../../core/widget/app_bar_widget.dart';
import '../../../../../core/widget/big_text.dart';
import '../../../../../core/widget/bottom_navigation_bar_custome.dart';
import '../../../../../core/widget/custome_container.dart';
import '../../../../../core/widget/small_text.dart';
import '../../product/presentation/add_product_page.dart';
import 'components/analytics_section.dart';
import 'components/product_container.dart';
import 'components/recent_order_container.dart';
import 'components/revenue_container.dart';
import 'widgets/dashboard_card_widget.dart';
import 'widgets/eleve_widget.dart';
import 'package:flutter/material.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  final productControllerAdmin = Get.find<ProductControllerAdmin>();
  final productDataAdmin = Get.find<ProductDataAdmin>();

  @override
  void initState() {
    super.initState();
    productControllerAdmin.getProduct();
  }

  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar widget
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 40),
        child: AppBarWidget(
          title: "Dashboard",
        ),
      ),
      // drawer: const DrawerWidget(),
      bottomNavigationBar: const BottomNavigationBarCustome(),
      floatingActionButton: CircleAvatar(
        backgroundColor: AppColorPallete.primaryColor,
        radius: 30,
        child: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddProductPage(),
              ),
            );
          },
          icon: const Icon(Icons.add),
          color: Colors.white,
          iconSize: 30,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => refresh(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding:
              const EdgeInsets.symmetric(horizontal: Dimensions.defaultPadding),
          child: Column(
            children: [
              //AnalyticsSection

              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const BigText(text: "Welcome, Meet"),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const AnalyticsSection(),

              //AnalyticsSection
              Divider(
                thickness: 2,
                color: Theme.of(context).dividerColor,
              ),

              //RecentOrderContainer

              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const RecentOrderContainer(),
              const SizedBox(height: Dimensions.defualtHeightForSpace),

              //RecentOrderContainer

              const ElevatedButtonCustomeDashboard(
                value: "12",
                title: "Orders",
                containerColor: AppColorPallete.colorGreenWithope,
                color: AppColorPallete.greenColor,
              ), //button custome widget

              //RevenueContainer

              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const RevenueContainer(),
              const SizedBox(height: Dimensions.defualtHeightForSpace),

              //RevenueContainer

              Divider(
                thickness: 2,
                color: Theme.of(context).dividerColor,
              ),

              //ProductContainer

              const SizedBox(height: Dimensions.defualtHeightForSpace),

              FutureBuilder(
                future: Provider.of<ProductProvider>(context).getProduct(),
                builder: (context, snapshot) {
                  final provider = Provider.of<ProductProvider>(context);
                  List pdata = provider.productData.products;
                  return Column(
                    children: [
                      CustomeContainer(
                        height: 350,
                        borderColor: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BigText(text: "Products"),
                            const SizedBox(
                                height: Dimensions.defualtHeightForSpace),
                            CustomeContainer(
                              color: Theme.of(context)
                                          .scaffoldBackgroundColor ==
                                      AppColorPallete.backgroundColor
                                  ? AppColorPallete.orangeColorWitgOpeDarkMode
                                  : AppColorPallete.orangeColorWitgOpeLightMode,
                              isShadowOn: false,
                              borderColor: AppColorPallete.primaryColor,
                              child: const Row(
                                children: [
                                  Expanded(
                                    child: SmallText(
                                      text: "Name",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: SmallText(
                                      text: "Category",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: SmallText(
                                      text: "Price",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: SmallText(
                                      text: "Stock",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: pdata.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 40,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: SmallText(
                                              text: pdata[index].productName),
                                        ),
                                        Expanded(
                                          child: SmallText(
                                              text:
                                                  pdata[index].productCategory),
                                        ),
                                        Expanded(
                                          child: SmallText(
                                              text: pdata[index].productPrice),
                                        ),
                                        Expanded(
                                          child: SmallText(
                                              text: pdata[index].productStock),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: Dimensions.defualtHeightForSpace),

                      ElevatedButtonCustomeDashboard(
                          value: pdata.length.toString(),
                          title: "Product",
                          color: AppColorPallete.primaryColor,
                          containerColor: Theme.of(context)
                                      .scaffoldBackgroundColor ==
                                  AppColorPallete.backgroundColor
                              ? AppColorPallete.orangeColorWitgOpeDarkMode
                              : AppColorPallete
                                  .orangeColorWitgOpeLightMode), //button custome widget
                      const SizedBox(height: Dimensions.defualtHeightForSpace),

                      CustomeContainer(
                        height: 330,
                        borderColor: Colors.transparent,
                        child: Column(
                          children: [
                            CardWidget(
                              title: "Total Menus",
                              value:
                                  provider.productData.menus.length.toString(),
                              icon: Icons.menu_book_sharp,
                              borderColor: AppColorPallete.primaryColor,
                            ),
                            const SizedBox(
                                height: Dimensions.defualtHeightForSpace),
                            Row(
                              children: [
                                Expanded(
                                  child: CardWidget(
                                      title: "Total Products",
                                      value: pdata.length.toString(),
                                      icon: Icons.food_bank,
                                      borderColor:
                                          AppColorPallete.primaryColor),
                                ),
                                const SizedBox(
                                    width: Dimensions.defualtWidthForSpace),
                                Expanded(
                                  child: CardWidget(
                                    title: "Total Categorys",
                                    value: provider.productData.categorys.length
                                        .toString(),
                                    icon: Icons.category,
                                    borderColor: AppColorPallete.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                                height: Dimensions.defualtHeightForSpace),
                            Row(
                              children: [
                                Expanded(
                                  child: CardWidget(
                                      title: "Total Prioritys",
                                      value: provider
                                          .productData.prioritys.length
                                          .toString(),
                                      icon: Icons.type_specimen,
                                      borderColor:
                                          AppColorPallete.primaryColor),
                                ),
                                const SizedBox(
                                    width: Dimensions.defualtWidthForSpace),
                                Expanded(
                                  child: CardWidget(
                                    title: "Total Sub Categorys",
                                    value: provider
                                        .productData.subCategorys.length
                                        .toString(),
                                    icon: Icons.category_outlined,
                                    borderColor: AppColorPallete.primaryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: Dimensions.defualtHeightForSpace),

              const SizedBox(height: Dimensions.defualtHeightForSpace),

              //ProductContainer
            ],
          ),
        ),
      ),
    );
  }
}
