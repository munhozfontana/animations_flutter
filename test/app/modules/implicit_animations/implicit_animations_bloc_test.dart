import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:animations_flutter/app/app_module.dart';
import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_bloc.dart';
import 'package:animations_flutter/app/modules/implicit_animations/implicit_animations_module.dart';

void main() {
  Modular.init(AppModule());
  Modular.bindModule(ImplicitAnimationsModule());
  ImplicitAnimationsBloc bloc;

  setUp(() {
    bloc = ImplicitAnimationsModule.to.get<ImplicitAnimationsBloc>();
  });

  group('ImplicitAnimationsBloc Test', () {
    test("First Test", () {
      expect(bloc, isInstanceOf<ImplicitAnimationsBloc>());
    });
  });
}
