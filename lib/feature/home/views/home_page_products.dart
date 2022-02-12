part of 'home_page.dart';

class _HomePageProducts extends ConsumerWidget {
  const _HomePageProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      ref.watch(cartModelRef(ref.watch(categoryIndexRef))).maybeWhen(
            data: (catalog) => GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: catalog.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: .75,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: catalog[index],
                onPress: () => context.push(
                  (context) => ProductDetailsScreen(product: catalog[index]),
                ),
              ),
            ).pSymmetric(v: 20, h: 20),
            orElse: () => const MainLoading(),
          );
}
