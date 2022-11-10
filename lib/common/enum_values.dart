enum PopupMenu { userInfo, planFee, commentSend, settings }

extension PopupMenuExtension on PopupMenu {
  static final typeNames = {
    PopupMenu.userInfo: 'Хэрэглэгчийн мэдээлэл',
    PopupMenu.planFee: 'Дасгалын эрх авах',
    PopupMenu.commentSend: 'Сэтгэгдэл, санал хүсэлт илгээх',
    PopupMenu.settings: 'Тохиргоо'
  };

  String get title => typeNames[this]!;
  String get planTitle => typeNames[this]!;

  static final typeIds = {
    PopupMenu.userInfo: 'userInfo',
    PopupMenu.planFee: 'planFee',
    PopupMenu.commentSend: 'commentSend',
    PopupMenu.settings: 'settings'
  };

  String get id => typeIds[this]!;
}

enum CommentType { error, improvement, thanks, other }

extension CommentTypeExtension on CommentType {
  static final typeNames = {
    CommentType.error: 'Алдаа оллоо, програм ажиллахгүй байна',
    CommentType.improvement: 'Хичээл нэмэх, засч сайжруулах хүсэлт',
    CommentType.thanks: 'Баярлалаа',
    CommentType.other: 'Бусад',
  };

  String get title => typeNames[this]!;

  static final typeIds = {
    CommentType.error: 'error',
    CommentType.improvement: 'improvement',
    CommentType.thanks: 'thanks',
    CommentType.other: 'other',
  };

  String get id => typeIds[this]!;
}
