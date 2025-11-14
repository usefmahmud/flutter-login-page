import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  final String? selectedGender;
  final void Function(String?)? onChanged;

  const GenderSelect({super.key, this.selectedGender, this.onChanged});

  @override
  State<GenderSelect> createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  String? _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selectedGender;
  }

  void _select(String gender) {
    setState(() {
      _selected = gender;
    });
    if (widget.onChanged != null) widget.onChanged!(gender);
  }

  Widget _buildCard(String gender, IconData icon) {
    final isSelected = _selected == gender;
    final color = Theme.of(context).colorScheme.primary;

    return Expanded(
      child: GestureDetector(
        onTap: () => _select(gender),
        child: Card(
          color: isSelected ? Colors.blueGrey.withAlpha(10) : null,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: isSelected ? color : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: isSelected ? color : Colors.grey[700],
                ),
                const SizedBox(height: 8),
                Text(
                  gender,
                  style: TextStyle(
                    color: isSelected ? color : Colors.grey[800],
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCard('Male', Icons.male),
        const SizedBox(width: 12),
        _buildCard('Female', Icons.female),
      ],
    );
  }
}
