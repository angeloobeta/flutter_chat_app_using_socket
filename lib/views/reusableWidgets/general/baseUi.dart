import 'package:flutter_chat_app_using_socket/model/utilities/imports/generalImport.dart';

class BaseUi extends StatelessWidget {
  final List<Widget> children;
  final bool? allowBackButton;
  final bool? safeTop;
  final Function? onRefreshFunction;

  const BaseUi(
      {Key? key,
      this.allowBackButton,
      required this.children,
      this.safeTop,
      this.onRefreshFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return allowBackButton ?? true;
        },
        child: KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            // GestureType.onPanUpdateDownDirection
          ],
          child: RefreshIndicator(
            displacement: 100,
            backgroundColor: blue,
            color: white,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              if (onRefreshFunction != null) {
                return onRefreshFunction!();
              }
            },
            child: SafeArea(
              bottom: false,
              top: safeTop ?? false,
              child: Scaffold(
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: white,
                  child: Stack(
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
