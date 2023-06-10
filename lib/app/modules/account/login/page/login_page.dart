import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../designer_system/button/button.dart';
import '../../../../designer_system/fieldComp/fieldComp.dart';
import '../../../../designer_system/new/styles/colors/colors.dart';
import '../../../../designer_system/new/styles/texts/heading_texts.dart';
import '../../../../designer_system/new/widgets/logo.dart';
import 'package:provider/provider.dart';
import '../login_view_model.dart';

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  bool isHelp = false;

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Image.network(
              'https://cdn.mindminers.com/blog/uploads/2022/11/pets.png',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.pets,
                                      color: Colors.black54,
                                      size: 35,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      'Central Pets',
                                      style: GoogleFonts.fredoka(
                                        letterSpacing: 1.1,
                                        color: Colors.black87,
                                        fontSize: 35,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(
                            controller: emailController,
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            marginButton: 16.0,
                            onChanged: (value) =>
                                viewModel.setCredentialsEmail(value),
                            validator: (value) => viewModel.emailIsValid(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          CustomTextField(
                            controller: passwordController,
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock),
                            obscureText: ValueNotifier<bool>(true),
                            marginButton: 16.0,
                            onChanged: (value) =>
                                viewModel.setCredentialsPassword(value),
                            validator: (value) => viewModel.passwordIsValid(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.fastEaseInToSlowEaseOut,
                        decoration: BoxDecoration(
                          color: Colors.amber.withAlpha(230),
                          borderRadius: BorderRadius.circular(isHelp?20:8),
                        ),
                        height: isHelp ? 200 : 0,
                        width: isHelp ? MediaQuery.of(context).size.width * 0.8 : 0,
              ),
                     DialogAnimation(expanded: isHelp),
                  ],
                ),
            )),
            GestureDetector(
              onTap: () {
                setState(() {
                  isHelp = !isHelp;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedAlign(
                  alignment: isHelp?const Alignment(0,-0.4):Alignment.topLeft,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withAlpha(65),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        isHelp?Icons.clear:Icons.help_outline,
                        color: Colors.white.withAlpha(190),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(32.0),
          child: CustomButton(
            states: (
              isLoading: viewModel.isLoading,
              isLock: viewModel.buttonIsLock,
            ),
            onPressed: () => viewModel.login(context),
          ),
        ),
      ),
    );
  }
}


class DialogAnimation extends StatefulWidget {
  const DialogAnimation({Key? key,required this.expanded}) : super(key: key);
  final bool expanded;
  @override
  State<DialogAnimation> createState() => _DialogAnimationState();
}

class _DialogAnimationState extends State<DialogAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(!widget.expanded){
      animationController.reset();
    }else{
      animationController.forward();
    }

    return Container(
      height:200 ,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Stack(
        children: [
          FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Curves.ease,
              ),
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.2),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: animationController,
                  curve: Curves.ease,
                ),
              ),
              child:  Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Bem vindo ao Central Pets',
                        style: GoogleFonts.fredoka(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Este app é um projeto de estudo, e não tem nenhuma relação com nenhuma empresa ou pessoa.',
                        style: GoogleFonts.fredoka(
                          color: Colors.black87,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
