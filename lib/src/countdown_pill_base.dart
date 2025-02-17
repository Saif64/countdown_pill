import 'dart:async';

import 'package:flutter/material.dart';

import 'date_formatter.dart';

class CountdownPill extends StatefulWidget {
  final DateTime targetDate;
  final String format;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxShadow? boxShadow;
  final Border? border;
  final Gradient? gradient;
  final Duration animationDuration;
  final bool animate;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final double? textScaleFactor;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;

  const CountdownPill({
    required this.targetDate,
    this.format = '{d} days {H} hours {M} minutes {S} seconds',
    this.textStyle,
    this.backgroundColor,
    this.borderRadius,
    this.padding,
    this.margin,
    this.boxShadow,
    this.border,
    this.gradient,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animate = false,
    this.textAlign = TextAlign.center,
    this.textOverflow = TextOverflow.ellipsis,
    this.maxLines,
    this.textScaleFactor,
    this.width,
    this.height,
    this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  _CountdownPillState createState() => _CountdownPillState();
}

class _CountdownPillState extends State<CountdownPill>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Timer _timer;
  String _formattedText = '';

  @override
  void initState() {
    super.initState();

    _updateCountdownText();

    if (widget.animate) {
      _controller = AnimationController(
        duration: widget.animationDuration,
        vsync: this,
      )..repeat(reverse: true);
      _animation = Tween<double>(begin: 0.9, end: 1.1).animate(_controller);
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateCountdownText();
    });
  }

  void _updateCountdownText() {
    setState(() {
      _formattedText = DateFormatter.formatRemainingTime(
        widget.targetDate,
        format: widget.format,
      );
    });
  }

  @override
  void dispose() {
    if (widget.animate) {
      _controller.dispose();
    }
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? ScaleTransition(
            scale: _animation,
            child: _buildCountdownText(),
          )
        : _buildCountdownText();
  }

  Widget _buildCountdownText() {
    return Container(
      margin: widget.margin ?? EdgeInsets.zero, // Freedom for margin
      padding: widget.padding ?? EdgeInsets.all(8), // Freedom for padding
      constraints: widget.constraints, // Custom constraints
      width: widget.width, // Dynamic width
      height: widget.height, // Dynamic height
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? Colors.cyan, // Background color
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? 5), // Border radius
        boxShadow:
            widget.boxShadow != null ? [widget.boxShadow!] : [], // Box shadow
        border: widget.border, // Custom border
        gradient: widget.gradient, // Gradient for background
      ),
      child: Text(
        _formattedText,
        style: widget.textStyle ??
            const TextStyle(color: Colors.black, fontSize: 16),
        textAlign: widget.textAlign, // Control text alignment
        overflow: widget.textOverflow, // Control text overflow
        maxLines: widget.maxLines, // Max lines for the text
        textScaleFactor: widget.textScaleFactor, // Text scaling
      ),
    );
  }
}
