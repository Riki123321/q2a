<?php

class qa_indexer_search {

    function index_post($postid, $type, $questionid, $parentid, $title, $content, $format, $text, $tagstring, $categoryid)
    {
        require_once QA_INCLUDE_DIR . 'db/post-create.php';

        // Get words from each textual element

        $titlewords = array_unique(qa_string_to_words($title));
        $contentcount = array_count_values(qa_string_to_words($text));
        $tagwords = array_unique(qa_string_to_words($tagstring));
        $wholetags = array_unique(qa_tagstring_to_tags($tagstring));

        // Map all words to their word IDs

        $words = array_unique(array_merge($titlewords, array_keys($contentcount), $tagwords, $wholetags));
        $wordtoid = qa_db_word_mapto_ids_add($words);

        // Add to title words index

        $titlewordids = qa_array_filter_by_keys($wordtoid, $titlewords);
        qa_db_titlewords_add_post_wordids($postid, $titlewordids);

        // Add to content words index (including word counts)

        $contentwordidcounts = array();
        foreach ($contentcount as $word => $count) {
            if (isset($wordtoid[$word]))
                $contentwordidcounts[$wordtoid[$word]] = $count;
        }

        qa_db_contentwords_add_post_wordidcounts($postid, $type, $questionid, $contentwordidcounts);

        // Add to tag words index

        $tagwordids = qa_array_filter_by_keys($wordtoid, $tagwords);
        qa_db_tagwords_add_post_wordids($postid, $tagwordids);

        // Add to whole tags index

        $wholetagids = qa_array_filter_by_keys($wordtoid, $wholetags);
        qa_db_posttags_add_post_wordids($postid, $wholetagids);

        // Update counts cached in database (will be skipped if qa_suspend_update_counts() was called

        qa_db_word_titlecount_update($titlewordids);
        qa_db_word_contentcount_update(array_keys($contentwordidcounts));
        qa_db_word_tagwordcount_update($tagwordids);
        qa_db_word_tagcount_update($wholetagids);
    }

}