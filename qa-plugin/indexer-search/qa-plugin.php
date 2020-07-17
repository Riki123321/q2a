<?php


if (!defined('QA_VERSION')) {
    //s
    header('Location: ../../');
    exit;
}
qa_register_plugin_module('search', 'qa-indexer-search.php', 'qa_indexer_search', 'New indexer plugin');
