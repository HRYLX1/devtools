// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:logging/logging.dart';

import 'logger.dart';

final _log = Logger('main_log');

void log(Object message, [LogLevel level = LogLevel.debug]) {
  switch (level) {
    case LogLevel.debug:
      print(message);
      _log.info(message);
      break;
    case LogLevel.warning:
      print('[WARNING]: $message');
      _log.warning(message);
      break;
    case LogLevel.error:
      print('[ERROR]: $message');
      _log.shout(message);
  }
}
