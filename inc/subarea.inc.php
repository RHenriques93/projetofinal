<div class="container">
  <div class="container-fluid py-3">
    <header class="col-md-12 mb-4">
<?php require("db_projetofinal.php");

$id = $_REQUEST["id"];


$dados = $db->query("SELECT subarea.nome, subarea.id_area FROM subarea WHERE subarea.id_subarea = $id");

foreach ($dados as $linha)

      echo'<h2 class="text-center text-dark">'.$linha["nome"].'</h2>';
?>
      <span class="underline mb-3"></span>
    </header>
    <div class="row justify-content-center">   

<?php 

$db = new PDO("mysql:host=localhost; dbname=projetofinal; charset=utf8","root","");
$dados = $db->query("SELECT DISTINCT utilizador.nome, utilizador.id_utilizador, utilizador.imagem, servico.id_servico, servico.descricao, preco_servico.base FROM utilizador JOIN servico ON utilizador.id_utilizador = servico.id_utilizador JOIN subarea ON servico.id_subarea = subarea.id_subarea JOIN area ON subarea.id_area = area.id_area JOIN preco_servico ON servico.id_servico = preco_servico.id_servico WHERE subarea.id_subarea = $id");


if ($dados->rowCount() > 0){

foreach ($dados as $row) {

  echo '<div class="col-md-4 col-sm-6 col-xs-12 my-2">
          <div class="card">
            <div id="'.$row["id_servico"].'" class="carousel slide" data-ride="carousel">
              <div class="carousel-inner">
                <div class="carousel-item active">
                  <img src="'.$row["imagem"].'" class="card-img-top" alt="...">
                </div>

         ';
    
$id_serv = $row["id_servico"];

                    $dados = $db->query("SELECT img_serv FROM img_service JOIN servico ON img_service.id_servico = servico.id_servico WHERE servico.id_servico = $id_serv");

     foreach ($dados as $linha) {
     echo ' 
     <div class="carousel-item">
        <img src="'.$linha["img_serv"].'" class="card-img-top" alt="...">
      </div>
       
      ';

    

}


        echo'   
        </div>      
  <a class="carousel-control-prev" href="#'.$row["id_servico"].'" role="button" data-slide="prev">
  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
  <span class="sr-only">Previous</span>
</a>
<a class="carousel-control-next" href="#'.$row["id_servico"].'" role="button" data-slide="next">
  <span class="carousel-control-next-icon" aria-hidden="true"></span>
  <span class="sr-only">Next</span>
</a>
</div>
                        <div class="card-body">
                            <h4 class="card-title grad-txt">'.$row["nome"].'</h4><hr>
                            <p class="text-dark card-subtitle">'.$row["descricao"].'</p><hr>
                            <h5 class="text-dark card-subtitle grad-txt">Preço Base: '.$row["base"].'€</h5><hr>
                                                    

                            <a href="index.php?op=servicepage&id_utilizador='.$row["id_utilizador"].'&id_service='.$row["id_servico"].'" class="btn btn-primary mt-2">+ Info</a>
                        </div>

                    </div>
                </div>';

}


  } else {

      if(isset($_SESSION["utilizador"])) {

    echo '<div class="row justify-content-center"><div class="col-md-8 text-center p-2"> <h1>Ainda não existem serviços associados</h1><h5 class="text-dark"><a href="index.php?op=addservice">Associe um serviço</a><h5></div></div>';

      } else {

        echo '<div class="row justify-content-center"><div class="col-md-8 text-center p-2"> <h1>Ainda não existem serviços associados</h1><h5 class="text-dark"></div></div>';

      }

  }

               
?>

            </div>
        </div>
    </div>

 
