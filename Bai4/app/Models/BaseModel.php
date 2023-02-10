<?php

namespace App\Models;

use PDO;
use PDOException;

class BaseModel
{
    protected $conn;
    protected $sqlBuilder;
    protected $tableName;
    public function __construct()
    {
        try {
            $this->conn = new PDO("mysql:host=localhost;dbname=we3014_01;
            charset=utf8", "root", "");
        } catch (PDOException $e) {
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
        foreach ($data as $key => $val) {
            $colNames .= "`$key`, ";
            $params .= ":$key, ";
        }



        // Loại bỏ dấu ' , ' ở cuối chuỗi 
        $colNames = rtrim($colNames, ', ');
        $params = rtrim($params, ', ');


        // Nối vào câu lệnh SQL
        $this->sqlBuilder .= $colNames . ") VALUES(" . $params . ")";
        $stmt = $this->conn->prepare($this->sqlBuilder);
        $stmt->execute($data);
    }


    public static function findOne($id)
    {
        $model = new static();
        $model->sqlBuilder = "SELECT * FROM $model->tableName WHERE 
        id='$id'";
        $stmt = $model->conn->prepare($model->sqlBuilder);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_CLASS, get_class($model));
        // Nếu có dữ liệu
        if ($result > 0) {
            return $result[0];
        }
        return $model;
    }


    /**
     * function update: cập nhật dữ liệu
     * @param array: là mảng dữ liệu cẩn cập nhật 
     */

    public function update($data = [])
    {
        $this->sqlBuilder = "UPDATE $this->tableName SET ";
        foreach ($data as $key => $value) {
            $this->sqlBuilder .= "`$key` =:$key, ";
        }

        $this->sqlBuilder = rtrim($this->sqlBuilder, ", ");
        $this->sqlBuilder .= "WHERE id=:id";
        // $this->id lấy từ hàm findOne 
        if ($this->id) {
            $data['id'] = $this->id;
            $stmt = $this->conn->prepare($this->sqlBuilder);
            $stmt->execute($data);
            return true;
        }
        return false;
    }


    public function delete($id)
    {
        $this->sqlBuilder .= "DELETE FROM $this->tableName WHERE id='$id'";
        $stmt = $this->conn->prepare($this->sqlBuilder);
        $stmt->execute();
    }

    public function where($col, $cod, $value)
    {
        $this->sqlBuilder = "SELECT * FROM $this->tableName WHERE
        `$col` $cod '$value'";
        return $this;
    }

    public function andWhere($col, $cod, $value)
    {
        $this->sqlBuilder .= " AND `$col` $cod '$value'";
        return $this;
    }

    public function orWhere($col, $cod, $value)
    {
        $this->sqlBuilder .= " OR `$col` $cod '$value'";
        return $this;
    }

    public function get()
    {
        $stmt = $this->conn->prepare($this->sqlBuilder);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_CLASS);
        return $result;
    }
}
