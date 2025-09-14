import 'package:flutter/material.dart';
import 'package:flutter_shopping_cart/router/router_utils.dart';
import 'package:flutter_shopping_cart/utils/constant.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: AppStyle.spacing,
          children: [
            Image.asset('assets/images/group-of-fruits-96.png'),
            Text(
              'We deliver groceries at your doorstep',
              style: TextStyle(
                fontFamily: AppFont.heading,
                fontSize: AppFontSize.heading * 2,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Fresh items everyday',
              style: TextStyle(
                fontFamily: AppFont.body,
                fontSize: AppFontSize.heading,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyle.spacing * 2),
            FilledButton(
              onPressed: () => context.pushNamed(SCREENS.home.name),
              style: FilledButton.styleFrom(
                padding: EdgeInsets.all(AppStyle.padding * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppStyle.radius),
                ),
                textStyle: TextStyle(
                  fontFamily: AppFont.body,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: const Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}
