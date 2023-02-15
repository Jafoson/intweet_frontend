import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IconStyle {
  final double size;
  final Color? color;
  final String? semanticLabel;
  final List<Shadow>? shadows;
  final TextDirection? textDirection;

  IconStyle(
      {this.size = 24,
      this.color,
      this.semanticLabel,
      this.shadows,
      this.textDirection});
}

class CostumIconData {
  final IconData? icon;
  final IconStyle? style;

  CostumIconData({
    this.icon,
    this.style,
  });
}

class PrimaryButton extends StatefulWidget {
  final Alignment alignment;
  final MainAxisAlignment rowAxisAlignment;
  final MainAxisAlignment collumnAxisAligment;
  final double? height;
  final double? width;
  final void Function() onPressed;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final CostumIconData? topIcon;
  final CostumIconData? prefixIcon;
  final Widget? label;
  final bool active;

  const PrimaryButton(
      {super.key,
      required this.onPressed,
      this.height,
      this.active = true,
      this.prefixIcon,
      this.margin = EdgeInsets.zero,
      this.topIcon,
      this.padding =
          const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 16),
      this.label,
      this.collumnAxisAligment = MainAxisAlignment.center,
      this.rowAxisAlignment = MainAxisAlignment.start,
      this.alignment = Alignment.center,
      this.width});
  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _isHighlighted = false;

  void _onHighlightChanged(bool isHighlighted) {
    setState(() {
      _isHighlighted = isHighlighted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin,
      child: Align(
          alignment: widget.alignment,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onHighlightChanged: _onHighlightChanged,
            enableFeedback: widget.active,
            onTap: widget.active ? widget.onPressed : () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: widget.active
                    ? _isHighlighted
                        ? Colors.grey[400]
                        : const Color(0xff4A9387)
                    : Colors.grey[700],
              ),
              height: widget.height,
              padding: widget.padding,
              // width: null,
              child: Column(
                  mainAxisAlignment: widget.collumnAxisAligment,
                  children: [
                    widget.topIcon != null
                        ? Icon(
                            widget.topIcon?.icon,
                            size: widget.topIcon?.style?.size,
                            color: widget.topIcon?.style?.color,
                            semanticLabel: widget.topIcon?.style?.semanticLabel,
                            shadows: widget.topIcon?.style?.shadows,
                            textDirection: widget.topIcon?.style?.textDirection,
                          )
                        : Container(
                            width: 0,
                          ),
                    Row(
                      mainAxisAlignment: widget.rowAxisAlignment,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.prefixIcon != null
                            ? Icon(
                                widget.prefixIcon?.icon,
                                size: widget.prefixIcon?.style?.size,
                                color: widget.prefixIcon?.style?.color,
                                semanticLabel:
                                    widget.prefixIcon?.style?.semanticLabel,
                                shadows: widget.prefixIcon?.style?.shadows,
                                textDirection:
                                    widget.prefixIcon?.style?.textDirection,
                              )
                            : Container(
                                width: 0,
                              ),
                        widget.label != null
                            ? Expanded(child: widget.label!)
                            : Container(
                                width: 0,
                              )
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}
