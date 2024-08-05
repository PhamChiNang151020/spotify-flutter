import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:spotify/common/my_colors.dart';

class LoadingPopularRelease extends StatefulWidget {
  const LoadingPopularRelease({
    super.key,
  });

  @override
  State<LoadingPopularRelease> createState() => _LoadingPopularReleaseState();
}

class _LoadingPopularReleaseState extends State<LoadingPopularRelease> {
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
        Column(
          children: List.generate(
            5,
            (index) {
              return Container(
                padding: const EdgeInsets.all(4),
                child: Shimmer.fromColors(
                    baseColor: MyColors.baseColor,
                    highlightColor: MyColors.highlightColor,
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            decoration: _boxDecoration(),
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                              child: Container(
                            decoration: _boxDecoration(),
                          )),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.more_horiz,
                            color: Colors.amber,
                          )
                        ],
                      ),
                    )),
              );
            },
          ),
        ),
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
