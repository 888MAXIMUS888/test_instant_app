part of 'link_bloc.dart';

abstract class LinkState extends Equatable {
  const LinkState();

  @override
  List<Object> get props => [];
}

class LinkInitial extends LinkState {
  const LinkInitial();
}

class GetNextLinkState extends LinkState {
  final String link;

  const GetNextLinkState(this.link);

  @override
  List<Object> get props => [link];
}
