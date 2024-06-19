
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/util/constants.dart';
import '../../../../../../core/widget/big_text.dart';
import '../../../../../../core/widget/custome_container.dart';
import '../../../../../../core/widget/small_text.dart';

class RecentOrderContainer extends StatelessWidget {
  const RecentOrderContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      padding: const EdgeInsets.all(Dimensions.defaultPadding),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: Constants.boxShadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BigText(text: "Recent Orders"),
          const SizedBox(height: 10),
          CustomeContainer(
            height: 40,
            width: double.infinity,
            color: Color.fromARGB(143, 76, 175, 79),
            borderColor: Color(0xff2bc155),
            isShadowOn: false,
            child: const Row(
              children: [
                Expanded(
                  child: SmallText(
                    text: "Order ID",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Customer",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Date",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: SmallText(
                    text: "Status",
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: SmallText(
                          text: "ORD-1234",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: "John Doe",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: "12/12/2021",
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: SmallText(
                          text: "Delivered",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
