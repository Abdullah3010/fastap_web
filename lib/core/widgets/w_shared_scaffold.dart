import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';

class WSharedScaffold extends StatefulWidget {
  const WSharedScaffold({
    super.key,
    required this.body,
    this.isLoading = false,
    this.bottomSheetHeight,
    this.paddingRight,
    this.paddingLeft,
    this.paddingTop,
    this.paddingBottom,
  });

  final bool isLoading;
  final Widget body;
  final double? bottomSheetHeight;
  final double? paddingRight;
  final double? paddingLeft;
  final double? paddingTop;
  final double? paddingBottom;

  @override
  State<WSharedScaffold> createState() => _WSharedScaffoldState();
}

class _WSharedScaffoldState extends State<WSharedScaffold> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [
              0.1,
              0.6,
              1,
            ],
            colors: [
              context.theme.colorScheme.naturalColor900,
              context.theme.colorScheme.primaryColor600,
              context.theme.colorScheme.primaryColor500,
            ],
          ),
        ),
        child: Stack(
          children: [
            ///[Body]
            Container(
              padding: EdgeInsets.only(
                right: widget.paddingRight ?? 16.w,
                left: widget.paddingLeft ?? 16.w,
                top: widget.paddingTop ?? 24.h,
                bottom: widget.paddingBottom ?? 24.h,
              ),
              child: widget.body,
            ),
          ],
        ),
      ),

      // ),
    );
  }
}
