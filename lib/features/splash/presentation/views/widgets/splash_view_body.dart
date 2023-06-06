import 'package:bookly1/constants.dart';
import 'package:bookly1/core/utils/assets.dart';
import 'package:bookly1/core/utils/routers.dart';
import 'package:bookly1/features/home/presentation/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({Key? key}) : super(key: key);

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation; //عشان اتحكم في الانيميشن بتاعي لان اخره من 0 ل 1
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    navigateToHome();
  }




  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4.0,
        ),
        buildAnimatedBuilder(),
      ],

    );
  }

  AnimatedBuilder buildAnimatedBuilder() {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (BuildContext context, Widget? child) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0
              ),
            ),
          );
        },

      );
  }


  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 2),end: Offset.zero).animate(animationController);// offset ده عشان يظهر منين لفين x axis y axis
    animationController.forward();// عشان يشتغل
  }


  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2),(){
      GoRouter.of(context).push(AppRouter.kHomeView);
    },
    );
  }
}
