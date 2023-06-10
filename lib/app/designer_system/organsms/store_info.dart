import 'package:flutter/material.dart';

class StoreInfo extends StatefulWidget {
  const StoreInfo({Key? key, required this.expanded}) : super(key: key);
  final bool expanded;

  @override
  State<StoreInfo> createState() => _StoreInfoState();
}

class _StoreInfoState extends State<StoreInfo> with TickerProviderStateMixin{
  late Animation<double> _animation;
  late AnimationController _animationController;
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: widget.expanded?0:1, end: widget.expanded?1:0).animate(
      CurvedAnimation(
        parent:_animationController,
        curve: Curves.ease,
      ),
    );
    Future.delayed(const Duration(milliseconds: 300), () {
      if(widget.expanded){
        _animationController.reset();
        _animationController.forward();
      }else{
        _animationController.reset();
        _animationController.reverse();
        _animationController.forward();
      }
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticInOut,
          style: TextStyle(
            color: Colors.black,
            fontSize: widget.expanded ? 20 : 13,
            fontFamily: "Inter",
            fontWeight: widget.expanded ? FontWeight.w700 : FontWeight.w400,
          ),
          child: const Text(
            'Store Name',
          ),
        ),
        Wrap(
          spacing: 10,
          children: [
            Text(
              '3km',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 13,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              'Gratis',
              style: TextStyle(
                color: Colors.green,
                fontSize: 13,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
            const Text(
              '4,75',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
                fontFamily: "Inter",
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),

        AnimatedBuilder(
          animation: CurvedAnimation(
            parent: _animation,
            curve: Curves.elasticInOut,
          ),
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: SizedBox(
                width: 150*_animation.value,
                height: 100*_animation.value,
                child: Text.rich(
                  overflow: TextOverflow.ellipsis,
                  maxLines:5 ,
                  TextSpan(
                    text: 'Produtos e serviços para atender a todas as necessidades do seu pet. ',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: 'ver mais',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                        onEnter: (event) {
                          // Adicione aqui uma função para tratar o evento de passar o mouse
                        },
                        // Adicione aqui uma função para tratar o evento de clique no "ver mais"
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
