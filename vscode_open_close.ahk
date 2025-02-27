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
	dirFile := "C:\projects\vscode-open-shortcut\directory.txt"
	if (FileExist(dirFile)) {
		FileRead, workingDir, %dirFile%
		workingDir := Trim(workingDir)
		
		if (FileExist(workingDir)) {
            if (Not WinExist("MINGW64")) {
                Run, "C:\Program Files\Git\git-bash.exe" --cd="%workingDir%"
            }
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