<?php
$showError="false";
$showAlert=false;
if($_SERVER["REQUEST_METHOD"]=="POST"){
    include 'db_connect.php';
    $useremail=$_POST['signupEmail'];
    $user=str_replace("<","&lt;","$user");
    $user=str_replace(">","&gt;","$user");
    $user=str_replace('"',"&quot;","$user");
    $user=str_replace("'","&apos;","$user");

    $pass=$_POST['signupPassword'];
    $pass=str_replace("<","&lt;","$pass");
    $pass=str_replace(">","&gt;","$pass");
    $pass=str_replace('"',"&quot;","$pass");
    $pass=str_replace("'","&apos;","$pass");    

    $username = $_POST['username'];
    $username = str_replace("<", "&lt;", $username);
    $username = str_replace(">", "&gt;", $username);
    $username = str_replace('"', "&quot;", $username);
    $username = str_replace("'", "&apos;", $username);
    
    $cpass=$_POST['signupcPassword'];
    // Get the user's email ID from the input form

    // Check if the email ID is of the form "@somaiya.edu"
    if (!preg_match('/^[a-zA-Z0-9._%+-]+@somaiya\.edu$/', $useremail)) {
        // Redirect the user to an error page
        $showError="Invalid email id!";
        header("Location: /collage_forum/index.php?signupsuccess=false&error=true");
    }
    
    else {
        //check whether this email exists
        $existsql="select * from `users` where user_email='$useremail'";
        $result=mysqli_query($conn,$existsql);
        $numRows=mysqli_num_rows($result);
        if($numRows>0){
            $showError="Email already in use";
            header("Location: /collage_forum/index.php?signupsuccess=false&emailused=true");
        }
        else{
            if($pass==$cpass){
                $hash=password_hash($pass,PASSWORD_DEFAULT);
                $sql="INSERT INTO `users` (`user_email`,`user_name`, `user_pass`, `timestamp`) VALUES ('$useremail','$username', '$hash', current_timestamp())";
                $result=mysqli_query($conn,$sql);
                if($result==true){
                    $showAlert=true;
                    echo $showAlert;
                    header("Location: /collage_forum/index.php?signupsuccess=true&error=false");
                }
            }
            else{
                $showError="Password do not match";
                header("Location: /collage_forum/index.php?signupsuccess=false&passerror=true");
            }
        }
    }
    
}
    
?>
