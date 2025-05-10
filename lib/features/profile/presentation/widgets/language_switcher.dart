import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:project_z/app/app.dart';
import 'package:project_z/shared/consts/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool _showPopup = false;
  late String _currentLoc;
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    _currentLoc = AppLocalizations.delegate.type.toString();
    Logger().i(_currentLoc.toString());
    super.initState();
  }

  Future<void> _change(String loc) async {
    setState(() {
      _showPopup = false;
    });
    await ChangeLocalizationFunction.body(context, (loc == 'Ру') ? Localization.ru : Localization.uz);
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + 35,
        child: Material(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            width: 75,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                    onTap: () => _change('Ру'),
                    child: const Text('Ру')
                ),
                const Divider(height: 1,),
                GestureDetector(
                    onTap: () => _change('Uz'),
                    child: const Text('Uz')
                )
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showPopup = !_showPopup;
          if (_showPopup) {
            _showOverlay();
          } else {
            _hideOverlay();
          }
        });
      },
      child: Container(
        height: 30,
        width: 75,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromRGBO(16, 53, 91, 1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        padding: const EdgeInsets.only(top: 3, bottom: 3, left: 3, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset('assets/icons/local.svg', height: 25),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.locale,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: mainColor,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset('assets/search/arrow_down.svg', height: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}