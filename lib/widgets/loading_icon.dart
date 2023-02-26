import '../themes/theme_principal.dart';
import '../views/views.dart';

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      padding: EdgeInsets.all(15),
      width: 60,
      height: 60,
      child: CircularProgressIndicator(color: ThemePrincipal.primary,)
    );
  }
}
