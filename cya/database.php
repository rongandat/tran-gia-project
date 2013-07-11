<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
error_reporting(E_ALL);
class dataBase {

    private $localhost = 'localhost';
    private $user_name = 'root';
    private $password = '';
    private $dbname = 'zodia';
    private $result;
    private $_fetchMode = "FETCH_OBJ";
    
//    private $localhost = 'localhost';
//    private $user_name = 'root';
//    private $password = '';
//    private $dbname = 'sanbox';
//    private $result;
//    private $_fetchMode = "FETCH_OBJ";
    
    public function __construct() {
        $this->connect();
    }

    public function setConnect($localhost = null, $user_name = null, $password = null) {
        if ($localhost)
            $this->localhost = $localhost;
        if ($user_name)
            $this->user_name = $user_name;
        if ($password)
            $this->password = $password;
    }

    public function connect() {
        try {
            $this->connection = @mysql_connect(
                            $this->localhost, $this->user_name, $this->password, TRUE
            ) ;
            @mysql_select_db($this->dbname, $this->connection);
            $this->query("SET NAMES 'utf8'");
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function query($query) {
        try {
            if (is_resource($this->connection)) {
                if (is_resource($this->result)) {
                    @mysql_free_result($this->result);
                }
                $this->result = mysql_query($query, $this->connection);
                return $this->result;
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function fetchRow($query = null) {
        try {
            if ($query) {
                $this->result = $this->query($query);
            }

            if (is_resource($this->result)) {
                // Check Fetch Mode
                // FETCH_OBJ
                if ($this->_fetchMode == "FETCH_OBJ") {
                    $row = mysql_fetch_object($this->result);
                    if (is_object($row)) {
                        return $row;
                    }


                    // FETCH_ASSOC
                } else if ($this->_fetchMode == "FETCH_ASSOC") {
                    $row = mysql_fetch_assoc($this->result);
                    if (is_array($row)) {
                        return $row;
                    }


                    // FETCH_ARRAY
                } else {
                    $row = mysql_fetch_array($this->result);
                    if (is_array($row)) {
                        return $row;
                    }
                }
                return FALSE;
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    function fetchAll($query = null) {
        try {
            if ($query) {
                $this->result = $this->query($query);
            }

            if (is_resource($this->result)) {
                $obj = NULL;
                while ($rs = $this->fetchRow())
                    $obj[] = $rs;
                @mysql_free_result($this->result);
                return $obj;
            }
            return false;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    function insert() {
        try {
            if (is_array($data)) {
                //TODO Nối các field lại với nhau dưới dạng array
                foreach ($data as $key => $value) {
                    $insert_field[] = $key;
                    $insert_value[] = $value;
                }

                //TODO Nối các field lại với nhau dưới dạng text sql
                $insert_field = implode(", ", $insert_field);
                $insert_value = implode("', '", $insert_value);

                //TODO INSERT SQL
                $insert = $this->query("INSERT INTO $table ($insert_field) VALUES ('$insert_value')");
                if ($insert) {
                    //TODO Trả về id vừa insert
                    return $this->lastInsertId();
                }
                return false;
            } else {
                return false;
            }
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
    function lastInsertId() {
        try {
            return @mysql_insert_id();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

}

?>
