<?php
$conn= mysqli_connect('localhost','root','','dbms_p1');
if(!$conn)
{
	echo"not connected";
}
$first_name = $_POST['first_name'];
$middle_name= $_POST['middle_name'];
$last_name=$_POST['last_name'];
$dob=$_POST['birthday'];
$gender=$_POST['gender'];
$mail_id=$_POST['email'];
$phone=$_POST['phone'];
$aadhar=$_POST['aadhar'];
$street=$_POST['street'];
$city=$_POST['city'];
$state=$_POST['state'];

$sql="INSERT into citizen (first_name,middle_name,last_name,aadhar,gender,dob,phone_no,mail_id) values('$first_name','$middle_name','$last_name','$aadhar','$gender','$dob','$phone','$mail_id')";

$addr="INSERT into address (aadhar,street,city,state) values('$aadhar','$street','$city','$state')";
if(!mysqli_query($conn,$sql))
{
	echo "not inserted";

}
if(!mysqli_query($conn,$addr))
{
	echo " address not inserted";

}


else
{
	echo " Registred Successfully";
}
header("refresh:2;url=index.html");

?>
