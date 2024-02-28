import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shater/presentation/screens/base/button_back.dart';
import 'package:shater/presentation/screens/base/text_custom.dart';
import 'package:shater/util/color.dart';
import 'package:shater/util/dimensions.dart';

class HtmlView extends StatefulWidget {
  final bool isPrivcy;
  const HtmlView({super.key, required this.isPrivcy});

  @override
  _HtmlViewState createState() => _HtmlViewState();
}

class _HtmlViewState extends State<HtmlView> {
  String _privacyHtml = '';

  @override
  void initState() {
    super.initState();
    _loadPrivacyHtml();
  }

  Future<void> _loadPrivacyHtml() async {
    String htmlContent = await rootBundle.loadString(
        widget.isPrivcy ? 'assets/privacy.html' : 'assets/terms.html');
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
          text: widget.isPrivcy ? 'privcy_policy' : 'terms_conditions',
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
