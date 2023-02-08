<?php 

//  interface không thể include thuộc tính

namespace App;

interface InterfaceModel 
{
    
    public function show();
    public function insert($name);
    public function create($color); 
}
