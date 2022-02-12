part of 'home_page.dart';

class _HomePageCategory extends HookWidget {
  const _HomePageCategory({Key? key}) : super(key: key);

  static const List<String> _categories = [
    'Hand bag',
    'Jewellery',
    'Footwear',
    'Dresses'
  ];

  @override
  Widget build(BuildContext context) {
    final AnimationController animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    final animation = Tween<double>(
      begin: 20,
      end: 80,
    ).animate(animationController);
    return SizedBox(
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => context.read(categoryIndexRef.notifier).categoryIndex = index,
          child: Consumer(
            builder: (context, ref, child) {
              final currentIndex = ref.watch(categoryIndexRef);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _categories[index]
                      .text
                      .bold
                      .color((index == currentIndex
                          ? context.textTheme.headline5!.color!
                          : context.textTheme.headline5!.color!.withOpacity(0.6)))
                      .make()
                      .pSymmetric(h: 20),
                  AnimatedBuilder(
                    builder: (context, child) => Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 2,
                      width: animation.value,
                      color: index == currentIndex
                          ? context.textTheme.headline5!.color!
                          : Colors.transparent,
                    ),
                    animation: animation,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
