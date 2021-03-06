import 'package:animations_flutter/app/app_bloc.dart';
import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:animations_flutter/app/app_widget.dart';
import 'package:animations_flutter/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<Router> get routers => [
        Router('/home', module: HomeModule()),
        Router('/implicitAnimationsModule', module: ImplicitAnimationsModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
