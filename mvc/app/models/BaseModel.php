<?php
namespace App\Models;
use PDO;
use PDOException;

class BaseModel {
    protected $conn;
    protected $sqlBuilder;
    protected $tableName;
    public function __construct()
    {
        try {
            $this->conn = new PDO("mysql:host=localhost;dbname=we3014_01;
            charset=utf8", "root", "");
        }catch(PDOException $e) {
            throw $e->getMessage();
        }
    }


    public static function all() 
    {
        $model = new static();
        $model->sqlBuilder = "SELECT * FROM $model->tableName";
        $stmt = $model->conn->prepare($model->sqlBuilder);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_CLASS);
        return $result;
    }

    public function insert($data = []) 
    {
        $this->sqlBuilder = "INSERT INTO $this->tableName(";

        $colNames = '';
        $params = '';

        // Lấy tên cột, và tên tham số từ mảng data
        foreach ( $data as $key => $val ) {
            $colNames .= "`$key`, ";
            $params .= ":$key, ";
        }

        echo $params;


        // Loại bỏ dấu ' , ' ở cuối chuỗi 
        $colNames = rtrim($colNames, ', ');
        $params = rtrim($params, ', ');


        // Nối vào câu lệnh SQL
        $this->sqlBuilder .= $colNames . ") VALUES(" . $params . ")";
        $stmt = $this->conn->prepare($this->sqlBuilder);
        $stmt->execute($data);
    }

}