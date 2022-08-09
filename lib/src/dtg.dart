/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */
library src;

import 'dart:io';

part 'args.dart';
part 'cli.dart';
part 'print.dart';
part 'shell.dart';

final dg = _DTG._();

class _DTG {
  _DTG._();

  final print = _Print._();
  final sh = _Shell._();

  _CLI cli(List<String> arguments) => _CLI._(arguments);
}