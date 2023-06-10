import 'package:event_driver_arch/app/designer_system/texts/text_bold.dart';
import 'package:flutter/material.dart';

class ProductCount extends StatefulWidget {
  const ProductCount({
    Key? key,
    required this.right,
    required this.left,
    this.outSideTopRight,
  }) : super(key: key);
  final String left;
  final String right;
  final String? outSideTopRight;

  @override
  State<ProductCount> createState() => _ProductCountState();
}

class _ProductCountState extends State<ProductCount> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.elasticInOut,
      ),
    );
  //  _startScaleAnimation();
  }
  void _startScaleAnimation() {
    _animationController.reset();
    _animationController.forward();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextBold(
              fontSize: 16,
              widget.outSideTopRight??'',
            ),
          ),
          SizedBox(
            height: 80,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _text(widget.left),
                    Column(
                      children: [
                        Expanded(
                          child: Container(
                            width: 2,
                            color: Colors.black12,
                          ),
                        )
                      ],
                    ),
                    _text(widget.right),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _text(String text) {
    return TextBold(
      fontSize: 16,
      text,
    );
  }
}
