<?php

class a_data {
    public static function verifyData($contentLanguage,$service)
    {
        $v_languages=['pol','eng'];
        $v_services=['booking','shop'];

        $a_services=unserialize($_SESSION['a_services']);
        $a_languages=unserialize($_SESSION['a_languages']);
        $escape_flag=0; // uzywane gdy probowany jest uzyskanie dostepu bez praw
        //session_start();
        foreach ($v_languages as $lang) {
            if ($lang == $contentLanguage) {
                $escape_flag++;
            }
        }
        foreach ($v_services as $serv) {
            if ($serv== $service) {
                $escape_flag++;
            }
        }
        foreach ($a_languages as $lang) {
            if ($lang == $contentLanguage) {
                $escape_flag++;
            }
        }
        foreach ($a_services as $serv) {
            if ($serv['id'] == $service) {
                $escape_flag++;
            }
        }
        if ($escape_flag!=4) {    // Jezeli przyslane dane przechodza weryfikacje nanosimy zmiane w bazie
            return false;
        }
        return true;
    }
}