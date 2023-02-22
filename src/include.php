<?php
//les fonctions par le controleur
//importer require 
//define une constante
//POUR DEFINIRE LES ROUTE
// print_r();
// exit();
//   print_r($_SERVER);
//   exit();

define("SRC",dirname(__FILE__));
define("ROOT",dirname(SRC));
define("SP",DIRECTORY_SEPARATOR);
define("CONFIG",ROOT.SP."config");
define("VIEW",ROOT.SP."view");
define("MODEL",ROOT.SP."model");
 define("BASE_URL",dirname(dirname($_SERVER['SCRIPT_NAME'])));
//import du model 
require CONFIG.SP."config.php";
require MODEL.SP."DataLayer.class.php";
$model= new DataLayer();
//  $var = $data->createCustomers("khalid","khalid10@hotmail.com","khalid25");
// $authen = $data-> authentfier("khalid10@hotmail.com","khalid25");
// print_r($authen);
// $var=$data->updateInfoCustomers(array( 'id'=> 1 ,'pseudo'=>'paul200','latname'=>'paul','email'=>'paul20@gmai.com'));
//$result=$data->getCategory();
// $result=$data->getProduct(2);
// var_dump($result);
// exit();
//print_r
// exit();
 $category=$model->getCategory();
 $data=$model->getProduct(5,1);
// print_r($data);
// exit();
// print_r($category);
// exit();

// print_r(array(VIEW,MODEL));
// exit();
require "functions.php";

?>