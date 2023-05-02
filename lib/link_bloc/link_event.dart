part of 'link_bloc.dart';

abstract class LinkEvent extends Equatable {
  const LinkEvent();

  @override
  List<Object> get props => [];
}

class GetNextLinkEvent extends LinkEvent {
  const GetNextLinkEvent();
}
