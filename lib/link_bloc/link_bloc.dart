import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../constants.dart';

part 'link_event.dart';
part 'link_state.dart';

class LinkBloc extends Bloc<LinkEvent, LinkState> {
  final List<String> _links = [amazonLink, youtubeLink, spiegelLink];
  int currentIndex = -1;
  LinkBloc() : super(const LinkInitial()) {
    on<LinkEvent>((event, emit) {
      if (event is GetNextLinkEvent) {
        currentIndex++;
        if (currentIndex == _links.length) {
          currentIndex = 0;
        }
        emit(GetNextLinkState(_links[currentIndex]));
      }
    });
  }
}
