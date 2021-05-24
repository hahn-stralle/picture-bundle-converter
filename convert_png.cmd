@echo off
setlocal enabledelayedexpansion

rem 出力画像ファイル拡張子。
set export_file_extension=.png

rem 出力ディレクトリパス追記。
set export_directory_path=%3%export_file_extension%\

if not %1==return (
	call %~dp0bundle_picture.cmd %~nx0 %*
) else (
	rem 入力画像ファイルをpngに変換して出力します。
	mkdir %export_directory_path% 2>nul
	magick -monitor -define png:compression-level=9 -quality 99 %2 png32:%export_directory_path%%~n2%export_file_extension%
)
endlocal
exit /b