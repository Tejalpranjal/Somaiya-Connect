<?php
$showError = "false";
$showAlert = false;

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include 'db_connect.php';
    $user_email = $_POST['signupEmail'];
    $user = str_replace("<", "&lt;", "$user");
    $user = str_replace(">", "&gt;", "$user");
    $user = str_replace('"', "&quot;", "$user");
    $user = str_replace("'", "&apos;", "$user");
    $pass = $_POST['signupPassword'];
    $pass = str_replace("<", "&lt;", "$pass");
    $pass = str_replace(">", "&gt;", "$pass");
    $pass = str_replace('"', "&quot;", "$pass");
    $pass = str_replace("'", "&apos;", "$pass");    
    $cpass = $_POST['signupcPassword'];

    // Check if email is from allowed domain
    $allowed_domain = 'somaiya.edu';
    $email_domain = substr($user_email, strpos($user_email, '@') + 1);
    if ($email_domain !== $allowed_domain) {
        $showError = "Invalid email domain";
        header("Location: /collage_forum/index.php?signupsuccess=false&emailused=true");
        exit();
    }

    // Check if email exists
    $existsql = "SELECT * FROM `users` WHERE user_email='$user_email'";
    $result = mysqli_query($conn, $existsql);
    $numRows = mysqli_num_rows($result);
    if ($numRows > 0) {
        $showError = "Email already in use";
        header("Location: /collage_forum/index.php?signupsuccess=false&emailused=true");
        exit();
    } else {
        if ($pass == $cpass) {
            $hash = password_hash($pass, PASSWORD_DEFAULT);
            $sql = "INSERT INTO `users` (`user_email`, `user_pass`, `timestamp`) VALUES ('$user_email', '$hash', current_timestamp())";
            $result = mysqli_query($conn, $sql);
            if ($result == true) {
                $showAlert = true;
                echo $showAlert;
                header("Location: /collage_forum/index.php?signupsuccess=true&error=false");
                exit();
            }
        } else {
            $showError = "Passwords do not match";
            header("Location: /collage_forum/index.php?signupsuccess=false&error=true");
            exit();
        }
    }
}
?>
