import 'package:dex_calculator/core/theme/app_theme.dart';
import 'package:dex_calculator/features/ui/pages/calculator_page.dart';
import 'package:flutter/material.dart';



/** 
 * @summary: Classe principal do aplicativo, responsável por iniciar a aplicação e definir a estrutura básica da interface do usuário.
 * 
 * @note StatelessWidget é um widget que não possui estado mutável, portanto não mantém estado interno. Ele é reconstruído apenas quando as suas propriedades são alteradas. O que gera uma interface mais simples e eficiente.
 *  */ 
class AppWidget extends StatelessWidget{
  const AppWidget({super.key}); // Construtor da classe, recebe uma chave opcional para identificar o widget na árvore de widgets.


  /**
   * @summary: Método build é responsável por construir a interface do usuário do widget. Ele é chamado sempre que o widget precisa ser reconstruído, e deve retornar um widget que representa a interface do usuário.
   */
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dex Calculator',
      theme: AppTheme.darkTheme,
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}