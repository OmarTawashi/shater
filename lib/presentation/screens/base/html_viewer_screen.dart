import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class HtmlView extends StatefulWidget {
  final HtmlScreenType htmlScreenType;
  const HtmlView({super.key, required this.htmlScreenType});

  @override
  _HtmlViewState createState() => _HtmlViewState();
}

enum HtmlScreenType{
  privacyPolicy,
  about,
  terms
}

class _HtmlViewState extends State<HtmlView> {
  String _privacyHtml = '';

  @override
  void initState() {
    super.initState();
    setHtmlScreenType();
  }

  setHtmlScreenType(){
    switch(widget.htmlScreenType){
      case HtmlScreenType.terms :
        _loadPrivacyHtml('assets/terms.html');
        break;
      case HtmlScreenType.privacyPolicy:
        _loadPrivacyHtml('assets/privacy.html');
        break;
      case HtmlScreenType.about:
        _loadPrivacyHtml('assets/about.html');
        break;
    }
  }


  String getTitle(){
    switch(widget.htmlScreenType){
      case HtmlScreenType.terms :
        return 'terms_conditions';
      case HtmlScreenType.privacyPolicy:
        return 'privcy';
      case HtmlScreenType.about:
        return 'about_me';
    }
  }

  Future<void> _loadPrivacyHtml(String src) async {
    String htmlContent = await rootBundle.loadString(src);
    setState(() {
      _privacyHtml = htmlContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.primaryColor,
      appBar: AppBar(
        backgroundColor: COLORS.primaryColor,
        leading: ButtonBack(),
        centerTitle: true,
        title: CustomText(
          text: getTitle().tr,
          color: Colors.white,
          fontSize: Dimensions.fontSize15,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Html(
            data: _privacyHtml,
          )),
    );
  }
}
