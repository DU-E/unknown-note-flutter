enum EUploadStatus {
  init('초기화 중'),
  tagging('태그를 분석하는 중'),
  uploading('업로드 중'),
  success('성공'),
  error('실패');

  final String text;

  const EUploadStatus(this.text);
}
