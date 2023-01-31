<?php
	if (!isset($_POST)) {
    $response = array('status' => 'failed', 'data' => null);
    sendJsonResponse($response);
    die();
	}
	include_once("dbconnect.php");
	$userid = $_POST['userid'];
  $hname= ucwords(addslashes($_POST['prname']));
	$hdesc= ucfirst(addslashes($_POST['prdesc']));
	$hsprice= $_POST['prprice'];
  $delivery= $_POST['delivery'];
  $qty= $_POST['qty'];
  $state= addslashes($_POST['state']);
  $local= addslashes($_POST['local']);
  $lat= $_POST['lat'];
  $lon= $_POST['lon'];
  $image= $_POST['image'];
  $image1= $_POST['image1'];
  $image2= $_POST['image2'];
	
	$sqlinsert = "INSERT INTO `tbl_homestay`(`user_id`, `homestay_name`, `homestay_desc`, `homestay_price`, `homestay_delivery`, `homestay_qty`, `homestay_state`, `homestay_local`, `homestay_lat`, `homestay_lng`) VALUES ('$userid','$hname','$hdesc',$hsprice,$delivery,$qty,'$state','$local','$lat','$lon')";
	
  try {
		if ($conn->query($sqlinsert) === TRUE) {
			$decoded_string = base64_decode($image);
			$filename = mysqli_insert_id($conn);
			$path = '../assets/productimages/'.$filename.'.png';
			file_put_contents($path, $decoded_string);

			$decoded_string = base64_decode($image1);
			$filename = mysqli_insert_id($conn);
			$path = '../assets/productimages/'.$filename.'.1.png';
			file_put_contents($path, $decoded_string);

			$decoded_string = base64_decode($image2);
			$filename = mysqli_insert_id($conn);
			$path = '../assets/productimages/'.$filename.'.2.png';
			file_put_contents($path, $decoded_string);

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