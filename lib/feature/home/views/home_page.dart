import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shopping_app_ui/core/providers/global_cart_item_count_provider.dart';
import 'package:shopping_app_ui/core/widgets/custom_widgets.dart';
import 'package:shopping_app_ui/feature/home/providers/cart_models_provider.dart';
import 'package:shopping_app_ui/feature/home/providers/category_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:shopping_app_ui/riverpod_extensions.dart';

import '../../../core/widgets/add_to_cart_animation/providers/cart_item_count_provider.dart';
import '../../product_details/views/product_details_screen.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../providers/page_controller_provider.dart';
import 'package:velocity_x/velocity_x.dart';

part 'home_page_category.dart';

part 'home_page_products.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          const ThemeSwitcher(),
          Lottie.asset(
            'assets/json/lottie/search.json',
          ).scale(scaleValue: 0.6),
          Consumer(
            builder: (context, ref, child) {
              return child!
                  .badge(
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    count: ref.watch(globalCartItemCountRef),
                  )
                  .pSymmetric(h: 4, v: 2);
            },
            child: Consumer(
              builder: (context, ref, child) => Lottie.asset(
                'assets/json/lottie/cart.json',
              ).scale(scaleValue: 0.6),
            ),
          ),
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Women'.text.headline5(context).bold.make().pSymmetric(v: 20, h: 20),
            const _HomePageCategory().pSymmetric(v: 20, h: 20),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) =>
                    ref.read(categoryIndexRef.notifier).categoryIndex = index,
                controller: ref.read(pageControllerRef),
                children: const [
                  _HomePageProducts(),
                  _HomePageProducts(),
                  _HomePageProducts(),
                  _HomePageProducts()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
