import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_page.dart';

class ImplicitAnimationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ImplicitAnimationsBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ImplicitAnimationsPage()),
      ];

  static Inject get to => Inject<ImplicitAnimationsModule>.of();
}
