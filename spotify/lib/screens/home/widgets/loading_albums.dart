import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/my_colors.dart';

class LoadingAlbum extends StatelessWidget {
  const LoadingAlbum({
    super.key,
    required this.itemWidth,
    required this.imageSize,
  });

  final double itemWidth;
  final double imageSize;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
        (index) {
          return Shimmer.fromColors(
            baseColor: MyColors.baseColor,
            highlightColor: MyColors.highlightColor,
            child: SizedBox(
              width: itemWidth,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      width: imageSize,
                      height: imageSize,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: imageSize,
                    child: Container(
                      width: imageSize,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
