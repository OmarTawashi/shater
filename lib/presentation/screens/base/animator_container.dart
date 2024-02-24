import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shater/presentation/screens/base/custom_cupertino_button.dart';
import 'package:shater/util/dimensions.dart';
import 'package:shater/util/font_style.dart';

import '../../../core/controller/base_controller.dart';
import '../../../util/images.dart';

class AnimatorContainer extends StatelessWidget {
  final ViewType viewType;
  final Widget successWidget;
  final Widget? shimmerWidget;
  final Widget? errorWidget;
  final Widget? customWidget;
  final EmptyParams? emptyParams;
  final VoidCallback? retry;
  final Duration? animationDuration;
  final bool isSliver;
  final Widget Function(Widget, Animation)? transitionBuilder;

  const AnimatorContainer(
      {Key? key,
      required this.viewType,
      this.shimmerWidget = const SizedBox(),
      required this.successWidget,
      this.errorWidget,
      this.customWidget,
      this.retry,
      this.emptyParams,
      this.animationDuration,
      this.transitionBuilder,
      this.isSliver = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isSliver && viewType != ViewType.success) {
      return SliverToBoxAdapter(
          child: SizedBox(
        height: Get.height * 0.8,
        child: _getChild(context),
      ));
    } else if (isSliver && viewType == ViewType.success) {
      return _getChild(context);
    } else {
      return SafeArea(
        child: _getChild(context),
      );
    }
  }

  _getChild(BuildContext context) {
    if (viewType == ViewType.success) {
      return successWidget;
    } else if (viewType == ViewType.shimmer) {
      return shimmerWidget;
    } else if (viewType == ViewType.loading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else if (viewType == ViewType.custom) {
      return customWidget;
    } else if (viewType == ViewType.error) {
      return errorWidget;
    } else if (viewType == ViewType.noInternet) {
      return EmptyView(
        onRetry: retry,
        emptyParams: EmptyParams(
          text: 'no_internet'.tr,
          caption: 'check_connection'.tr,
          image: ICONS.internalServerError,
        ),
      );
    } else if (viewType == ViewType.internalServarError) {
      return EmptyView(
        onRetry: retry,
        emptyParams: EmptyParams(
          text: 'internal_server_error'.tr,
          caption: 'check_connection'.tr,
          image: ICONS.internalServerError,
        ),
      );
    } else if (viewType == ViewType.notFound) {
      return EmptyView(
        emptyParams: EmptyParams(
          text: 'page_not_found'.tr,
          caption: 'the_link_not_found'.tr,
          image: ICONS.internalServerError,
        ),
      );
    } else if (viewType == ViewType.noStores) {
      return EmptyView(
        emptyParams: EmptyParams(
          text: 'no_store_found'.tr,
          caption: 'you_dont_have_any_store_from'.tr,
          image: ICONS.internalServerError,
        ),
      );
    } else if (viewType == ViewType.empty) {
      return EmptyView(emptyParams: emptyParams);
    }
  }
}

class EmptyView extends StatelessWidget {
  final EmptyParams? emptyParams;
  final VoidCallback? onRetry;

  const EmptyView({
    super.key,
    required this.emptyParams,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (emptyParams != null && emptyParams!.image.isNotEmpty)
            ConstrainedBox(
                child: SvgPicture.asset(
                  emptyParams!.image,
                ),
                constraints: const BoxConstraints(maxHeight: 300)),
          if (emptyParams != null) ...[
            const SizedBox(
              height: 20,
            ),
            if (emptyParams!.text.isNotEmpty)
              Text(
                emptyParams!.text,
                style: FontStyleConstant.hNLTRegular
                    .copyWith(fontSize: Dimensions.fontSize14),
                textAlign: TextAlign.center,
              ),
            if (emptyParams!.caption.isNotEmpty) ...[
              const SizedBox(height: 6),
              Text(
                emptyParams!.caption,
                style: FontStyleConstant.hNLTBMedium
                    .copyWith(fontSize: Dimensions.fontSize12),
                textAlign: TextAlign.center,
              ),
            ]
          ],
          if (onRetry != null) ...[
            const SizedBox(height: 24),
            CustomCupertinoButton(
              text: 'retry'.tr,

              onPressed: onRetry,
              // backgroundColor: Colors.black.withOpacity(1),
            ),
            // ActionChip(
            //   label: Text('retry'.tr),
            //   labelStyle: robotoRegular.copyWith(
            //     fontSize: Dimensions.fontSize12,
            //     color: const Color.fromRGBO(255, 109, 0, 1),
            //   ),
            //   backgroundColor: const Color.fromRGBO(255, 109, 0, 0.1),
            //   labelPadding: const EdgeInsetsDirectional.fromSTEB(8, 2, 8, 2),
            //   onPressed: onRetry,
            //   elevation: 0,

            //   pressElevation: 0,
            // ),
          ],
        ],
      ),
    );
  }
}

class EmptyParams {
  final String text;
  final String caption;
  final String image;

  EmptyParams({
    required this.text,
    required this.caption,
    required this.image,
  });
}
