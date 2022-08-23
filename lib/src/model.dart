/*
 * Copyright (c) 2022.
 * Created by Andy Pangaribuan. All Rights Reserved.
 *
 * This product is protected by copyright and distributed under
 * licenses restricting copying, distribution and decompilation.
 */

class BashResponse {
  String stdout;
  String stderr;
  int exitCode;

  BashResponse(this.stdout, this.stderr, this.exitCode);
}