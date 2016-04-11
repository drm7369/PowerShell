#Global Scope New-Alias -Name d -Value Get-ChildItem
d

#Child Scope
#New-Alias -Name d -Value Get-Process -Force

#d

# Not defined in child scope - defined in Global Scope
e