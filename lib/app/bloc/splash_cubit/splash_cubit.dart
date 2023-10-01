import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../api/repo/api_repo.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(
          SplashIdle(),
        );

  Future<void> triggerSplash() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );

    emit(
      SplashCompleted(),
    );
  }

}
