function my_project_updated_send_email( $post_id ) {

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
add_action( 'save_post', 'my_project_updated_send_email' );
