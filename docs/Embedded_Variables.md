
# Embedded Variables
| 記載なし | module | Variables | Description |
|:----------:|--------------------------|-----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
|  | ngx_http_core_module | arg_name | リクエスト行の中の 引数のname |
|  | ngx_http_core_module | args | リクエスト行の引数 |
|  | ngx_http_core_module | binary_remote_addr | バイナリ形式のクライアントアドレスで、値の長さはIPv4アドレスの場合は常に4バイト、IPv6アドレスの場合は16バイト |
|  | ngx_http_core_module | body_bytes_sent | 応答ヘッダを含まないクライアントへ送信されるバイト数; この値はmod_log_config Apacheモジュールの"%B"パラメータと互換性があります。 |
|  | ngx_http_core_module | bytes_sent | クライアントに送信されるバイト数 |
|  | ngx_http_core_module | connection | 接続のシリアルナンバー |
|  | ngx_http_core_module | connection_requests | 一つの接続を通して作成される現在のリクエストの数 |
|  | ngx_http_core_module | content_length | Content-Length"リクエストヘッダフィールド |
|  | ngx_http_core_module | content_type | Content-Type"リクエストヘッダフィール |
|  | ngx_http_core_module | cookie_name | クッキーのname |
|  | ngx_http_core_module | document_root | 現在のリクエストのroot または aliasディレクティブ値 |
|  | ngx_http_core_module | document_uri | $uriと同じ |
|  | ngx_http_core_module | host | 以下の優先順位; リクエスト行のホスト名、または"Host"リクエストヘッダフィールドのホスト名、またはリクエストに一致するサーバ名 |
|  | ngx_http_core_module | hostname | ホスト名 |
|  | ngx_http_core_module | http_name | 任意のリクエストヘッダフィールド; 変数名の最後の部分は、ダッシュがアンダースコアで置き換えられた小文字化されたフィールド名 |
|  | ngx_http_core_module | https | 接続操作がSSLモードの場合は "on"、そうでなければ空文字列 |
|  | ngx_http_core_module | is_args | リクエスト行に引数があれば"?"、そうでなければ空文字列 |
|  | ngx_http_core_module | limit_rate | 応答レート制限が有効な場合にはこの値が設定されます; limit_rateを見てください |
|  | ngx_http_core_module | msec | ミリ秒の精度の現在の秒 |
|  | ngx_http_core_module | nginx_version | nginx のバージョン |
|  | ngx_http_core_module | pid | workerプロセスのPID |
|  | ngx_http_core_module | pipe | リクエストがパイプラインされている場合は"p"、そうでなければ"." |
|  | ngx_http_core_module | proxy_protocol_addr | PROXYプロトコルヘッダからのクライアントアドレス、そうでなければ空文字列 |
|  | ngx_http_core_module | proxy_protocol_port | PROXYプロトコルヘッダからのクライアントポート、そうでなければ空文字 |
|  | ngx_http_core_module | query_string | $argsと同じ |
|  | ngx_http_core_module | realpath_root | 現在のリクエストの<c0>root または alias ディレクティブの値に対応する絶対パス; 全てのシンボリックリンクが実際のパスに解決されたもの |
|  | ngx_http_core_module | remote_addr | クライアントのアドレス |
|  | ngx_http_core_module | remote_port | クライアントのポート |
|  | ngx_http_core_module | remote_user | Basic認証で提供されたユーザ名 |
|  | ngx_http_core_module | request | 完全なオリジナルリクエスト行 |
|  | ngx_http_core_module | request_body | リクエストボディ |
|  | ngx_http_core_module | request_body_file | リクエストボディの一時ファイル名 |
|  | ngx_http_core_module | request_completion | リクエストが完了した場合は"OK"、そうでなければ空文字列 |
|  | ngx_http_core_module | request_filename | 現在のリクエストのファイルパスは、root または aliasディレクティブと、リクエストのURIに基づきます。 |
|  | ngx_http_core_module | request_id | unique request identifier |
|  | ngx_http_core_module | request_length | リクエストの長さ(リクエスト行、ヘッダとリクエストボディを含む) |
|  | ngx_http_core_module | request_method | リクエストメソッドは、通常 "GET"または"POST" |
|  | ngx_http_core_module | request_time | ミリ秒の精度のリクエストの処理の秒数 |
|  | ngx_http_core_module | request_uri | 完全なオリジナルのリクエストURI |
|  | ngx_http_core_module | scheme | リクエストのスキーム、"http"または"https" |
|  | ngx_http_core_module | sent_http_name | 任意の応答ヘッダフィールド; 変数名の最後の部分は、ダッシュがアンダースコアで置き換えられた小文字化されたフィールド名 |
|  | ngx_http_core_module | server_addr | リクエストを受け付けたサーバのアドレス |
|  | ngx_http_core_module | server_name | リクエストを受け付けたサーバの名前 |
|  | ngx_http_core_module | server_port | リクエストを受け付けたサーバのポート |
|  | ngx_http_core_module | server_protocol | リクエストプロトコル、通常"HTTP/1.0"、"HTTP/1.1"あるいは"HTTP/2.0" |
|  | ngx_http_core_module | time_iso8601 | ISO 8601 標準フォーマットのローカルタイム |
|  | ngx_http_core_module | time_local | Common Log フォーマットのローカルタイム |
|  | ngx_http_core_module | uri | リクエスト中の現在のURI、正規化されたもの |
| * | ngx_http_core_module | sent_http_content_type | レスポンスヘッダーの Content-Type |
| * | ngx_http_core_module | sent_http_content_length | レスポンスヘッダフィールド |
| * | ngx_http_core_module | sent_http_location | レスポンスヘッダのLocation |
| * | ngx_http_core_module | sent_http_last_modified | レスポンスヘッダの最終変更時間 |
| * | ngx_http_core_module | sent_http_transfer_encoding | レスポンスヘッダの Transfer-Encoding |
| * | ngx_http_core_module | sent_http_cache_control | レスポンスヘッダの Cache-Control |
|  | ngx_http_core_module | http_host | Host名とport番号。 |
|  | ngx_http_core_module | http_user_agent | アクセス元のユーザーエージェント |
|  | ngx_http_core_module | http_referer | アクセス元がどこから来たか |
|  | ngx_http_core_module | http_x_forwarded_for | プロキシサーバ経由時の大元の接続元IPアドレス |
|  | ngx_http_proxy_module | proxy_host | proxy_pass ディレクティブの中で指定されたプロキシされる差分の名前とポート番号 |
|  | ngx_http_proxy_module | proxy_port | proxy_pass ディレクティブの中で指定されたプロキシされるサーバのポート番号、あるいはプロトコルのデフォルトのポート番号 |
|  | ngx_http_proxy_module | proxy_add_x_forwarded_for | X-Forwarded-Forクライアントリクエストヘッダフィールドと$remote_addr 変数がカンマで区切られて追加されるでしょう。 |
|  | ngx_http_ssl_module | ssl_cipher | SSL接続を確立するために使われたcipherの文字を返します |
|  | ngx_http_ssl_module | ssl_protocol | 確立されたSSL接続のプロトコルを返します |
|  | ngx_http_ssl_module | ssl_server_name | SNIを使ってリクエストされたサーバ名を返します |
|  | ngx_http_ssl_module | ssl_client_verify | クライアント証明書検証エラーの場合、$ssl_client_verify 変数には、失敗した理由の文字列（例：”FAILED：certificate has expired” ）が含まれるようになりました。 |
|  | ngx_http_upstream_module | upstream_addr | upstreamサーバのIPアドレスとポート、あるいはUNIXドメインソケットのパスを保持します。 |
|  | ngx_http_upstream_module | upstream_cache_status | 応答キャッシュへのアクセス状況を保持します。ステータスは “MISS”, “BYPASS”, “EXPIRED”, “STALE”, “UPDATING”, “REVALIDATED” あるいは “HIT”のいずれかかです。 |
|  | ngx_http_upstream_module | upstream_connect_time | upstreamサーバと接続を確立するまでの時間を保持します |
|  | ngx_http_upstream_module | upstream_cookie_name | Set-Cookie応答ヘッダフィールドの中のupstreamサーバによって送信された指定されたnameのクッキー |
|  | ngx_http_upstream_module | upstream_header_time | upstreamサーバから応答ヘッダを受け取るまでの時間を保持します |
| * | ngx_http_upstream_module | upstream_http_name | サーバの応答ヘッダフィールドを保持します。例えば、$upstream_http_server変数を使って"Server"応答ヘッダフィールドを利用できます。 |
| * | ngx_http_upstream_module | upstream_response_length | upstreamサーバから取得した応答の長さを保持します(0.7.27); 長さはバイトで保持されます。 |
| * | ngx_http_upstream_module | upstream_response_time | upstreamサーバから応答ヘッダを受け取るまでの時間を保持します。 |
| * | ngx_http_upstream_module | upstream_status | upstreamサーバから取得したステータスコードを保持します。 |