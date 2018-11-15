Compose c() => Compose();

class Compose {
  final _fns = [];

  Compose operator >>(f) => _addFn(f);

  Compose operator *(f) => _addFn(f);

  // Right composition
  operator >(_) => _compose(_, _fns.reversed, (arg, f) => f(arg));

  // Left composition
  operator <(_) => _compose(_, _fns, (arg, f) => f(arg));

  _compose(_, fns, callback(a, b)) => fns.fold(_, callback);

  Compose _addFn(f) {
    _fns.add(f);

    return this;
  }
}
