import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Tela de Meu Perfil renderiza todos os elementos corretamente', (
    WidgetTester tester,
  ) async {
    // Constrói a aplicação
    await tester.pumpWidget(const MyApp());

    // 1. Verifica AppBar com o título "Meu Perfil"
    expect(find.text('Meu Perfil'), findsOneWidget);

    // 2. Verifica foto de perfil no centro (CircleAvatar)
    expect(find.byType(CircleAvatar), findsWidgets);

    // 3. Verifica nome do usuário "Maria Silva" em destaque
    expect(find.text('Maria Silva'), findsOneWidget);

    // 4. Verifica informações de contato
    // Linha 1: ícone de email + texto maria@email.com
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.text('teste@email.com'), findsOneWidget);

    // Linha 2: ícone de telefone + texto "(64) 99150-1980"
    expect(find.byIcon(Icons.phone), findsOneWidget);
    expect(find.text('(64) 99150-1980'), findsOneWidget);

    // 5. Verifica botão azul escrito "Seguir"
    final botaoSeguir = find.widgetWithText(ElevatedButton, 'Seguir');
    expect(botaoSeguir, findsOneWidget);

    // 6. Ao clicar no botão, deve aparecer um SnackBar com a mensagem "Você agora segue este perfil!"
    await tester.tap(botaoSeguir);
    await tester.pump(); // Inicia animação do SnackBar

    expect(find.text('Você agora segue este perfil!'), findsOneWidget);
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
