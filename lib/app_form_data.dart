class JobPostData {
  String _jobTitle;
  String _jobDescription;

  JobPostData(this._jobTitle, this._jobDescription);  // ---> Constructor

  String get jobTitle => _jobTitle; // -----> Getter

  set jobTitle(String value) {      // -----> Setter
    _jobTitle = value;
  }

  String get jobDescription => _jobDescription;

  set jobDescription(String value) {
    _jobDescription = value;
  }
}