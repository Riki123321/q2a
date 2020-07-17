<?php

require_once PROJECT_ROOT.'/qa-plugin/oauth-login/qa-set-cookie.php';
require_once PROJECT_ROOT.'/qa-include/db/metas.php';
    class  qa_set_language
    {
        public static function set_language($language,$service,$interfaceLanguage)
        {

            $userID=qa_get_logged_in_userid();
            $select_query="SELECT selected_language,selected_service FROM qa_usermeta WHERE user_id = #;";
            $select_result=qa_db_query_sub($select_query,$userID);
            if (mysqli_num_rows($select_result)==0)
            {
                $query="INSERT INTO qa_usermeta VALUES (#,#,#,#)";
                qa_db_query_sub($query,$userID,$language,$service,$interfaceLanguage);
            }

        }

        public static function update_siteMode($language,$service,$interfaceLanguage)
        {
            $userID=qa_get_logged_in_userid();
            $update_query = "UPDATE qa_usermeta
                        SET selected_language = #, selected_service = #, selected_interface_language=#
                        WHERE user_id = $;";
             qa_db_query_sub($update_query,$language,$service,$interfaceLanguage,$userID);
        }

        public static function get_last_siteMode()
        {
            $userID=qa_get_logged_in_userid();
            $select_query="SELECT selected_language,selected_service,selected_interface_language
                        FROM qa_usermeta WHERE user_id = $;";
            $select_result=qa_db_query_sub($select_query,$userID);
            $return_array=array();
            while ($row = $select_result->fetch_assoc()) {
                $return_array['lang']=$row['selected_language'];
                $return_array['service']=$row['selected_service'];
                $return_array['Ilang']=$row['selected_interface_language'];
            }
            return $return_array;
        }
    }