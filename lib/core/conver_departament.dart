class ConvertDepartment {
  static String convert(String department) {
    switch (department) {
      case 'android':
        return 'Android';
      case 'ios':
        return 'IOS';
      case 'design':
        return 'Design';
      case 'management':
        return 'Management';
      case 'qa':
        return 'QA';
      case 'back_office':
        return 'Back-office';
      case 'frontend':
        return 'Frontend';
      case 'hr':
        return 'HR';
      case 'pr':
        return 'PR';
      case 'backend':
        return 'Backend';
      case 'support':
        return 'Support';
      case 'analytics':
        return 'Analytics';
    }
    return '';
  }
}
