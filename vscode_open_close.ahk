^!v::

SetTitleMatchMode, 2
if (WinExist("Visual Studio Code")) {
	if (WinActive("Visual Studio Code")) {
		WinMinimize
	}
	else {
		WinMaximize
		WinActivate
	}
}
else {
	dirFile := "C:\Users\madew\Documents\AutoHotKey\vscode-open-shortcut\directory.txt"
	if (FileExist(dirFile)) {
		FileRead, workingDir, %dirFile%
		workingDir := Trim(workingDir)
		
		if (FileExist(workingDir)) {
			Run, cmd /c code %workingDir%
		}
		else {
			MsgBox, Directory %workingDir% not found
		}
	}
	else {
		MsgBox, directory.txt not found
	}
}
return