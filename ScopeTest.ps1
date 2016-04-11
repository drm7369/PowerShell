



Write-Host	"Begining script execution"
write-host	"x contains $x"

Write-Host "Now setting $x"
$x = 5

function Scope {
	write-host "x contains $x"
	$x = 10
	write-host "x contains $x"
	Write-Host "Finished function scope"

}

write-host "Execution Scope Funtion"

Scope

Write-Host "Finished scope function"
Write-Host "Back in the script"
Write-Host "x contains $x"

Write-Host "Now messing with the global scope"
$global:x = 200
Write-Host "x contains $x"