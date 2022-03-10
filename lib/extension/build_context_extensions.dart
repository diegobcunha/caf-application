
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizedBuildConxtext on BuildContext {
  AppLocalizations get localization => AppLocalizations.of(this); 
}