import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/my_colors.dart';

class LoadingAlbums extends StatefulWidget {
  const LoadingAlbums({
    super.key,
  });

  @override
  State<LoadingAlbums> createState() => _LoadingAlbumsState();
}

class _LoadingAlbumsState extends State<LoadingAlbums> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
            baseColor: MyColors.baseColor,
            highlightColor: MyColors.highlightColor,
            child: Container(
              margin: const EdgeInsets.only(left: 4, bottom: 5, top: 5),
              height: 15,
              width: 200,
              decoration: _boxDecoration(),
            )),
        SizedBox(
          height: 170,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              5,
              (index) {
                return Shimmer.fromColors(
                  baseColor: MyColors.baseColor,
                  highlightColor: MyColors.highlightColor,
                  child: Container(
                    margin: const EdgeInsets.all(5.0),
                    height: 165,
                    width: 140,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: _boxDecoration(),
                        ),
                        Container(
                          width: 140,
                          height: 15,
                          decoration: _boxDecoration(),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  BoxDecoration _boxDecoration() {
    return const BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
