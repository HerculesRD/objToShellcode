$fileobj = $args
if($args)
{
	$shellcode = objdump.exe -d -Mintel $fileobj | Select -skip 7 | %{ $_.Split("`t")[1];}
	$shellcode = "\x"+$shellcode -replace '\s+|`r|`t|`v|`f|`n','\x'
	Write-Host $shellcode.substring(0,$shellcode.Length-2)
} else {
	Write-Host "Please use an .obj file as an argument to get the shellcode"
	Write-Host "Example: .\shellcodeGenerator.ps1 shellcode.obj"
}


