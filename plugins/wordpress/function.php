function lua_cache_purge( $post_id ) {

	$post_url = get_permalink( $post_id );

	$request = curl_init();
	curl_setopt($request, CURLOPT_URL, $post_url);
	curl_setopt($request, CURLOPT_CUSTOMREQUEST, "PURGE");
	$error = curl_exec($request);
	curl_close($request);

	if ($error != nil) {
		die($error);
	}
}
add_action( 'save_post', 'lua_cache_purge' );
