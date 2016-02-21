<html>
<head>
<?php
	require_once("header.php");
?>
</head>
<body>
    <h1>Pearse is da bomb dot com</h1>
    <p>I definitely deserve this!!!!</p>
    <?php
        $connection = new PDO('mysql:host=localhost;dbname=world', 'root', nUmb3rtHr33);
        foreach ($connection->query('select * from country') as $row){
            echo $row['name'].' '.$row['numStates'].' '.$row['flagColor'].'<br>';
        }
    ?>
</body>
</html>

