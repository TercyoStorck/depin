import 'package:flutter/widgets.dart';

class InjectionRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  final void Function(Object? arguments) _onPassingArguments;

  InjectionRouteObserver({
    required void Function(Object? arguments) onPassingArguments,
  }) : _onPassingArguments = onPassingArguments;

  @override
  void didPop(Route route, Route? previousRoute) {
    _onPassingArguments(null);
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    _onPassingArguments(route.settings.arguments);
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _onPassingArguments(route.settings.arguments);
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _onPassingArguments(newRoute?.settings.arguments);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
