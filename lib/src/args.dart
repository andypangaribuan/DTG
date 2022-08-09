/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

part of src;

class Args {

  final List<String> _args = [];
  final List<String> _opts = [];

  Args._({required List<String> args, required List<String> opts}) {
    _args.addAll(args);
    _opts.addAll(opts);
  }

  Args._items({required List<String> items}) {
    for (var item in items) {
      final v = item.trim();
      if (v.length > 2 && v.substring(0, 2) == "--") {
        _opts.add(v);
      } else {
        _args.add(v);
      }
    }
  }

  String _arg(int index) => _args.length >= index + 1 ? _args[index].trim() : '';
  String _opt(int index) => _opts.length >= index + 1 ? _opts[index].trim() : '';

  bool opt(String name) {
    for (var opt in _opts) {
      if (opt == name) {
        return true;
      }
    }

    return false;
  }

  String get arg1 => _arg(0);
  String get arg2 => _arg(1);
  String get arg3 => _arg(2);
  String get arg4 => _arg(3);
  String get arg5 => _arg(4);

  String get opt1 => _opt(0);
  String get opt2 => _opt(1);
  String get opt3 => _opt(2);
  String get opt4 => _opt(3);
  String get opt5 => _opt(4);
}