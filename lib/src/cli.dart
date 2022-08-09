/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of src;

typedef _Func = void Function(Args ar);

class _CLI {
  late Args args;
  List<List<dynamic>> route = [];

  _CLI._(List<String> arguments) {
    args = Args._items(items: arguments);
  }

  T? _cast<T>(x) => x is T ? x : null;

  _Func? getFunc(dynamic value) => _cast(value);

  Args argsIns(List<String> args) => Args._(args: args, opts: this.args._opts);

  void run() {
    final ar = args._args;
    final r = splitRoute();

    List<_Func> lsNotFound = r.item1;
    List<_Func> lsHelp = r.item2;
    Map<String, _Func> map = r.item3;

    if (ar.isEmpty) {
      for (var f in lsHelp) {
        f(args);
      }
      return;
    }

    final v = findFunc(map, ar);
    if (v != null) {
      v.item1(Args._(args: v.item2, opts: args._opts));
      return;
    }


    for (var f in lsNotFound) {
      f(args);
    }
  }

  _Tuple3<List<_Func>, List<_Func>, Map<String, _Func>> splitRoute() {
    List<_Func> lsNotFound = [];
    List<_Func> lsHelp = [];
    Map<String, _Func> map = {};

    for (var r in route) {
      if (r.length == 1) {
        final fn = getFunc(r[0]);
        if (fn != null) {
          lsNotFound.add(fn);
        }
        continue;
      }

      if (r.length > 2) {
        continue;
      }

      final k = _cast<String>(r[0]);
      final f = _cast<_Func>(r[1]);
      if (k != null && f != null) {
        if (k == '') {
          lsHelp.add(f);
        } else {
          map[k] = f;
        }
      }
    }

    return _Tuple3(lsNotFound, lsHelp, map);
  }

  _Tuple2<_Func, List<String>>? findFunc(Map<String, _Func> map, List<String> args) {
    for (var i=args.length-1; i>=0; i--) {
      var key = '';

      for (var j=0; j<=i; j++) {
        if (key != '') {
          key += ' ';
        }
        key += args[j];
      }

      final newArgs = <String>[];
      for (int x=args.length-1; x>i; x--) {
        newArgs.insert(0, args[x]);
      }

      final f = map[key];
      if (f == null) {
        continue;
      }

      return _Tuple2(f, newArgs);
    }

    return null;
  }
}

class _Tuple2<T1, T2> {
  final T1 item1;
  final T2 item2;

  const _Tuple2(this.item1, this.item2);
}

class _Tuple3<T1, T2, T3> {
  final T1 item1;
  final T2 item2;
  final T3 item3;

  const _Tuple3(this.item1, this.item2, this.item3);
}
