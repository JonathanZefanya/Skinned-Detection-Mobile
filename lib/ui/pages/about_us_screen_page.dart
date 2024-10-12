import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/ui/widgets/profile_info_widget.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class AboutUsScreenPage extends StatefulWidget {
  const AboutUsScreenPage({Key? key}) : super(key: key);

  @override
  _AboutUsScreenPageState createState() => _AboutUsScreenPageState();
}

class _AboutUsScreenPageState extends State<AboutUsScreenPage> {
  _storeOnboardInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('screen', 0);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = ScrollController();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        toolbarHeight: getProportionateScreenHeight(60),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: getProportionateScreenHeight(10)),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: (() => Navigator.pop(context)),
                  child: Container(
                    margin:
                        EdgeInsets.only(left: getProportionateScreenWidth(10)),
                    child: const Icon(Icons.arrow_back_rounded,
                        size: 24, color: whiteColor),
                  )),
              Text(
                'About Us',
                style: latoTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
              const SizedBox(width: 20)
            ],
          ),
        ),
      ),
      body: VsScrollbar(
        controller: _scrollController,
        showTrackOnHover: true, // default false
        isAlwaysShown: true,
        style: VsScrollbarStyle(
          color: Color(0xff9D9F9F),
          hoverThickness: 100.0,
          radius: Radius.circular(5),
          thickness: 7,
        ),
        child: ListView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
          children: [
            ProfileInfoWidget(
              image: 'assets/profile_jonathan.jpg',
              name: 'Jonathan Natannael Zefanya',
              info: 'ITI-IF | Semester 5 | MSIB LX',
            ),
            GestureDetector(
              onDoubleTap: () {
                _storeOnboardInfo();
                // show snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'OnBoarding Diaktifkan 😊. Restarting in 3 seconds...',
                      style: latoTextStyle.copyWith(
                        fontSize: getProportionateScreenWidth(12),
                        fontWeight: weightBold,
                        color: whiteColor,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: blueColor,
                    duration: const Duration(seconds: 2),
                  ),
                );
                Future.delayed(const Duration(seconds: 3), () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                });
              },
              child: ProfileInfoWidget(
                image: 'assets/nahida.jpg',
                name: 'Lesser Lord Kusanali ',
                info: 'Click Profile For Reset',
              ),
            ),

            // Template Untuk ProfileInfoWidget

            // ProfileInfoWidget(
            //   image: 'assets/',
            //   name: '',
            //   info: '',
            // ),
            // ProfileInfoWidget(
            //   image: '',
            //   name: '',
            //   info: '',
            // ),
            // ProfileInfoWidget(
            //   image: '',
            //   name: '',
            //   info: '',
            // ),

            SizedBox(height: getProportionateScreenHeight(40)),
          ],
        ),
      ),
    );
  }
}
