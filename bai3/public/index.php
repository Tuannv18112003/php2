<?php
    // require_once __DIR__ . "/../app/BankModel.php";
    // require_once __DIR__ . "/../app/BankHD.php";
    // require_once __DIR__ . "/../app/ClassA.php";
    // require_once __DIR__ . "/../app/ClassB.php";

    // spl_autoload_register(function ($class)
    // {
    //     $path = lcfirst(str_replace("\\", "/", $class));
    // });
    require_once __DIR__ . "/../vendor/autoload.php";
    
    use App\BankHD;
    $bank = new BankHD;

    // $bank = new App\BankHD;

    $bank->tranfer(100);

    echo "<br />" . BankHD::PI;

    echo "<br />" . BankHD::$name;

    // :: truy cập trực tiếp

    // $classA = new App\ClassA;
    // $classB = new App\ClassB;
    $classC = new App\ClassC;
    $classD = new App\ClassD;

    $classC->show();
    $classD->show();

