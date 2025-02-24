// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'dart:io';
import 'package:flutter_svg/svg.dart';
import '../../utils/basic_screen_imports.dart';

class ImagePickerWidget extends StatelessWidget {
  final VoidCallback? onImagePick;
  final bool isImagePathSet;
  final bool isPicker;
  final String? imagePath;
  final String imageUrl;

  const ImagePickerWidget({
    super.key,
    this.onImagePick,
    this.isImagePathSet = false,
    this.imagePath,
    this.imageUrl = '',
    this.isPicker = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isTab() {
      return MediaQuery.sizeOf(context).shortestSide >= 650;
    }

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            border: Border.all(
              width: isTab() ? 2.5.w : 4.w,
              color: Theme.of(context).primaryColor,
            ),
            shape: BoxShape.circle,
          ),
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              border: Border.all(
                width: isTab() ? 3.4.w : 4.5.w,
                color: CustomColor.whiteColor,
              ),
              shape: BoxShape.circle,
            ),
            child: isImagePathSet
                ? CircleAvatar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    radius: isTab()
                        ? Dimensions.radius * 4
                        : Dimensions.radius * 6,
                    backgroundImage: FileImage(
                      File(imagePath!),
                    ),
                  )
                : imageUrl != ''
                    ? CircleAvatar(
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        radius: isTab()
                            ? Dimensions.radius * 4
                            : Dimensions.radius * 6,
                        backgroundImage: NetworkImage(imageUrl),
                      )
                    : const ShimmerCircle(),
          ),
        ),
        Positioned(
          bottom: 30,
          right: isTab() ? 0 : 111,
          child: InkWell(
            onTap: onImagePick,
            child: Visibility(
              visible: isPicker,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color:CustomColor.whiteColor,
                  border: Border.all(
                    width: 2.w,
                   color: CustomColor.whiteColor,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  foregroundColor: CustomColor.whiteColor,
                  radius:isTab()? Dimensions.radius * 1.1:Dimensions.radius*1.2,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: SvgPicture.asset(
                    Assets.icon.biCameraFill,
                    color: CustomColor.whiteColor,
                    height: Dimensions.iconSizeDefault,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShimmerCircle extends StatefulWidget {
  const ShimmerCircle({super.key});

  @override
  _ShimmerCircleState createState() => _ShimmerCircleState();
}

class _ShimmerCircleState extends State<ShimmerCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ShimmerCirclePainter(animation: _animationController),
      child: SizedBox(
        /// >>> set static for fixed size
        width: 120.0.w,
        height: 120.0.h,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class ShimmerCirclePainter extends CustomPainter {
  final Animation<double> animation;

  ShimmerCirclePainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.shader = _createGradientShader(size, animation.value);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Shader _createGradientShader(Size size, double animationValue) {
    final List<Color> colors = [
      Colors.transparent,
      Colors.white.withValues(alpha:0.5),
      Colors.transparent,
    ];

    final stops = [0.0, 0.5, 1.0];

    // Move the gradient horizontally based on the animation value
    final double dx = size.width * animationValue - size.width;
    const double dy = 0;

    return LinearGradient(
      begin: const Alignment(-1.0, 0.0),
      end: const Alignment(2.0, 0.0),
      colors: colors,
      stops: stops,
      tileMode: TileMode.mirror,
    ).createShader(Rect.fromLTWH(dx, dy, size.width, size.height));
  }
}
