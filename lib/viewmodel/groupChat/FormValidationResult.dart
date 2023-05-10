class FormValidationResult<T> {
  final T? input;
  final List<String>? errors;

  FormValidationResult.success(this.input) : errors = null;

  FormValidationResult.failure({this.errors, this.input});
}
