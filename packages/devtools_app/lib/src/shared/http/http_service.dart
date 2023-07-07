// Copyright 2020 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../service/service_extension_manager.dart';
import '../../service/service_extensions.dart' as extensions;
import '../globals.dart';
import '../primitives/utils.dart';

/// Enables or disables HTTP logging for all isolates.
Future<void> toggleHttpRequestLogging(bool state) async {
  await serviceManager.service!.forEachIsolate((isolate) async {
    final httpLoggingAvailable = await serviceManager.service!
        .isHttpTimelineLoggingAvailable(isolate.id!);
    if (httpLoggingAvailable) {
      final future = serviceManager.service!.httpEnableTimelineLogging(
        isolate.id!,
        state,
      );
      // The above call won't complete immediately if the isolate is paused, so
      // give up waiting after 500ms. However, the call will complete eventually
      // if the isolate is eventually resumed.
      // TODO(jacobr): detect whether the isolate is paused using the vm
      // service and handle this case gracefully rather than timing out.
      await timeout(future, 500);
    }
  });
}

bool get httpLoggingEnabled => httpLoggingState.value.enabled;

ValueListenable<ServiceExtensionState> get httpLoggingState =>
    serviceManager.serviceExtensionManager.getServiceExtensionState(
      extensions.httpEnableTimelineLogging.extension,
    );
