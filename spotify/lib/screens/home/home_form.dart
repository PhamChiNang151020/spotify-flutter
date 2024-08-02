import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:spotify/base_class/bloc/base_bloc_form_state_full.dart';
import 'package:spotify/base_class/bloc/base_state.dart';

import 'package:flutter/material.dart';
import 'package:spotify/common/my_assets.dart';
import 'package:spotify/screens/artists_detail/artists_detail.dart';

import 'package:spotify/utils/utils.dart';
import 'package:spotify/widgets/svg_png/widget_icon.dart';
import 'package:spotify/widgets/svg_png/widget_svg.dart';
import '../../data/data.dart';
import 'package:shimmer/shimmer.dart';
import 'home.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends BaseBLocFormStateFull<HomeBloc, HomeForm> {
  List<ItemSpotify> listAlbum = [];
  List<Artist> listArtist = [];
  List<Show> listShow = [];
  double imageSize = 140;
  double itemWidth = 160;

  bool isLoadingAlbum = true;
  bool isLoadingArtist = true;
  bool isLoadingShow = true;

  @override
  Widget getWidget(BuildContext context, BaseBlocState state) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: getPaddingSafeArea(context).top,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const SvgWidget(assetName: MyAssets.icSetting),
                ),
              ],
            ),
          ),
          Expanded(
              child: RefreshIndicator(
            onRefresh: () async {
              getBloc().add(HomeRefreshEvent());
              setState(() {
                isLoadingAlbum = true;
                isLoadingArtist = true;
                isLoadingShow = true;
              });
            },
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _renderList(
                  title: "New Releases",
                  child: _listNewAlbumRelease(),
                ),
                _renderList(
                  title: "Artists",
                  child: _listArtist(),
                ),
                _renderList(
                  title: "Popular Shows",
                  child: _listSeveralShow(),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  @override
  void listener(BuildContext context, BaseBlocState state) {
    if (state is HomeLoadSuccess) {
      setState(() {
        listAlbum = state.listAlbum ?? [];
        listArtist = state.listArtist ?? [];
        listShow = state.listShow ?? [];
        isLoadingAlbum = state.isLoadingAlbum;
        isLoadingArtist = state.isLoadingArtist;
        isLoadingShow = state.isLoadingShow;
      });
    }
  }

  Widget _renderList({
    required String title,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 165, child: child),
        ],
      ),
    );
  }

  Widget _listNewAlbumRelease() {
    return isLoadingAlbum
        ? LoadingAlbum(itemWidth: itemWidth, imageSize: imageSize)
        : ListView.builder(
            padding: const EdgeInsets.only(top: 5),
            itemCount: listAlbum.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = listAlbum[index];
              return SizedBox(
                width: itemWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        item.images.first.url,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: imageSize,
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        style: _stylesSubTitle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  Widget _listArtist() {
    return isLoadingArtist
        ? LoadingArtists(itemWidth: itemWidth, imageSize: imageSize)
        : ListView.builder(
            itemCount: listArtist.length,
            padding: const EdgeInsets.only(top: 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = listArtist[index];

              return GestureDetector(
                onTap: () {
                  gotoArtistsDetailPage(context: context, artist: item);
                },
                child: SizedBox(
                  width: itemWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(70),
                        child: Image.network(
                          item.images!.first.url,
                          width: imageSize,
                          height: imageSize,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: imageSize,
                        child: Text(
                          item.name ?? "",
                          overflow: TextOverflow.ellipsis,
                          style: _stylesSubTitle(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }

  Widget _listSeveralShow() {
    return isLoadingShow
        ? LoadingShow(itemWidth: itemWidth, imageSize: imageSize)
        : ListView.builder(
            itemCount: listShow.length,
            padding: const EdgeInsets.only(top: 5),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final item = listShow[index];

              return SizedBox(
                width: itemWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        item.images.first.url,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: imageSize,
                      child: Text(
                        item.name,
                        overflow: TextOverflow.ellipsis,
                        style: _stylesSubTitle(),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
  }

  TextStyle _stylesSubTitle() {
    return const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  }
}
