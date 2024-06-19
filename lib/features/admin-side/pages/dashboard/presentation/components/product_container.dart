import 'package:canteen/features/admin-side/pages/dashboard/presentation/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/theme/color_pallete.dart';
import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../../../../../../core/widget/custome_container.dart';
import '../../../../../../core/widget/small_text.dart';
import '../../../../../../model/product_model.dart';
import '../widgets/dashboard_card_widget.dart';
import '../widgets/eleve_widget.dart';

class ProductContainer extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductContainer({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomeContainer(
          height: 350,
          borderColor: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BigText(text: "Products"),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              CustomeContainer(
                color: Theme.of(context).scaffoldBackgroundColor ==
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
                child: FutureBuilder(
                  future: Provider.of<ProductProvider>(context, listen: false)
                      .getProduct(),
                  builder: (context, snapshot) {
                    List pdata = productList;
                    return ListView.builder(
                      itemCount: pdata.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 40,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                child:
                                    SmallText(text: pdata[index].productName),
                              ),
                              Expanded(
                                child: SmallText(
                                    text: pdata[index].productCategory),
                              ),
                              Expanded(
                                child:
                                    SmallText(text: pdata[index].productPrice),
                              ),
                              Expanded(
                                child:
                                    SmallText(text: pdata[index].productStock),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: Dimensions.defualtHeightForSpace),

        ElevatedButtonCustomeDashboard(
            value: productList.length.toString(),
            title: "Product",
            color: AppColorPallete.primaryColor,
            containerColor: Theme.of(context).scaffoldBackgroundColor ==
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
              const CardWidget(
                title: "Total Menus",
                value: "1000",
                icon: Icons.menu_book_sharp,
                borderColor: AppColorPallete.primaryColor,
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              Row(
                children: [
                  Expanded(
                    child: CardWidget(
                        title: "Total Products",
                        value: productList.length.toString(),
                        icon: Icons.food_bank,
                        borderColor: AppColorPallete.primaryColor),
                  ),
                  const SizedBox(width: Dimensions.defualtWidthForSpace),
                  const Expanded(
                    child: CardWidget(
                        title: "Total Categorys",
                        value: "1000",
                        icon: Icons.category,
                        borderColor: AppColorPallete.primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: Dimensions.defualtHeightForSpace),
              const Row(
                children: [
                  Expanded(
                    child: CardWidget(
                        title: "Total Types",
                        value: "1000",
                        icon: Icons.type_specimen,
                        borderColor: AppColorPallete.primaryColor),
                  ),
                  SizedBox(width: Dimensions.defualtWidthForSpace),
                  Expanded(
                    child: CardWidget(
                        title: "Total Sub Categorys",
                        value: "1000",
                        icon: Icons.category_outlined,
                        borderColor: AppColorPallete.primaryColor),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
