<?php
namespace App;
class Router{
    public static $routers = [];
    
    public static function get($path, $callback) {
        static::$routers['get'][$path] = $callback;
    }

    public static function post($path, $callback) {
        static::$routers['post'][$path] = $callback;
    }

    public function getPath() {
        $path = $_SERVER['REQUEST_URI'];
        $path = str_replace('/php2/Demo/Bai4/public/', "/",$path);

        $postion = strpos($path, '?');  // strpos: tìm vị trí string cần chỉ định, trả về index
        if ($postion) {
            $path = substr($path, 0, $postion); // trả về đoạn text cần tìm kiếm
            return $path;
        }
        
        return $path;
    }

    public function getMethod() {
        return strtolower($_SERVER['REQUEST_METHOD']);
    }

    public function resolve() {
        $path = $this->getPath();
        $method = $this->getMethod();
        $callback = false;


        if(isset(static::$routers[$method][$path])) {
            $callback = static::$routers[$method][$path];
        }

        if($callback === false) {
            echo "404 FILE NOT FOUND";
            return  0;
        }

        if(is_callable($callback)) {
            return $callback();
        }

        if(is_array($callback)) {
            [$class, $action] = $callback;
            $class = new $class();
            return call_user_func_array([$class, $action], []);
        }

        
    }
}