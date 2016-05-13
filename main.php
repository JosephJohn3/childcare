<?php
/**
 * Main.php
 *
 * This is an example of the main page of a website. Here
 * users will be able to login. However, like on most sites
 * the login form doesn't just have to be on the main page,
 * but re-appear on subsequent pages, depending on whether
 * the user has logged in or not.
 *
 * Written by: Jpmaster77 a.k.a. The Grandmaster of C++ (GMC)
 * Last Updated: August 26, 2004
 * Modified by: Arman G. de Castro, October 3, 2008
 * email: armandecastro@gmail.com
 */
include("include/classes/session.php");
?>

<html>
<title>Login Script</title>
<body>

<table>
<tr><td>


<?php
/**
 * User has already logged in, so display relevant links, including
 * a link to the admin center if the user is an administrator.
 */
 
 if (($session->logged_in) && ($session->isMember())){
      	echo "<h1>Logged In</h1>";
   		echo "Welcome <b>$session->username</b>, you are logged in. <br><br>"
       		."[<a href=\"userinfo.php?user=$session->username\">My Account</a>]   "
       		."[<a href=\"useredit.php\">Edit Account</a>]   ";
	   	echo "[<a href=\"process.php\">Logout</a>]";

} elseif (($session->logged_in) && ($session->isAgent())) {
  		echo "<h1>Logged In</h1>";
   		echo "Welcome <b>$session->username</b>, you are logged in. <br><br>"
       		."[<a href=\"userinfo.php?user=$session->username\">My Account</a>]   "
	   		."[<a href=\"member_register.php?user=$session->username\">Add Member</a>]   "
       		."[<a href=\"useredit.php\">Edit Account</a>]   ";
	    echo "[<a href=\"agent/agent.php\">Agent Center</a>] ";
		echo "[<a href=\"process.php\">Logout</a>]";
		
} elseif (($session->logged_in) && ($session->isMaster())) {
  		echo "<h1>Logged In</h1>";
   		echo "Welcome <b>$session->username</b>, you are logged in. <br><br>"
       		."[<a href=\"userinfo.php?user=$session->username\">My Account</a>]   "
	   		."[<a href=\"agent_register.php?user=$session->username\">Add Agent</a>]   "
       		."[<a href=\"useredit.php\">Edit Account</a>]   ";
	    echo "[<a href=\"master/master.php\">Master Center</a>] ";
		echo "[<a href=\"process.php\">Logout</a>]";

} elseif (($session->logged_in) && ($session->isAdmin())) {
  		echo "<h1>Logged In</h1>";
   		echo "Welcome <b>$session->username</b>, you are logged in. <br><br>"
       		."[<a href=\"userinfo.php?user=$session->username\">My Account</a>]   "
	   		."[<a href=\"master_register.php?user=$session->username\">Add Master</a>]   "
       		."[<a href=\"useredit.php\">Edit Account</a>]   ";
	    echo "[<a href=\"admin/admin.php\">Admin Center</a>] ";
	    echo "[<a href=\"process.php\">Logout</a>]";

} else {
echo "Try to log the following Users with their Members: <br /><br />";
echo "User: admin password: admin <br /><br />";
echo "User: master1 password: master1<br />";
echo "User: master2 password: master2<br />";
echo "User: master3 password: master3<br />";
echo "User: master4 password: master4<br /><br />";

echo "Member of master1<br /><br />";
echo "User: master1agent1 password: master1agent1<br />";
echo "User: master1agent2 password: master1agent2<br /><br />";

echo "Member of master1agent1<br /><br />";
echo "User: master1agent1member1 password: master1agent1member1<br />";
echo "User: master1agent1member2 password: master1agent1member2<br />";
echo "<br />";
echo "Try using the master2 to master4 login the username is also their password!";
?>

<h1>Main Login</h1>

<?php
/**
 * User not logged in, display the login form.
 * If user has already tried to login, but errors were
 * found, display the total number of errors.
 * If errors occurred, they will be displayed.
 */
if($form->num_errors > 0){
   echo "<font size=\"2\" color=\"#ff0000\">".$form->num_errors." error(s) found</font>";
}
?>
<!-- <form action="process.php" method="POST"> -->
<form action="process.php" method="POST"> 
<table align="left" border="0" cellspacing="0" cellpadding="3">
<tr><td>Username:</td><td><input type="text" name="user" maxlength="30" value="<?php echo $form->value("user"); ?>"></td><td><?php echo $form->error("user"); ?></td></tr>
<tr><td>Password:</td><td><input type="password" name="pass" maxlength="30" value="<?php echo $form->value("pass"); ?>"></td><td><?php echo $form->error("pass"); ?></td></tr>
<tr><td colspan="2" align="left"><input type="checkbox" name="remember" <?php if($form->value("remember") != ""){ echo "checked"; } ?>>
<font size="2">Remember me next time     
<input type="hidden" name="sublogin" value="1">
<input type="submit" value="Login"></td></tr>
<tr><td colspan="2" align="left"><br><font size="2">[<a href="forgotpass.php">Forgot Password?</a>]</font></td><td align="right"></td></tr>
<tr><td colspan="2" align="left">&nbsp;</td>
</tr>
</table>
</form>

<?php
}

/**
 * Just a little page footer, tells how many registered members
 * there are, how many users currently logged in and viewing site,
 * and how many guests viewing site. Active users are displayed,
 * with link to their user information.
 */
echo "</td></tr><tr><td align=\"center\"><br><br>";
echo "<b>Member Total:</b> ".$database->getNumMembers()."<br>";
echo "There are $database->num_active_users registered members and ";
echo "$database->num_active_guests guests viewing the site.<br><br>";

include("include/classes/view_active.php");
//echo $session->userlevel;
?>


</td></tr>
</table>


</body>
</html>