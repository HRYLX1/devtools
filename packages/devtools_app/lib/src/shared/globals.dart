// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:devtools_app_shared/utils.dart';

import '../extensions/extension_service.dart';
import '../screens/debugger/breakpoint_manager.dart';
import '../service/service_manager.dart';
import '../shared/banner_messages.dart';
import '../shared/notifications.dart';
import 'console/eval/eval_service.dart';
import 'environment_parameters/environment_parameters_base.dart';
import 'framework_controller.dart';
import 'offline_mode.dart';
import 'preferences.dart';
import 'primitives/message_bus.dart';
import 'primitives/storage.dart';
import 'scripts/script_manager.dart';
import 'survey.dart';

/// Whether this DevTools build is external.
bool get isExternalBuild => _isExternalBuild;
bool _isExternalBuild = true;
void setInternalBuild() => _isExternalBuild = false;

ServiceConnectionManager get serviceConnection =>
    globals[ServiceConnectionManager] as ServiceConnectionManager;

ScriptManager get scriptManager => globals[ScriptManager] as ScriptManager;

MessageBus get messageBus => globals[MessageBus] as MessageBus;

FrameworkController get frameworkController =>
    globals[FrameworkController] as FrameworkController;

Storage get storage => globals[Storage] as Storage;

SurveyService get surveyService => globals[SurveyService] as SurveyService;

PreferencesController get preferences =>
    globals[PreferencesController] as PreferencesController;

DevToolsEnvironmentParameters get devToolsExtensionPoints =>
    globals[DevToolsEnvironmentParameters] as DevToolsEnvironmentParameters;

OfflineModeController get offlineController =>
    globals[OfflineModeController] as OfflineModeController;

NotificationService get notificationService =>
    globals[NotificationService] as NotificationService;

BannerMessagesController get bannerMessages =>
    globals[BannerMessagesController] as BannerMessagesController;

BreakpointManager get breakpointManager =>
    globals[BreakpointManager] as BreakpointManager;

EvalService get evalService => globals[EvalService] as EvalService;

ExtensionService get extensionService =>
    globals[ExtensionService] as ExtensionService;

/// Whether DevTools is being run in integration test mode.
bool get integrationTestMode => _integrationTestMode;
bool _integrationTestMode = false;
void setIntegrationTestMode() {
  _integrationTestMode = true;
}
