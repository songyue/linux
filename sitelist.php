<?php
/**
 * File Name: sitelist.php
 * Author: songyue
 * mail: songyue118@gmail.com
 * Created Time: 2018年09月30日 星期日 18时17分13秒
 */

// 设置host cookie
if(isset($_GET['target_host'])){
    setcookie('target_host',$_GET['target_host']);
    header("Location:/");
}
?>
<html>
<head>
<title>站点列表</title>
</head>
<h3>站点列表</h3>
<a href="?target_host=yaf_app.local">yaf_app</a>
<pre>
<?php 
if(isset($_GET['phpinfo'])) print_r($_SERVER);?> 
</pre>
</html>
