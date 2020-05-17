import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:hive/hive.dart';
import '../../themes/my_themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeInitial();
  final _box = Hive.box('theme');
  @override
  Stream<ThemeState> mapEventToState(
    ThemeEvent event,
  ) async* {
    if (event is ChangeThemeEvent) {
      if (_box.getAt(0)==1)
        _box.putAt(0, 0);
      else
        _box.putAt(0, 1);
      yield ThemeChangeState();
    }
  }
}
