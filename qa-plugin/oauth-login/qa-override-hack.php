<?php


class gigaHack
{

    function init_page()
    {
        global $qa_overrides, $qa_direct;
        $qa_overrides['qa_lang'] = 'qa_lang_override';
        $qa_overrides['body_script'] = 'body_script_override';
        //$qa_overrides['qa_db_add_table_prefix']='qa_db_add_table_prefix_override';

        function qa_lang_override($identifier)
        {

            global $qa_lang_file_pattern, $qa_phrases_full;
            list($group, $label) = explode('/', $identifier, 2);

            if (isset($qa_phrases_full[$group][$label]))
                return $qa_phrases_full[$group][$label];

            if (!isset($qa_phrases_full[$group])) {
                // load the default language files
                if (isset($qa_lang_file_pattern[$group]))
                    $include = str_replace('*', 'default', $qa_lang_file_pattern[$group]);
                else
                    $include = QA_INCLUDE_DIR . 'lang/qa-lang-' . $group . '.php';

                $qa_phrases_full[$group] = is_file($include) ? (array)(include_once $include) : array();

                // look for a localized file in qa-lang/<lang>/
                if (isset($_COOKIE['interfaceLanguage'])) {
                    $lang = ($_COOKIE['interfaceLanguage'] == 'pol' ? 'pl' : 'en-US');
                } else {
                    $lang = 'pl';
                }
                $languagecode = $lang;
                if (strlen($languagecode)) {
                    if (isset($qa_lang_file_pattern[$group]))
                        $include = str_replace('*', $languagecode, $qa_lang_file_pattern[$group]);
                    else
                        $include = QA_LANG_DIR . $languagecode . '/qa-lang-' . $group . '.php';

                    $phrases = is_file($include) ? (array)(include $include) : array();
                    $qa_phrases_full[$group] = array_merge($qa_phrases_full[$group], $phrases);
                }

                // add any custom phrases from qa-lang/custom/
                $include = QA_LANG_DIR . 'custom/qa-lang-' . $group . '.php';
                $phrases = is_file($include) ? (array)(include $include) : array();
                $qa_phrases_full[$group] = array_merge($qa_phrases_full[$group], $phrases);

                if (isset($qa_phrases_full[$group][$label]))
                    return $qa_phrases_full[$group][$label];
            }

            return '[' . $identifier . ']'; // as a last resort, return the identifier to help in development
        }
/*
        function qa_db_add_table_prefix_override($rawname)
        {
            if (qa_to_override(__FUNCTION__)) { $args=func_get_args(); return qa_call_override(__FUNCTION__, $args); }

            $prefix = QA_MYSQL_TABLE_PREFIX;

            if (defined('QA_MYSQL_USERS_PREFIX')) {
                switch (strtolower($rawname)) {
                    case 'users':
                    case 'userlogins':
                    case 'userprofile':
                    case 'userfields':
                    case 'messages':
                    case 'cookies':
                    case 'blobs':
                    case 'cache':
                    case 'userlogins_ibfk_1': // also special cases for constraint names
                    case 'userprofile_ibfk_1':
                        $prefix = QA_MYSQL_USERS_PREFIX;
                        break;
                }
            }

            return $prefix . $rawname;
        }
*/
    }
}
