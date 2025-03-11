class Injector<T> {
  Injector(this.inject);

  Type get type => T;

  final Function inject;

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