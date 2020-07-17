<?php
function qa_lang($identifier)
{
    if (qa_to_override(__FUNCTION__)) { $args=func_get_args(); return qa_call_override(__FUNCTION__, $args); }

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
        }
        else {
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
