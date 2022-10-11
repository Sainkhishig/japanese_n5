import 'package:afen_vocabulary/common/common_frame_practice/common_widget/afen_text_field.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_reorderable_list/flutter_reorderable_list.dart' as lib;
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum DraggingMode {
  iOS,
  android,
}

class TextAddList extends HookConsumerWidget {
  TextAddList({
    Key? key,
    required this.onClickAdd,
    required this.lstDragItems,
    this.isRemovable = true,
    this.isCreatable = true,
    this.onItemRemoved,
  }) : super(key: key);
  final List<ImageItem> lstDragItems;

  final bool isRemovable;
  final bool isCreatable;

  /// 検索機能

  final ImageItem Function() onClickAdd;
  late Function(ImageItem removedItem)? onItemRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  CustomDraggableCards(List<ImageItem> lstDragItems) {
    // Returns index of item with given key
    int _indexOfKey(Key key) {
      return lstDragItems.indexWhere((ImageItem d) => d.key == key);
    }

    return StatefulBuilder(builder: (context, setState) {
      return ListView.builder(
          itemCount: lstDragItems.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Row(children: [
                Expanded(
                    flex: 5,
                    child: _buildRowItem(
                      setState,
                      lstDragItems[index],
                    )),
              ]),
            );
          });
    });
  }

  Widget _buildRowItem(StateSetter setState, ImageItem rowItem) {
    Widget content = SafeArea(
      top: false,
      bottom: false,
      child: Opacity(
        // hide content for placeholder
        opacity: 1.0,
        child: IntrinsicHeight(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Row(
                      children: [rowItem.field],
                    ),
                  ),
                  Visibility(
                    visible: lstDragItems.length != 1 && isRemovable,
                    child: IconButton(
                      icon: const Icon(
                        Icons.indeterminate_check_box,
                        // color: LightTheme.primary,
                        size: 30,
                      ),
                      tooltip: 'remove action',
                      onPressed: () {
                        setState(
                          () {
                            lstDragItems.remove(rowItem);
                            // onItemRemoved!.call(rowItem);
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                    height: 50,
                  ),
                  Visibility(
                    visible: isCreatable,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add_box,
                        // color: LightTheme.primary,
                        size: 30,
                      ),
                      tooltip: 'add action',
                      onPressed: () {
                        var newItem = onClickAdd.call();

                        setState(
                          () {
                            lstDragItems.add(newItem);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            )),
          ],
        )),
      ),
    );

    return content;
  }
}

class ImageItem {
  ImageItem(this.field, this.key);
  final AfenTextField field;
  // final Widget widget;

  // Each item in reorderable list needs stable and unique key
  final Key key;

  ImageItem.clone(ImageItem randomObject)
      : this(randomObject.field, randomObject.key);
}
