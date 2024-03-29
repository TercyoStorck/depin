class Injector<T> {
  Injector({
    this.injectArgs,
    this.inject,
  }) : assert(injectArgs != null || inject != null, 'No Inject found');

  Type get type => T;

  final T Function(Object? args)? injectArgs;
  final T Function()? inject;

  @override
  bool operator ==(other) {
    if (identical(this, other)) {
      return true;
    }

    if (runtimeType != other.runtimeType) {
      return false;
    }

    if (other is Injector) {
      return this.type == other.type;
    }

    return false;
  }

  @override
  int get hashCode => super.hashCode;
}
