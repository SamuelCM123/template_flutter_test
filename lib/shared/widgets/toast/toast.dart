import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Toast extends StatefulWidget {
  final String title;
  final String message;
  final Duration duration;
  final String type;
  final VoidCallback? onClose;

  const Toast({
    super.key,
    required this.title,
    required this.message,
    required this.type,
    this.duration = const Duration(seconds: 4),
    this.onClose,
  });

  @override
  State<Toast> createState() => _ToastState();
}

class _ToastState extends State<Toast> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isDisposed = false;
  final typeToast = <String, Color>{
    'success': Color(0xFF77BC79),
    'error': Color(0xFFEA5B5B),
    'info': Color(0xFF293277),
    'warning': Color(0xFFFACC15),
  };

  final typeIcon = <String, IconData>{
    'success': Icons.check_circle_outline,
    'error': Icons.cancel_outlined,
    'info': Icons.info_outline,
    'warning': Icons.warning_amber_outlined,
  };

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && !_isDisposed) {
        widget.onClose?.call();
      }
    });
  }

  @override
  void dispose() {
    _isDisposed = true; // 👈 marcar que ya se destruyó
    _controller.dispose();
    super.dispose();
  }

  void _handleManualClose() {
    if (!_isDisposed) {
      widget.onClose?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 350,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: typeToast[widget.type] ?? Colors.amber),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(76, 175, 80, 0.2),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Stack(
          children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //* ICONO
                    SizedBox(
                      width: 30 * 1.5,
                      height: 30 * 1.5,
                      child: Icon(
                        typeIcon[widget.type],
                        color: typeToast[widget.type],
                        size: 24 * 1.5,
                      ),
                    ),
                    
                    const SizedBox(width: 10),
          
                    //* ICONO
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title.toUpperCase(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: typeToast[widget.type],
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 4),
                          RichText(
                            text: TextSpan(
                              style: GoogleFonts.poppins(
                                fontSize: 11,
                                color: Colors.black,
                              ),
                              children: _buildMessageSpan(widget.message),
                            ),
                          )
                        ],
                      ),
                    ),          
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                child: SizedBox(
                  height: 3,
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1.0, end: 0),
                    duration: widget.duration,
                    builder: (context, value, child) {
                      return LinearProgressIndicator(
                        value: value,
                        backgroundColor: Colors.white,
                        color: typeToast[widget.type],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
            Positioned(
              right: 5,
              child: GestureDetector(
                onTap: _handleManualClose,
                child: const Padding(
                  padding: EdgeInsets.only(left: 12, top: 2),
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ] 
        ),
      ),
    );
  }


  // Para el texto con negritas (detecta **Texto** para negrita)
  List<TextSpan> _buildMessageSpan(String message) {
    final spans = <TextSpan>[];
    final regex = RegExp(r'\*\*(.*?)\*\*');
    int start = 0;

    for (final match in regex.allMatches(message)) {
      if (match.start > start) {
        spans.add(TextSpan(text: message.substring(start, match.start)));
      }
      spans.add(TextSpan(
          text: match.group(1),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 11
          )));
      start = match.end;
    }

    if (start < message.length) {
      spans.add(TextSpan(text: message.substring(start)));
    }

    return spans;
  }
}
