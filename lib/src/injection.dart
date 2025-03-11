import 'package:depin/src/dynamic_contructor.dart';
import 'package:flutter/widgets.dart';

import 'injection_module.dart';
import 'injector.dart';
import 'route_observer.dart';

part 'inject.dart';

abstract class Injection {
  late final routeObserver = InjectionRouteObserver(
    onPassingArguments: (arguments) {
      Inject._params = arguments;
    },
  );

  Injection() {
    final injectors = this.injectionModules.map((group) {
      final map = {for (var entity in group.injections) entity.type: entity};
      return map;
    }).reduce((map1, map2) {
      map1.addAll(map2);
      return map1;
    });

    Inject._injections.addAll(injectors);
  }

  List<InjectionModule> get injectionModules;
}
