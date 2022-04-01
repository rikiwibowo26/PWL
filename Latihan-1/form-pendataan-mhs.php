<!doctype html>
<html>
<head>
    <style>
        td {
            border: 1px solid black;
        }
        th {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <form action="latihan4.php" method="post">
    <table>
    <tr>
        <td>Nim</td>
        <td><input type="text" placeholder="Masukkan Nim" name="nim"></td>
    </tr>
    <tr>
        <td>Program Studi</td>
        <td>
        <select name="programStudi">
        <option value="TI">Teknik Informatika</option>
        <option value="SI">Sistem Informasi</option>
        <option value="Sastra">Sastra</option>
        </select>
    </td>
    </tr>
    <tr>
        <td>Nilai Tugas</td>
        <td><input type="number" name="nilaitugas"></td>
    </tr>
    <tr>
        <td>Nilai UTS</td>
        <td><input type="number" name="nilaiuts"></td>
    </tr>
    <tr>
        <td>Nilai UAS</td>
        <td><input type="number" name="nilaiuas"></td>
    </tr>
    <tr>
        <td>Catatan Khusus</td>
        <td><input type="checkbox" name="catatan[]" value="hadir">Kehadiran >=70%</td>
        <td><input type="checkbox" name="catatan[]" value="interaktif">Interaktif dikelas</td>
        <td><input type="checkbox" name="catatan[]" value="tidak terlambat">Tidak Terlambat mengumpulkan tugas</td>
    </tr>
    <tr>
        <td><input type="submit" value="masukkan" name="submit"></td>
    </tr>
    
    </table>
    </form>

    <?php
        if(isset($_POST["submit"])){
        $Data = array("nim"=>$_POST["nim"],"programStudi"=>$_POST["programStudi"],"uts"=>$_POST["nilaiuts"],
        "uas"=>$_POST["nilaiuas"],"tugas"=>$_POST["nilaitugas"],"catatan" => $_POST["catatan"]);
        
        $nilaiAkhir = (($Data["uas"]*4/10)+($Data["uts"]*3/10)+($Data["tugas"]*3/10));
        cetakTabel($Data,$nilaiAkhir);
            
        }

    function validNilai($Data,$nilaiAkhir){
        if ($Data["uas"] && $Data["uts"] && $Data["tugas"] >100){
            return "Nilai UAS/UTS/Tugas tidak boleh lebih dari 100";} 
        else{
            return $nilaiAkhir;
        }
    }

    function cekNilai($nilaiAkhir){
        if ($nilaiAkhir >= 60){
            return "LULUS";} 
        else{
            return "Tidak Lulus";
        }
    }
    
    function getCatatan($Data){
        foreach($Data["catatan"] as $cat){
            echo"<li>".$cat."</li>";
        }
    }
    
    function cetakTabel($Data,$nilaiAkhir){
        echo"
        <table>
        <tr>
            <th>Program Studi</th>
            <th>NIM</th>
            <th>Nilai Akhir</th>
            <th>STATUS</th>
            <th>Catatan Khusus</th>
        </tr>
        
        <tr>
        <td>
            ".$Data["programStudi"]."
        </td>
        <td>
            ".$Data["nim"]."
        </td>
        <td>
            ".validNilai($Data,$nilaiAkhir)."
        </td>
        <td>
            ".cekNilai($nilaiAkhir)."
        </td>
        <td><ul>
            ",getCatatan($Data),"
        </ul></td>
        </tr>
        </table>
        ";
    }

        
        
    
    ?>
</body>
</html>
