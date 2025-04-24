import 'package:depin/src/dynamic_contructor.dart';
import 'package:depin/src/route_observer.dart';
import 'package:flutter/widgets.dart';

import 'injection_module.dart';
import 'injector.dart';

part 'inject.dart';

abstract class Injection {
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
