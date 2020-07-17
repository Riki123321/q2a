<?php
class qa_bodyJSON {
    public $interfaceLanguage;
    public $contentLanguage;
    public $service;
    public $endpointUrl;

    public function __construct($cur_interface_lang,$a_interface_lang,$cur_content_lang,$a_content_lang,
                                $cur_service,$a_service)
    {
        $this->interfaceLanguage['current']=$cur_interface_lang;
        $this->interfaceLanguage['available']=$a_interface_lang;
        $this->contentLanguage['current']=$cur_content_lang;
        $this->contentLanguage['available']=$a_content_lang;
        $this->service['current']=$cur_service;
        $this->service['available']=$a_service;
        $this->endpointUrl="/updatePage";

    }
}