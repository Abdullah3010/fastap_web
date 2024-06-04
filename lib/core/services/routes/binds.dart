import 'package:fastap/modules/share/view_model/cubit/share_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

/// [Binds] is a class that contains all the dependencies that will be used in the app.
class Binds {
  /// [binds] is a function that bind all dependencies.
  static void binds(Injector i) {
    // ======= Cubits ======== //
    i.addSingleton(ShareCubit.new);

    /// [=================================================] ///
  }
}
