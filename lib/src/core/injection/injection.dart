import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
configureDependencies() => locator.init();
