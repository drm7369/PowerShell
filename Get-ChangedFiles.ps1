


#  current directory, looks at any file and only for ones that are 1 days old. 
	Get-ChildItem -Path . -Recurse| ? {$_.LastWriteTime -gt (Get-Date).AddDays(-1)}
