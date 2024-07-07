import 'package:fastap/core/constants/constants.dart';
import 'package:fastap/core/extension/color_extension.dart';
import 'package:fastap/core/extension/context_extension.dart';
import 'package:fastap/core/extension/text_theme_extension.dart';
import 'package:fastap/core/widgets/w_shared_scaffold.dart';
import 'package:flutter/material.dart';

class SNPrivacyPolicy extends StatelessWidget {
  const SNPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return WSharedScaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Text(
          Constants.common.privacyPolicyContent,
          style: context.textTheme.buttonMedium_16.copyWith(
            color: context.theme.colorScheme.naturalColor0,
          ),
        ),
      ),
    );
  }
}
