import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_z/features/profile/presentation/bloc/profile_screen_bloc.dart';

class ProfileTextField extends StatefulWidget {
  const ProfileTextField({
    super.key,
    required this.label,
    required this.context,
    this.isDistrictSelector = false,
    this.districts,
    this.district,
    this.town,
    required this.onEntered,
  });

  final BuildContext context;
  final String label;
  final String? district;
  final String? town;

  final bool isDistrictSelector;
  final List<String>? districts;

  final void Function(String entered) onEntered;

  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  bool _showDropdown = false;
  final FocusNode _focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  final List<String> _filteredDistricts = [];

  @override
  void initState() {
    super.initState();

    controller.text = (widget.label == 'Tuman') ? (widget.district ?? '') : (widget.town ?? '');

    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() => _showDropdown = false);
        widget.onEntered(controller.text);
      }
    });
    if (widget.districts != null) {
      _filteredDistricts.addAll(widget.districts!);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _filterDistricts(String query) {
    _filteredDistricts.clear();
    if (query.isEmpty) {
      _filteredDistricts.addAll(widget.districts ?? []);
    } else {
      _filteredDistricts.addAll(
          widget.districts?.where((district) => district.toLowerCase().contains(query.toLowerCase())).toList() ?? []);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Color.fromRGBO(125, 125, 125, 1),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Stack(
          children: [
            SizedBox(
              height: _showDropdown ? 300 : 40,
              child: TextField(
                controller: controller,
                focusNode: _focusNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromRGBO(245, 245, 247, 1),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(197, 197, 197, 1),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(197, 197, 197, 1),
                      width: 1,
                    ),
                  ),
                  suffixIcon: widget.isDistrictSelector
                      ? IconButton(
                          icon: Icon(
                            _showDropdown ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                            color: Colors.grey[600],
                          ),
                          onPressed: () {
                            setState(() => _showDropdown = !_showDropdown);
                          },
                          padding: EdgeInsets.zero,
                        )
                      : null,
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: widget.isDistrictSelector
                    ? (value) {
                        _filterDistricts(value);
                        setState(() => _showDropdown = true);
                      }
                    : null,
                onTap: widget.isDistrictSelector
                    ? () {
                        setState(() => _showDropdown = true);
                      }
                    : null,
              ),
            ),
            if (widget.isDistrictSelector && _showDropdown && _filteredDistricts.isNotEmpty)
              Positioned(
                top: 40,
                left: 0,
                right: 0,
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 200),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(245, 245, 247, 1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromRGBO(197, 197, 197, 1),
                        width: 1,
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredDistricts.length,
                      itemBuilder: (context, index) {
                        final isSelected = controller.text == _filteredDistricts[index];
                        return InkWell(
                          onTap: () {
                            controller.text = _filteredDistricts[index];
                            setState(() => _showDropdown = false);
                            _focusNode.unfocus();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              border: index != _filteredDistricts.length - 1
                                  ? const Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(230, 230, 230, 1),
                                        width: 1,
                                      ),
                                    )
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _filteredDistricts[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                if (isSelected)
                                  const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
