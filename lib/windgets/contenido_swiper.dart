import 'package:app_museo_1/screens/rooms_screen.dart';
import 'package:flutter/material.dart';

class ContenidoSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        height: 200,
        color: Colors.black12,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text('Titulo de la puclicación',
                style: textTheme.headline4,
                overflow: TextOverflow.ellipsis,
                maxLines: 2),
            SizedBox(height: 5),
            Text(
                'Magna consectetur sint consequat proident ut aliquip deserunt Lorem consequat nostrud adipisicing consectetur ipsum. Sunt quis in et id laborum irure velit minim id. Exercitation aliqua officia sint qui reprehenderit esse ex id ullamco officia irure quis irure in.',
                overflow: TextOverflow.ellipsis,
                maxLines: 7),
          ],
        ),
      ),
    );
  }
}
