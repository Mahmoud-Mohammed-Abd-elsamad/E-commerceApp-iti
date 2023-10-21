import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/utils/observer.dart';
import 'package:flutter/material.dart';

import 'core/utils/cach_helper.dart';
import 'my_app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  runApp(const MyApp());
}

