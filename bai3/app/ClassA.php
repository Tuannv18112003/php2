<?php

    namespace App;

    class ClassA
    {
        public function getClass()
        {
            echo self::class . "<br />";
            echo static::class . "<br />";
        }
    }