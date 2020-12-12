import 'package:bloc/bloc.dart';
import 'package:bloc_jsonplaceholder_api/bloc/theme/theme_events.dart';
import 'package:bloc_jsonplaceholder_api/bloc/theme/theme_state.dart';
import '../../app_themes.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc()
      : super(
    ThemeState(themeData: AppThemes.appThemeData[AppTheme.lightTheme],),);

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        themeData: AppThemes.appThemeData[event.appTheme],
      );
    }
  }
}