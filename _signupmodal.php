<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary">
  Launch demo modal
</button> -->

<!-- Modal -->


 
<div class="modal fade" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signupModalLabel">Sign Up to Somaiya Connect</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form  action="/collage_forum/partial/_handleSignup.php" method="post">
            <div class="modal-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">User Name</label>
                        <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" placeholder="enter your username">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail">User Email</label>
                        <input type="text" class="form-control" id="useremail" name="useremail" placeholder="username@domain.com">
                    </div>
                    <!-- <div class="form-group">
                        <label for="loginEmail">User Email</label>
                        <input type="text" class="form-control" id="loginEmail" aria-describedby="emailHelp" name="loginEmail" placeholder="username@domain.com">
                    </div> -->
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" class="form-control" id="signupPassword" name="signupPassword" placeholder="enter your password">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword2">Confirm Password</label>
                        <input type="password" class="form-control" id="signupcPassword" name="signupcPassword" placeholder="re-enter your password">
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Sign-Up</button>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                   
                </div>
            </form>
        </div>
    </div>
</div>
