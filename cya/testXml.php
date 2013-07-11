<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$doc = new DOMDocument('1.0', 'utf-8');
        $doc->load('product.xml');
        $doc->formatOutput = true;
        $foo = $doc->getElementsByTagName("foo");
        $test = $foo->item(0);

        $bar = $doc->createElement("bar");
        $test->appendChild($bar);
        for ($i = 1; $i < 10; $i++) {
            $bazz = $doc->createElement("bazz");
            $bazz->appendChild($doc->createTextNode('something'));
            $test->appendChild($bazz);
        }

        echo $doc->save('product.xml');
        die;
?>
