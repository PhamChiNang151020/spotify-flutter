import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_full_app_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/common/my_assets.dart';
import 'package:spotify/common/my_colors.dart';
import 'package:spotify/data/data.dart';
import 'package:spotify/screens/artists_detail/widgets/albums_loading.dart';
import 'package:spotify/screens/artists_detail/widgets/popular_release_loading.dart';
import 'package:spotify/utils/utils.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';
import 'artists_detail.dart';

class ArtistsDetailForm extends StatefulWidget {
  const ArtistsDetailForm({super.key});

  @override
  State<ArtistsDetailForm> createState() => _ArtistsDetailFormState();
}

class _ArtistsDetailFormState
    extends BaseBLocFormStateFull<ArtistsDetailBloc, ArtistsDetailForm> {
  List<ArtistsAlbums> listArtistAlbums = [];
  List<Track> listPopularTracks = [];
  List<Artist> listRelatedArtists = [];
  Artist artist = Artist();

  final ScrollController _scrollController = ScrollController();
  double _opacity = 1.0;
  double _heightFactor = 0.45;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    double newOpacity = (1 - (offset / 100)).clamp(0.0, 1.0);
    double newHeightFactor = (0.45 - (offset / 555)).clamp(0.0, 0.35);

    assert(
        newOpacity >= 0 && newOpacity <= 1, 'Opacity must be between 0 and 1');
    assert(newHeightFactor >= 0 && newHeightFactor <= 0.35,
        'Height factor must be between 0 and 0.35');

    setState(() {
      _opacity = newOpacity;
      _heightFactor = newHeightFactor;
    });
  }

  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    double calculatedPadding =
        (MediaQuery.of(context).size.height * _heightFactor) -
            getPaddingSafeArea(context).top;
    double safePadding =
        calculatedPadding.clamp(0.0, MediaQuery.of(context).size.height);

    return Stack(
      children: [
        AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(milliseconds: 500),
          child: Container(
            color: Colors.amber,
            height: MediaQuery.of(context).size.height * _heightFactor,
            width: double.infinity,
            child: isLoading == true ? _isLoading() : _posterArtist(),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: safePadding,
          ),
          child: ListView(
            controller: _scrollController,
            children: [
              // * INFO

              isLoading
                  ? Container()
                  : Row(
                      children: [
                        const WidgetIcon(
                          pathIcon: MyAssets.icFollower,
                          size: 25,
                        ),
                        const SizedBox(width: 5),
                        Text(
                            "${_formatFollowers(artist.followers!.total!)} followers"),
                      ],
                    ),

              _listPopularTracks(),
              _listAlbums(),
              _listRelatedArtists(),
            ],
          ),
        ),
        Positioned(
          top: -10,
          left: 0,
          right: 0,
          child: AppBar(
            backgroundColor: _opacity == 0 ? Colors.black : Colors.transparent,
            centerTitle: true,
            title: _opacity == 0 ? Text(artist.name ?? "") : null,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: _opacity == 0 ? Colors.white : Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _listAlbums() {
    return isLoading
        ? const LoadingAlbums()
        : Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Albums",
                  style: _styleTitle(),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listArtistAlbums.length,
                    itemBuilder: (context, index) {
                      final itemAlbums = listArtistAlbums[index];
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      itemAlbums.images.first.url,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                itemAlbums.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 13,
                                ),
                                maxLines: 2,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget _listRelatedArtists() {
    return isLoading
        ? const LoadingAlbums()
        : Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fans also like",
                  style: _styleTitle(),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listRelatedArtists.length,
                    itemBuilder: (context, index) {
                      final itemRelated = listRelatedArtists[index];
                      return GestureDetector(
                        onTap: () {
                          getBloc().add(
                              RefreshArtistsDetailEvent(artists: itemRelated));
                          setState(() {
                            isLoading = true;
                          });
                          _scrollToTop();
                        },
                        child: Container(
                          width: 150,
                          margin: const EdgeInsets.all(5.0),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        itemRelated.images!.first.url,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  itemRelated.name ?? "",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: 13,
                                  ),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }

  Widget _listPopularTracks() {
    return isLoading
        ? const LoadingPopularRelease()
        : Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Popular releases",
                  style: _styleTitle(),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: listPopularTracks.length,
                  itemBuilder: (context, index) {
                    final item = listPopularTracks[index];
                    return Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(item.album.images.first.url),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.name,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(item.type),
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {},
                              icon:
                                  const SvgWidget(assetName: MyAssets.icMore)),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          );
  }

  TextStyle _styleTitle() =>
      const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

  Stack _posterArtist() {
    return Stack(
      children: [
        Image.network(
          artist.images!.first.url,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 5,
          child: Text(
            artist.name ?? "",
            style: const TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Color.fromARGB(255, 142, 142, 142),
                    offset: Offset(0, 0),
                    blurRadius: 123,
                  )
                ]),
          ),
        )
      ],
    );
  }

  Center _isLoading() {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Shimmer.fromColors(
          baseColor: MyColors.baseColor,
          highlightColor: MyColors.highlightColor,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is ArtistsDetailLoadSuccess) {
      setState(() {
        listPopularTracks = state.listPopularTracks;
        listArtistAlbums = state.listArtistAlbums;
        listRelatedArtists = state.listRelatedArtists;
        isLoading = state.isLoading;
        artist = state.artist;
      });
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  String _formatFollowers(int total) {
    final formatter = NumberFormat("#,###");

    return formatter.format(total).toString();
  }
}
