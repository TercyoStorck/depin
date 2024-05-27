import 'package:flutter/widgets.dart';

import 'injection_group.dart';
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
    final injectors = this.groups.map((group) {
      final map = {for (var entity in group.injections) entity.type: entity};
      return map;
    }).reduce((map1, map2) {
      map1.addAll(map2);
      return map1;
    });

    Inject._injections.addAll(injectors);
  }

  List<InjectionGroup> get groups;
}
