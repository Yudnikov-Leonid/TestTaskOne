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

  static String categoryToDepartment(String category) {
    switch (category) {
      case 'Designers':
        return 'design';
      case 'Analytics':
        return 'analytics';
      case 'Managers':
        return 'management';
      case 'IOS':
        return 'ios';
      case 'Android':
        return 'android';
      case 'Frontend':
        return 'frontend';
      case 'Backend':
        return 'backend';
      case 'Management':
        return 'management';
      case 'QA':
        return 'qa';
      case 'HR':
        return 'hr';
      case 'PR':
        return 'pr';
      case 'Back-office':
        return 'back_office';
      case 'support':
        return 'support';
    }
    return '';
  }
}
