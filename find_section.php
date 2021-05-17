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



		$con = $_POST['cnum'];

        $result = $link->query("SELECT s.course, s.section_num, s.room, s.days, s.start_time, s.end_time, COUNT(e.section) AS t FROM section AS s INNER JOIN enrollment AS e ON s.section_num = e.section WHERE course='$con' GROUP BY s.section_num");
        //$data = $link->query("SELECT COUNT(section) AS t FROM enrollment WHERE section='$row["section_num"]'");
        //$data = mysqli_fetch_assoc($result);
        while($row = $result->fetch_assoc()){
            echo "<br>";
            echo "--------------------";
            echo "<br>";
            echo "Course: ", $row["course"], "<br>";
            echo "Classroom: ", $row["room"], "<br>";
            echo "Number of Students: ", $row["t"],"<br>";
            echo "Meeting Days: ", $row["days"], "<br>";
            echo "Start Time: ", $row["start_time"], "<br>";
            echo "End time: ", $row["end_time"], "<br>";
            echo "-------------------";

            echo "<br>";
            echo "<br>";
            echo "<br>";
        }

        $result->free_result();
        $link->close();

		?>
    </body>
</html>
