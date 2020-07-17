<?php

class qa_update_page
{

    function match_request($request)
    {
        return ($request=="updatePage");
    }

    public function process_request($request)
    {
        $qa_content = qa_content_prepare();

        $qa_content['title'] = qa_lang_html('updatePage');

        return $qa_content;
    }
}