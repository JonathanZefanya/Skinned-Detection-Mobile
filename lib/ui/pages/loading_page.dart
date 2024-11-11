import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:skined/shared/size_config.dart';
import 'package:skined/shared/theme.dart';
import 'package:skined/ui/pages/result_page.dart';
// import 'package:tflite/tflite.dart';
import 'package:flutter_tflite/flutter_tflite.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key, required this.image}) : super(key: key);
  final File? image;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    _loadModel();
    Future.delayed(const Duration(milliseconds: 500), () {
      _imageClasification(widget.image);
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  void _loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
      numThreads: 1, // defaults to 1
      isAsset: true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false // defaults to false, set to true to use GPU delegate
    );
  }

  void _imageClasification(File? image) async {
    var output = await Tflite.runModelOnImage(
      path: image!.path,
      numResults: 5,
      threshold: 0.5,
      imageMean: 1.0,
      imageStd: 117.0,
      asynch: true,
    );
    setState(() {
      print(output![0]["label"]);
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(
              image: widget.image,
              pred: output,
            ),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          elevation: 0,
          backgroundColor: whiteColor,
          toolbarHeight: getProportionateScreenHeight(60),
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: getProportionateScreenHeight(23)),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                'Scan',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: whiteColor,
                ),
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We are scanning, please wait ...',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: blueColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(40)),
                child: Lottie.asset(
                  'assets/loading.json',
                  height: getProportionateScreenHeight(200),
                  width: getProportionateScreenWidth(200),
                ),
              ),
              Text(
                '“Cleanliness is the only way to keep\nall the diseases away.”',
                style: latoTextStyle.copyWith(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: weightBold,
                  color: blueColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
