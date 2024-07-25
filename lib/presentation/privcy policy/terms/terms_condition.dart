import 'package:flutter/material.dart';
import 'package:shater/presentation/screens/base/html_viewer_screen.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HtmlView(htmlScreenType: HtmlScreenType.terms,);
  }
}