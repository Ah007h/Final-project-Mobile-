<?php
	if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	include_once("dbconnect.php");
	$userid = $_POST['userid'];
	$homestayid = $_POST['homestayid'];
  $hname= ucwords(addslashes($_POST['hname']));
	$hdesc= ucfirst(addslashes($_POST['hdesc']));
	$hsprice= $_POST['hsprice'];
  $delivery= $_POST['delivery'];
  $qty= $_POST['qty'];
  
	$sqlupdate = "UPDATE `tbl_homestay` SET `homestay_name`='$hname',`homestay_desc`='$hdesc',`homestay_price`='$hsprice',`homestay_delivery`='$delivery',`homestay_qty`='$qty' WHERE `homestay_id` = '$homestayid' AND `user_id` = '$userid'";
	
  try {
		if ($conn->query($sqlupdate) === TRUE) {
			$response = array('status' => 'success', 'data' => null);
			sendJsonResponse($response);
		}
		else{
			$response = array('status' => 'failed', 'data' => null);
			sendJsonResponse($response);
		}
	}
	catch(Exception $e) {
		$response = array('status' => 'failed', 'data' => null);
		sendJsonResponse($response);
	}
	$conn->close();
	
	function sendJsonResponse($sentArray)
	{
    header('Content-Type= application/json');
    echo json_encode($sentArray);
	}
?>