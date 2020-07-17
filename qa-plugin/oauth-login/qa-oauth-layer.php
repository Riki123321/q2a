<?php
require_once PROJECT_ROOT."/qa-plugin/oauth-login/qa-set-language.php";
require_once PROJECT_ROOT."/qa-plugin/oauth-login/qa-set-cookie.php";
require_once PROJECT_ROOT."/qa-plugin/oauth-login/qa-bodyJSON.php";
require_once PROJECT_ROOT."/qa-plugin/oauth-login/available_data.php";
class qa_html_theme_layer extends qa_html_theme_base
{
    public function body_script()
    {

        if (qa_is_logged_in()) {

            if (isset($_POST['interfaceLanguage']) && isset($_POST['contentLanguage']) &&   //Wykrycie posta ze zmiana stanu strony
                isset($_POST['service']) && $_SERVER['PHP_SELF']=='/updatePage')
            {

                $interfaceLanguage=($_POST['interfaceLanguage'] == 'pol' ? 'pol' : 'eng');
                if (a_data::verifyData($_POST['contentLanguage'],$_POST['service'])) {
                    qa_set_language::update_siteMode($_POST['contentLanguage'],$_POST['service'],$_POST['interfaceLanguage']);
                }
                header('Location: ' . $_SERVER['HTTP_REFERER']);
            }

                $siteMode = qa_set_language::get_last_siteMode();   // Jezeli nie dostalismy posta
                qa_set_cookie::set_cookie($siteMode['lang'], $siteMode['service'], $siteMode['Ilang']);

            $a_services = unserialize($_SESSION['a_services']);
            $a_interface_lang = ["pol", "eng"];
            $a_content_lang = unserialize($_SESSION['a_languages']);
            $c_service = array(
                'id' => $_COOKIE['siteModeService'],
                'name' => ('IdoSell shop')
            );


            $json = json_encode(new qa_bodyJSON($_COOKIE['interfaceLanguage'], $a_interface_lang, $_COOKIE['siteModeLang'],
                $a_content_lang, $c_service, $a_services));
            $this->output(
                "
                <script> 
                    var User = $json; 
                    console.log(User);
                </script> 
         "
            );

        }
        else {
            if (!isset($_COOKIE['interfaceLanguage'])) {
                $languageHeader = getallheaders()["Accept-Language"];
                $browserLang = explode(',', $languageHeader);
                $browserLang[0] == 'pl-PL' ? setcookie('interfaceLanguage', 'pol') : setcookie('interfaceLanguage', 'eng');
            }


            qa_html_theme_base::body_script();
        }
    }
}
