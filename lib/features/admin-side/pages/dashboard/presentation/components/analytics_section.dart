import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../../core/util/constants.dart';
import '../widgets/dashboard_card_widget.dart';

class AnalyticsSection extends StatelessWidget {
  const AnalyticsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 120,
          crossAxisSpacing: Dimensions.defaultPadding,
          mainAxisSpacing: Dimensions.defaultPadding,
        ),
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          CardWidget(
            title: "Total Orders",
            value: "1000",
            icon: Icons.shopping_cart,
          ),
          CardWidget(
            title: "Total Served",
            value: "1000",
            icon: FontAwesomeIcons.truck,
          ),
          CardWidget(
            title: "Total Pending",
            value: "1000",
            icon: Icons.pending_actions_outlined,
          ),
          CardWidget(
            title: "Total Income",
            value: "1000",
            icon: Icons.currency_rupee,
          ),
        ],
      ),
    );
  }
}
