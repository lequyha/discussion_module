import 'package:core_module/di/injection.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@InjectableInit()
void configureDiscussionModuleDependencies() => getIt.init();
