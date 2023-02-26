import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool loading;
  final bool active;
  final String text;
  final bool custom;
  final double? textSize;
  final double width;
  final double height;
  final Color? color;

  const DefaultButton({
    Key? key,
    required this.text,
    this.textSize,
    this.loading = false,
    this.active = true,
    this.width = double.infinity,
    this.height = 36,
    required this.onTap,
    this.color,
    this.custom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(7)),
        child: ElevatedButton(
          onPressed: active ? onTap : null,
          // style: ButtonStyle(
          //   // elevation:
          //   //     elevation != null ? MaterialStateProperty.all(elevation) : null,
          //   // shape: isOutlined
          //   //     ? MaterialStateProperty.all(
          //   //         RoundedRectangleBorder(
          //   //           borderRadius: BorderRadius.circular(5),
          //   //           side: BorderSide(
          //   //             width: 2,
          //   //             color: color ?? AppColors.primary,
          //   //           ),
          //   //         ),
          //   //       )
          //   //     : null,
          //
          //   // backgroundColor: MaterialStateProperty.all(
          //   //     const Color(0XFFAC2E2E),
          //   // ),
          // ),
          child: Center(
            child:Text(
                        text,
                        style: context.textTheme.headline6!.copyWith(
                          color: Colors.white,
                          fontSize: textSize ?? 20,
                          // fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
          ),
        ),
      ),
    );
  }
}
