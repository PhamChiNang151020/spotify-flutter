import 'package:spotify/base_class/bloc/base_event.dart';
import 'package:spotify/data/data.dart';

class GetArtistsDetailEvent extends BaseBlocEvent {
  final Artist artists;
  GetArtistsDetailEvent({
    required this.artists,
  });
}
