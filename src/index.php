<?php
session_start();

//exit("hello");
require "include.php";
//gestion de la requéte structurer la requéte
//pour supprimer les espaces 
 $url=trim($_SERVER["PATH_INFO"],"/");
//  print_r($url);
//  exit();
 // explode convertir les chaine to array
   $url=explode("/",$url);
   $route=array("acceuil","panier","produit","category","contact","details");
   //recuprer le premiére element de url 
   $action = $url[0];
//    print_r($url);
//controller $action in route
if(!in_array($action,$route)){
        $title="Page Error";
        $content="URL Introuvable";
}
else{
        $function="display".ucwords($action);
        $title="Page ".$action;
        $content= $function();
       
       
}
require VIEW.SP."template".SP."default.php";
?>