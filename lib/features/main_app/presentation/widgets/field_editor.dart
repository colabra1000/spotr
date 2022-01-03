import 'package:c_modal/c_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldEditor extends StatefulWidget {
  final bool loading;
  const FieldEditor({required this.loading, Key? key}) : super(key: key);

  @override
  _FieldEditorState createState() => _FieldEditorState();
}

class _FieldEditorState extends State<FieldEditor> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(microseconds: 300),
      child: widget.loading
          ? _loadingWidget
          : SizedBox(
              height: 120.h,
              child: const Text("field editor"),
            ),
    );
  }

  // Widget _fieldWidget {

  // }

  Widget get _loadingWidget {
    return Container(
      color: Colors.red.shade200,
      height: 120.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("updating field"),
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: SizedBox(
                height: 20.r, width: 20.r, child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
