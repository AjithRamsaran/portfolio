import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/utils.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 400),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SocialMediaItem(
                assetPath: 'assets/icons/email.svg',
                hoverText: 'Email',
                onPressed: () {
                  openEmail();
                },
              ),
              SizedBox(
                width: 10,
              ),
              SocialMediaItem(
                assetPath: 'assets/icons/github.svg',
                hoverText: 'Github',
                onPressed: () {
                  openUrl("https://github.com/AjithRamsaran");
                },
              ),
              SizedBox(
                width: 10,
              ),
              SocialMediaItem(
                assetPath: 'assets/icons/linkedin.svg',
                hoverText: 'Linkedin',
                onPressed: () {
                  openUrl("https://www.linkedin.com/in/ajithramsaran/");
                },
              ),
              SizedBox(
                width: 10,
              ),
              SocialMediaItem(
                assetPath: 'assets/icons/twitter.svg',
                hoverText: 'Twitter',
                onPressed: () {
                  openUrl("https://x.com/ajith_ramsaran");
                },
              ),
            ],
          ),
          //copy right text
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              '© 2025 Ajith Ramsaran. All rights reserved.',
              style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(148, 163, 184, 1),
                  fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}


typedef OnPressed = void Function();


class SocialMediaItem extends StatefulWidget {
  SocialMediaItem({
    super.key,
    required this.assetPath,
    this.hoverText,
    this.onPressed,
  });

  String? assetPath;
  String? hoverText;
  OnPressed? onPressed;

  @override
  State<SocialMediaItem> createState() => _SocialMediaItemState();
}

class _SocialMediaItemState extends State<SocialMediaItem> {
  bool _highlighted = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _highlighted = true;
        });
      },
      onExit: (event) {
        setState(() {
          _highlighted = false;
        });
      },
      child: Tooltip(
        message: widget.hoverText ?? '',
        triggerMode: TooltipTriggerMode.tap,
        child: GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (details) {
            setState(() {
              _highlighted = true;
            });
          },
          onTapUp: (details) {
            setState(() {
              _highlighted = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _highlighted = false;
            });
          },
          child: SvgPicture.asset(
            widget.assetPath ?? "",
            width: 30,
            height: 30,
            color:
            _highlighted ? Colors.black : Color.fromRGBO(148, 163, 184, 1),
          ),
        ),
      ),
    );
  }
}
