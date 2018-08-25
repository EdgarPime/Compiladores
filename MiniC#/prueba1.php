<?php
/* pagina: asig_conf.php
   fecha:  30/11/2016
   modfecha: 03/12/2016
  
*/
  $carnet=$_post['carnet'];
  $carrera=$_post['carrera'];
  $ciclo_=$_post['ciclo_'];
  if ($_post['voy']==1) {
	?>
	<html>
	<style>
	td.head	{ font-family : arial; font-weight: bold; font-size: 9pt; color: white; background: #006699; }
	td.row	{ font-family : arial; font-weight: normal; font-size: 9pt; color: black; background: white; }
	td.foot	{ font-family : arial; font-weight: normal; font-size: 9pt; color: black; background: #00ffff; text-align:center}
	</style>
	<body>
	<hr>
	<br><br><font size="5">

	<?php
	
function check_horario($pcarnet, $con)
{
	$valido = 0.0;
	$sql = "select semestre from asige_especial where carnet = '" . $pcarnet . "'";
	$semestre = 0;
	$horariors = oci_parse($con, $sql);
	oci_execute($horariors);
	$arrayhorario = oci_fetch_assoc($horariors);
	while (is_array($arrayhorario))
	{   
		$semestre = $arrayhorario['semestre'];
		$arrayhorario = oci_fetch_assoc($horariors);
	}
	oci_free_statement($horariors);
	if ($semestre == 0)
	{	
		$sql = "select umas as contador from asige_semestre where carneti <= '" . $pcarnet .  "' and carnetf >= '" . $pcarnet .  "' and fechaini <= sysdate ";
		$sql = $sql . " and fechafin >= sysdate ";
		$horariors = oci_parse($con, $sql);
		oci_execute($horariors);
		$arrayhorario = oci_fetch_assoc($horariors);
		while (is_array($arrayhorario))
		{   
			$valido = (double)$arrayhorario['contador'];
			$arrayhorario = oci_fetch_assoc($horariors);
		}
		oci_free_statement($horariors);
	}
	else
	{
		$sql = "select umas as contador from asige_semestre where semestre = " . $semestre . " and fechaini <= sysdate ";
		$sql = $sql . " and fechafin >= sysdate ";
		$horariors = oci_parse($con, $sql);
		oci_execute($horariors);
		$arrayhorario = oci_fetch_assoc($horariors);
		while (is_array($arrayhorario))
		{   
			$valido = (double)$arrayhorario['contador'];
			$arrayhorario = oci_fetch_assoc($horariors);
		}
		oci_free_statement($horariors);
	}
	return $valido;
}
?>
<?
  $i=0;
  $total_umas=0;
  $cimpcr = oci_parse($res,$querycimps);
  oci_execute($cimpcr);
  $arraycimps = oci_fetch_assoc($cimpcr);
  while (is_array($arraycimps))
       {
                $ci = round($arraycimps['curso_impartido']);
                $cu = $arraycimps['curso'];
                $no = $arraycimps['nombre'];
                $se = $arraycimps['seccion'];
                $pf = $cursotemp[$i];
		if (trim($pf)=="<b>asignado</b>") { 
			$total_umas = $total_umas + $arraycimps['umas'];
		};
                echo "<tr>
                                <td class=\"row\">$ci</td>
                                 <td class=\"row\">$cu</td>
                                 <td class=\"row\">$no</td>
                                 <td class=\"row\">$se</td>
                                 <td class=\"row\">$pf</td>";
                echo "</tr>\n";
                $arraycimps = oci_fetch_assoc($cimpcr);
		$i++;
       }
  oci_free_statement($cimpcr);
?>
</table>
<table border=0 align=center>
<tr><td><b>importante: en este proceso se ha asignado un total de <? echo($total_umas); ?> umas</b></td></tr>
</table>
<hr>
</body>
</html>
<?
}
  else {
	printf("acceso invalido");
	die;
  }
  $ccl=close_conn($res);
?>
