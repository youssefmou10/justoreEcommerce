<?php

class DataLayer{
    private $connexion;
   function __construct()
   {

    //exit("hi we are in ");
    try {
        $this->connexion=new PDO("mysql:host=".HOST.";dbname=".DB_NAME,DB_USER,DB_PASSWORD);  
        //$dbh = new PDO('mysql:host=localhost;dbname=test', $user, $pass);
        //var_dump($this->connexion);
        /*
        foreach($this->connexion->query(' SELECT * FROM customer ') as $row) {
            print_r($row);
        }*/
        //exit();
        
    } catch (PDOException $th) {
        echo $th->getMessage();
    }

   }
    
   function createCustomers($pseudo,$email,$password)
   {
        $sql = 'INSERT INTO customer (pseudo,email,password) VALUES (:pseudo,:email,:password)';

        try {
            $result = $this->connexion->prepare($sql);
            $var = $result->execute(array(
                ':pseudo' => $pseudo,
                ':email' => $email,
                ':password' => sha1($password)
            ));
            if ($var) { 
                return TRUE;
            } else {
                return FALSE;
            }
        } catch (PDOException $th) {
            return NULL;
        }


   }
   function authentfier($email,$password){
       //selection customer width email
       $sql="SELECT * FROM customer WHERE email=:email";
       try {
        $result=$this->connexion->prepare($sql);
        $result->execute(array(':email'=>$email));
        $data=$result->fetch(PDO::FETCH_ASSOC);
        if($data && ($data['password']==sha1($password))){
            unset($data['password']);
            return $data;
        }
        else{
            return 'authentfication échoué';
        }
        
       } catch (PDOException $th) {
           return NULL;
       }
      
   }
   function createOrder($id_customers,$id_product,$quantity,$price){
       $sql="INSERT order (id_customers,id_product,quantity,price) VALUES (
           :id_customers,:id_product,:quantity,:price

       )";
       try {
        $result = $this->connexion->prepare($sql);
        $var = $result->execute(array(
            ':id_customers' => $id_customers,
            ':id_product' => $id_product,
            ':quantity'=>$quantity,
            ':price'=>$price
            )
        );
        if($var){
            return TRUE;
        }
        else{
            return FALSE;
        }
       } catch (PDOException $th) {
           return NULL;
       }
        

   }
   //$newInfos tableau 
   function updateInfoCustomers($newInfos){
       $sql="UPDATE `customer` SET ";
       try {
           foreach ($newInfos as $key => $value) {
               $sql .=" $key = ' $value',";
               
           }
           //récuprerer le premiére element enelever -1 le derniére element , 
           $sql=substr($sql,0,-1);
          
           $sql .=" WHERE id = :id ";
           
           $result=$this->connexion->prepare($sql);
           $var=$result->execute(array('id'=> $newInfos['id']));
           if($var){
               return TRUE;
           }
           else{
               return FALSE;
           }
        
       } catch (PDOException $th) {
           return NULL;
       }
      
   }
   
   function getCategory(){
       $sql="SELECT * FROM category";
       try {
        $result=$this->connexion->prepare($sql);
        $var=$result->execute();
        //tri sous forme d'un tableau assoicatif
        $data=$result->fetchAll(PDO::FETCH_ASSOC);
        if($data){
            return $data;
        }
        else{
            return FALSE;
        }
       } catch (PDOException $th) {
           return NULL;
       }
   }
   function getProduct($limit=NULL,$category=NULL,$id=NULL){
    $sql="SELECT * FROM products";
    try {
        if(!is_null($category)){
            $sql.=" WHERE  	category_id  = " .$category;
        }
        if(!is_null($id)){
            $sql.=" WHERE  	id = " .$id;
        }
        if(!is_null($limit)){
            $sql.=" LIMIT ".$limit;
        }
     $result=$this->connexion->prepare($sql);
     $var=$result->execute();
     //tri sous forme d'un tableau assoicatif
     $data=$result->fetchAll(PDO::FETCH_ASSOC);
     if($data){
         return $data;
     }
     else{
         return FALSE;
     }
    } catch (PDOException $th) {
        return NULL;
    }

   }
}



?>