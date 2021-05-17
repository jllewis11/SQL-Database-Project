<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    <body>
        <?php 
        $link = mysqli_connect('mariadb','cs332c17','pee0Lure','cs332c17');
        if (!$link) {
            die('Could not connect: '.mysql_error());

        }
        echo 'Connected successfully<p>';



        $coursen = $_POST['cn'];
        $sectionn = $_POST['sn'];

        echo "Course Number:  ", $coursen;
        echo "<br>";
        echo "Section Number:  ", $sectionn;
        echo "<br>";
        //$result = $link->query("SELECT student_id, section, grade FROM section WHERE $sectionn=section");
        $grades = array("A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F+","F","F-");
        $counter = 0;

        foreach ($grades as $g){
            $result = $link->query("SELECT count(*) AS total FROM enrollment WHERE '$grades[$counter]'=grade AND '$sectionn'=section" );
            while($data = mysqli_fetch_assoc($result)/*$result->mysqli_fetch_assoc()*/){
                echo "<br>";
                //$data = mysqli_fetch_assoc($result);
                echo "<br>";
                echo $g,"  : ", $data["total"];

                echo "<br>";
                echo "------------------";
            }
            $counter++;
        }

        $result->free_result();
        $link->close();

        ?>

    </body>
</html>
