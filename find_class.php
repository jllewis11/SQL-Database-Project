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
        $number = $_POST['ssn'];
        $result = $link->query("SELECT course, room, days, start_time, end_time, prof FROM section WHERE prof=$number");

        
        while($row = $result->fetch_assoc()){

                echo "<br>";
                echo "-------------------";
                echo "<br>";
                echo "Course: ", $row["course"], "<br>";
                echo "Classroom: ", $row["room"], "<br>";
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
