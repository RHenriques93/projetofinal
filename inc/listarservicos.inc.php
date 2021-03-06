<?php
if(isset($_SESSION['id_utilizador'])){

require("db_projetofinal.php");
$id = $_SESSION["id_utilizador"];
?>

<div class="container py-3">

<nav aria-label="breadcrumb">
  <ol class="breadcrumb grad">
        <li class="breadcrumb-item"><a class="text-white font-weight-bold" href="index.php?op=userpage">Perfil</a></li>
        <li class="breadcrumb-item active text-light" aria-current="page">Seus Serviços</li>
  </ol>
</nav>



    <section class="mb-4">
    <header class="col-md-12 mb-4">
                    <h2 class="text-center text-dark">Os Seus Serviços</h2>
                    <span class="underline mb-3"></span>
            </header>

<?php
   
  

  $dados = $db->query("SELECT subarea.nome, area.nome AS 'area nome', servico.descricao, servico.id_subarea AS 'servico associado', servico.id_servico FROM servico JOIN utilizador ON servico.id_utilizador = utilizador.id_utilizador JOIN subarea ON servico.id_subarea = subarea.id_subarea JOIN area ON subarea.id_area = area.id_area WHERE utilizador.id_utilizador = $id");
     
  
  
  $dados->execute();
  if ($dados->rowCount() > 0)
  {
    foreach($dados as $row) {
    

      echo '<div class="row justify-content-center">
                <div class="col-md-5 text-center p-2"> 

                    <ul class="list-group bg-white rounded">
                         <li class="list-group-item f-12 font-weight-bold"><a href="index.php?op=gerirservicos&idservico='.$row["id_servico"].'">'.$row["area nome"].' / <span class="grad-txt">'.$row["nome"].'</span></a></li>
                   </ul>

               </div>
            </div>';
    
    }
   
  
} else {

echo '<div class="row justify-content-center"><div class="col-md-5 text-center p-2"> <h1>Ainda não tem serviços associados à sua conta. Associe um serviço.</div></div>';

}
  


  
}

  ?>

    <div class="row justify-content-center">
      <div class="col-md-4 mt-4">
        <button class="btn btn-grad grad col-12 mb-2"><h5><a class="text-light" href="index.php?op=addservice">Associar Serviço</a></h5></button>
      </div>
    </div>
  </div>
</div>