<?php

class qa_set_cookie{

    public static function set_cookie($language,$service,$interfaceLanguage)
    {
        setcookie('siteModeLang',$language);
        setcookie('siteModeService',$service);
        setcookie('interfaceLanguage',$interfaceLanguage);
    }
}