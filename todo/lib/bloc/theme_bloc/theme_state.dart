part of 'theme_bloc.dart';

abstract class ThemeState {
  var themedata; 
  var themetype;
  ThemeState(this.themedata,this.themetype);
}

ThemeData get getTheme{
final _box=Hive.box('theme');
      if(_box.isEmpty)
      _box.add(1);
      int themeNumber=_box.getAt(0);
      var theme;
      switch (themeNumber) {
        case 0:
          theme=myThemes[THEMES.DARKTHEME];
          break;
        case 1:
          theme=myThemes[THEMES.PRIMARYTHEME];
          break;
      }
      print('initial theme');
      print(theme);
      return theme;
}
int get getThemeType{
  return Hive.box('theme').getAt(0);
}

class ThemeInitial extends ThemeState {
  ThemeInitial():super(getTheme,getThemeType);
}

class ThemeChangeState extends ThemeState{
  
  ThemeChangeState():super(getTheme,getThemeType);
}
