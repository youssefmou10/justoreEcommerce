<?php
    function displayAcceuil(){
        return "<h1>Bienvenue sur la page Acceuil</h1>";
    }
   
    function displayProduit(){
        global $model;
        $dataProduct=$model-> getProduct();
        $result= "bienvenue sur la page produit"."<br> <br>";
        foreach ($dataProduct as $key => $value) {
            $result.='<div class="card" style="width: 18rem;display:inline-block;">
            <img src="'.BASE_URL.SP."img".SP."produit".SP.$value["image"].'" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">'.$value['name'].'</h5>
              <p class="card-text"></p>
              <a href="'.BASE_URL.SP."details".SP.$value['id'].'" class="btn btn-primary">Details</a>
              <a href="'.BASE_URL.SP."panier".SP.$value['id'].'" class="btn btn-success">Acheter</a>
            </div>
          </div>';
        }
        return $result;

    }
    function displayContact(){
        return "<h1>Bienvenue sur la page Conatct</h1>";
    }
    function displayCategory(){
        global $model;
        global $url;
        global $category;
        if (isset($url[1]) && is_numeric($url[1]) && $url[1]>0 && $url[1] <= sizeof($category)) {
            $dataProduct=$model-> getProduct(null,$url[1]);
            $result="<h1>Produit de la category :".$category[$url[1]-1]["name"]."</h1>";
            foreach ($dataProduct as $key => $value) {
                $result.='<div class="card" style="width: 18rem;display:inline-block;">
                <img src="'.BASE_URL.SP."img".SP."produit".SP.$value["image"].'" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">'.$value['name'].'</h5>
                  <p class="card-text"></p>
                  <a href="'.BASE_URL.SP."details".SP.$value['id'].'" class="btn btn-primary">Details</a>
                  <a href="'.BASE_URL.SP."panier".SP.$value['id'].'" class="btn btn-success">Acheter</a>
                </div>
              </div>';
            }
        }
        else{
            $result= "<h1>page introuvable</h1>";
        }
     

        return $result;
    }
    function displayDetails(){
        global $model;
        global $url;
        global $category;
        $result="<h1> page Details</h1>";
        $dataProduct = $model->getProduct(null,null,$url[1]);
        $result.='
            <div class="row details">
            <div class="col-md-5 col-12">
            <img src="'.BASE_URL.SP."img".SP."produit".SP.$dataProduct[0]["image"].'" class="card-img-top" alt="">
            </div>
            <div class="col-md-7 col-12">
                <h2>'.$dataProduct[0]["name"].'</h2>
                <p>'.$dataProduct[0]["description"].'</p>
                <p>Category: '.$category[$dataProduct[0]["category_id"]-1]["name"].'</p>
                <a href="'.BASE_URL.SP."panier".$dataProduct[0]["id"].'" class="btn btn-primary d-block">Ajouter au Panier</a>
                <a href="'.BASE_URL.SP."produit".'" class="btn btn-success d-block my-2">Retour</a>

            </div>
            </div>
        
        
        ';

        return $result;
    }
    function displayPanier(){
      global $model;
      global $url;
      $result="Bienvenue dans la page Produit";
      if(isset($url[1])){
        $id_Produit= $url[1];
        $dataProduct = $model->getProduct(null,null,$url[1]);
        $_SESSION["panier"][]=$dataProduct[0];
       
      }
     if(!isset($_SESSION["panier"])){
       return "<h1>le panier est vide</h1>".displayProduit();
     }

      $result.='<table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">name</th>
          <th scope="col">description</th>
          <th scope="col">image</th>
          <th scope="col">price</th>
        </tr>
      </thead>
      <tbody>';

      foreach ($_SESSION["panier"] as $key => $value) {
         $result.=' <tr>
          <th scope="row">'.$value["id"].'</th>
          <td >'.$value["name"].'</td>
          <td>'.$value["description"].'</td>
          <td><img src="'.BASE_URL.SP."img".SP."produit".SP.$value["image"].'"/></td>
          <td>'.$value["price"].'</td>
        </tr>';
      }
      return $result.='</tbody>
      </table>';
      return $result;

}
?>