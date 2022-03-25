
extension Boolean on String? {
 bool get isNullOrEmpty => this?.isEmpty == true;
}