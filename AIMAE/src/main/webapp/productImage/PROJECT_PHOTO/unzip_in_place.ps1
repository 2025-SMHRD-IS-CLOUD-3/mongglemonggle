param(
  [string]$Root = "C:\Users\smhrd\Desktop\PROJECT_PHOTO\야채\무우"
)

# 가능한 경우 Archive 모듈 로드 (Expand-Archive)
Import-Module Microsoft.PowerShell.Archive -ErrorAction SilentlyContinue | Out-Null

Write-Host ("대상 경로: {0}" -f $Root)

# 대상 경로 내 모든 zip 파일 수집
$zips = Get-ChildItem -LiteralPath $Root -Recurse -File -Filter *.zip -ErrorAction SilentlyContinue

if (-not $zips -or $zips.Count -eq 0) {
  Write-Host "압축 파일(.zip)이 없습니다."
  exit 0
}

foreach ($zip in $zips) {
  Write-Host ("압축 해제: {0}" -f $zip.FullName)
  try {
    Expand-Archive -LiteralPath $zip.FullName -DestinationPath $zip.DirectoryName -Force -ErrorAction Stop
    Write-Host ("완료: {0}" -f $zip.Name)
  } catch {
    Write-Host ("실패(Expand-Archive): {0} -> {1}" -f $zip.FullName, $_.Exception.Message) -ForegroundColor Red
    # 대체 방식: Shell.Application COM 사용
    try {
      $shell = New-Object -ComObject Shell.Application
      $src = $shell.NameSpace($zip.FullName)
      $dst = $shell.NameSpace($zip.DirectoryName)
      if ($src -and $dst) {
        # 0x10 No UI
        $dst.CopyHere($src.Items(), 0x10)
        Write-Host ("대체방식 완료(Shell): {0}" -f $zip.Name)
      } else {
        Write-Host ("대체방식 실패(Shell namespace): {0}" -f $zip.FullName) -ForegroundColor Red
      }
    } catch {
      Write-Host ("대체방식 실패: {0}" -f $_.Exception.Message) -ForegroundColor Red
    }
  }
}

Write-Host "모든 zip 처리 완료."


