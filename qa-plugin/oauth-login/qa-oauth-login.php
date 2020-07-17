<?php
require_once PROJECT_ROOT."/qa-plugin/oauth-login/qa-set-language.php";
require_once PROJECT_ROOT."/qa-plugin/oauth-login/qa-bodyJSON.php";

class qa_oauth_login
{
    /**
     * G
     * @return bool|string Return access_token
     */
    function getAccessToken()
    {
        $ch = curl_init('http://trening10.iai-shop.com/panel/action/authorize/access_token');
        $post = [
            'grant_type' => 'authorization_code',
            'client_id' => 'q2aid',
            'client_secret' => 'q2asecret',
            'redirect_uri' => 'https://q2a.idosell.com',
            'code' => urldecode($_GET['code']),
        ];
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

        $response = curl_exec($ch);
        curl_close($ch);
        return $response;
    }

    /**
     * Function is checking if signature is signed by by proper private key
     * @param $token Part of JWT with data and signature
     * @return int
     */
    function verifyToken($token)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://trening10.iai-shop.com/panel/action/authorize/public_key");
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $public_key = curl_exec($ch);
        curl_close($ch);
        $JWTexploded = explode(".", $token['id_token']);
        $signature = base64_decode(strtr($JWTexploded[2], '-_', '+/'));
        $ok = openssl_verify(utf8_decode($JWTexploded[0]) . '.' . utf8_decode($JWTexploded[1]),
            $signature, $public_key, OPENSSL_ALGO_SHA256);

        if ($ok) {
            return 1;
        } else {
            return 0;
        }
    }

    /**
     *
     */
    function check_login()
    {
        $url = urlencode('https://q2a.idosell.com');

            if (isset($_GET['code'])) {

                $json = json_decode($this->getAccessToken(), true);
                if ($this->verifyToken($json)) {
                    $JWTexploded = explode(".", $json['id_token']);
                    $json2 = json_decode(base64_decode($JWTexploded[1]), true);
                    $username = ($json2['profile']['preferred_username']);
                    $email = $json2['email']['email'];
                    $fields =
                        [
                            'handle' => $username,
                            'email' => $email,
                            'name' => $username,
                        ];
                    qa_log_in_external_user("IAI", $email, $fields);
                    $lang="pol";
                    $a_services= array(array(
                        'id' => 'shop',
                        'name' =>  ('IdoSell Shop')),array(
                        'id' => 'booking',
                        'name' => ('IdoSell Booking')));
                    //$a_services=['shop','booking'];

                    $a_languages=['pol','eng'];
                    $project="booking";

                    qa_set_language::set_language($lang,$project,'pol');
                    $toSet=qa_set_language::get_last_siteMode();
                    qa_set_cookie::set_cookie($toSet['lang'],$toSet['service'],$toSet['Ilang']);

                    $_SESSION['a_services']=serialize($a_services);
                    $_SESSION['a_languages']=serialize($a_languages);
                    header('Location: /');
                }
            } else {
                if ($_SERVER["SCRIPT_NAME"]=='/login') {
                    $response_type = 'response_type=code';

                    $client_id = 'client_id=q2aid';
                    $redirect_uri = 'redirect_uri=' . $url;
                    $scope = 'scope=openid profile api-pa email';
                    $state = 'state=a';
                    header('Location: https://trening10.iai-shop.com/panel/action/authorize/authorize?'
                        . $response_type . '&' . $client_id . '&' . $redirect_uri . '&' . $scope . '&' . $state);
                    die;
                }
            }
    }

    function qa_log_in_external_user()
    {

    }


}