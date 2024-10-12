import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:skined/provider/article_page_provider.dart';
import 'package:skined/provider/page_provider.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/ui/pages/home/article_page.dart';
import 'package:skined/ui/pages/home/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);
  static const snackBarDuration = Duration(seconds: 3);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // Initialize SizeConfig for responsiveness
    DateTime? backButtonPressTime;
    ArticlePageProvider articlePageProvider = Provider.of<ArticlePageProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget customNavigationBar() {
      return Container(
        decoration: BoxDecoration(
          color: blueColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          onTap: (value) => pageProvider.currentIndex = value,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageProvider.currentIndex,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedLabelStyle: opensansTextStyle.copyWith(
            color: whiteColor,
            fontSize: getProportionateScreenWidth(12),
            fontWeight: weightBold,
          ),
          unselectedLabelStyle: opensansTextStyle.copyWith(
            color: Colors.white54,
            fontSize: getProportionateScreenWidth(12),
          ),
          selectedItemColor: yellowColor,
          unselectedItemColor: Colors.white54,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
                size: getProportionateScreenWidth(30),
                color: pageProvider.currentIndex == 0 ? yellowColor : Colors.white54,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Article',
              icon: Icon(
                Icons.article,
                size: getProportionateScreenWidth(26),
                color: pageProvider.currentIndex == 1 ? yellowColor : Colors.white54,
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch (pageProvider.currentIndex) {
        case 0:
          return const HomePage();
        case 1:
          return const ArticlePage();
        default:
          return const HomePage();
      }
    }

    Future<bool> handleWillPop(BuildContext context) async {
      final now = DateTime.now();
      final backButtonHasNotBeenPressedOrSnackBarHasBeenClosed =
          backButtonPressTime == null ||
              now.difference(backButtonPressTime!) > snackBarDuration;

      if (backButtonHasNotBeenPressedOrSnackBarHasBeenClosed) {
        backButtonPressTime = now;
        if (articlePageProvider.currentIndex != 5 &&
            pageProvider.currentIndex != 0) {
          articlePageProvider.currentIndex = 5;
          return false;
        } else if (articlePageProvider.currentIndex == 5 &&
            pageProvider.currentIndex == 1) {
          pageProvider.currentIndex = 0;
          return false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Tekan tombol kembali lagi untuk keluar',
                style: opensansTextStyle.copyWith(
                  color: Colors.black,
                  fontWeight: weightMedium,
                  fontSize: getProportionateScreenWidth(12),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: yellowColor,
              duration: snackBarDuration,
            ),
          );
          return false;
        }
      }

      return true;
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async {
          return handleWillPop(context);
        },
        child: Scaffold(
          bottomNavigationBar: customNavigationBar(),
          body: body(),
        ),
      ),
    );
  }
}