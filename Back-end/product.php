<?php
  $page_title = 'All Product';
  require_once('includes/load.php');
  // Checkin What level user has permission to view this page
   page_require_level(2);
  $products = join_product_table();
?>
<style>
  .row{
    width: 100%;
    height: 100%;
  }
  .panel{
    width: 100%;
    height: 100%;
  }
  .panel-body{
    width: auto;
    height: auto;
    overflow-y: auto;
  }
  .section{
      height: 80%;
  }
</style>
<?php include_once('layouts/header.php'); ?>
  <div class="row">
    <div class="col-md-12">
      <?php echo display_msg($msg); ?>
    </div>

    <div class="col-md-12">
      <div class="panel panel-default">
        <div class="panel-heading clearfix">
          <strong>
            <span class="glyphicon glyphicon-th"></span>
            <span>All Products</span>
          </strong>
          <div class="pull-right">
           <a href="add_product.php" class="btn btn-primary">Add New</a>
          </div>
        </div>
        
        <div class="panel-body" >
          <div class="section">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th class="text-center" style="width: 50px;">STT</th>
                  <th> Photo</th>
                  <th> Product Title </th>
                  <th class="text-center" style="width: 10%;"> Categories </th>
                  <th class="text-center" style="width: 10%;"> In-Stock </th>
                  <th class="text-center" style="width: 10%;"> Buying Price </th>
                  <th class="text-center" style="width: 10%;"> Selling Price </th>
                  <th class="text-center" style="width: 10%;"> Product Added </th>
                  <th class="text-center" style="width: 100px;"> Actions </th>
                </tr>
              </thead>
              <tbody>
                <?php foreach ($products as $product):?>
                <tr>
                  <td class="text-center"><?php echo count_id();?></td>
                  <td>
                    <?php if($product['media_id'] === '0'): ?>
                      <img class="img-avatar img-circle" src="uploads/products/no_image.png" alt="">
                    <?php else: ?>
                    <img class="img-avatar img-circle" src="uploads/products/<?php echo $product['image']; ?>" alt="">
                  <?php endif; ?>
                  </td>
                  <td> <?php echo remove_junk($product['name']); ?></td>
                  <td class="text-center"> <?php echo remove_junk($product['categorie']); ?></td>
                  <td class="text-center"> <?php echo remove_junk($product['quantity']); ?></td>
                  <td class="text-center"> <?php echo remove_junk($product['buy_price']); ?></td>
                  <td class="text-center"> <?php echo remove_junk($product['sale_price']); ?></td>
                  <td class="text-center"> <?php echo read_date($product['date']); ?></td>
                  <td class="text-center">
                    <div class="btn-group">
                      <a href="edit_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-info btn-xs"  title="Edit" data-toggle="tooltip">
                        <span class="glyphicon glyphicon-edit"></span>
                      </a>
                      <a href="delete_product.php?id=<?php echo (int)$product['id'];?>" class="btn btn-danger btn-xs"  title="Delete" data-toggle="tooltip">
                        <span class="glyphicon glyphicon-trash"></span>
                      </a>
                    </div>
                  </td>
                </tr>
              <?php endforeach; ?>
              </tbody>
            </tabel>
          </div>
        </div>
      </div>
    </div>
  </div>
  <?php include_once('layouts/footer.php'); ?>
