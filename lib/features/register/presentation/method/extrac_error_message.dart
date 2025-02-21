String extractErrorMessage(String error) {
  RegExp regExp = RegExp(r'message:\s*([^,}]+)'); 
  
  final match = regExp.firstMatch(error);
  
  if (match != null && match.group(1) != null) {
    return match.group(1)!.trim(); 
  }
  
  return "failed registrtion"; 
}