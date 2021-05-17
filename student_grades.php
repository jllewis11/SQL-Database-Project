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

		$cwid = $_POST['id'];

		$result = $link->query("SELECT e.student_id, e.grade, s.course FROM enrollment AS e INNER JOIN section AS s ON e.section=s.section_num
								WHERE e.student_id='$cwid' GROUP BY e.section");
		
        echo "Student ID: ", $cwid, "<br>";

		while($row = mysqli_fetch_assoc($result)){
			echo "<br>";
            echo "-------------------";
            echo "<br>";
            echo "Course: ", $row["course"], "<br>";
			echo "Grade: ", $row["grade"], "<br>";
			echo "-------------------";
		}
		
		$result->free_result();
        $link->close();
		?>
    </body>
</html>
