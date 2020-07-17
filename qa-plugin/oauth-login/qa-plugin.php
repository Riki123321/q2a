<?php

if (!defined('QA_VERSION')) {
	header('Location: ../../');
	exit;
}
qa_register_plugin_module('process','qa-override-hack.php','gigaHack','GIGAHACK');
qa_register_plugin_module('login', 'qa-oauth-login.php', 'qa_oauth_login', 'Oauth login plugin');
//qa_register_plugin_module('layer', 'qa-oauth-layer.php', 'qa_oauth_layer', 'Oauth json layer');
qa_register_plugin_layer('qa-oauth-layer.php', 'JSON layer');
qa_register_plugin_module('page', 'qa-update-page.php', 'qa_update_page', 'Database update page');

