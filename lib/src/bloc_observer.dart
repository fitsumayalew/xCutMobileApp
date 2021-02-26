
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocObserverClass extends BlocObserver {
    void onEvent(Bloc bloc, Object event) {
      super.onEvent(bloc, event);
    }

    onTransition(Bloc bloc, Transition transition) {
      super.onTransition(bloc, transition);
    }

    void onError(Cubit cubit, Object error, StackTrace stackTrace) {
      super.onError(cubit, error, stackTrace);
    }
}