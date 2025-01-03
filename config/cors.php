<?php

return [
    /*
    |--------------------------------------------------------------------------
    | Laravel CORS Configuration
    |--------------------------------------------------------------------------
    |
    | Here you may configure your settings for Cross-Origin Resource Sharing
    | or "CORS". The settings here allow you to control which origins, headers,
    | and methods are allowed for requests to your application.
    |
    */

    /*
    |--------------------------------------------------------------------------
    | Supports Credentials
    |--------------------------------------------------------------------------
    |
    | If you want to allow browsers to include credentials (cookies, HTTP
    | authentication, and client-side SSL certificates) in cross-origin
    | requests, you may enable this option.
    |
    | Default: false
    |
    */

    'supports_credentials' => false,

    /*
    |--------------------------------------------------------------------------
    | Allowed Origins
    |--------------------------------------------------------------------------
    |
    | This setting determines which origins are allowed to make cross-origin
    | requests to your application. By default, all origins are allowed to
    | send requests, but you can specify specific origins here.
    |
    | Default: ['*']
    |
    */

    'allowed_origins' => ['*'],  // You can specify specific origins like ['https://example.com']

    /*
    |--------------------------------------------------------------------------
    | Allowed Origin Patterns
    |--------------------------------------------------------------------------
    |
    | This allows you to specify patterns for which origins are allowed.
    | You can use wildcard characters to match multiple origins.
    |
    | Default: []
    |
    */

    'allowed_origins_patterns' => [],

    /*
    |--------------------------------------------------------------------------
    | Allowed Headers
    |--------------------------------------------------------------------------
    |
    | This setting allows you to specify which headers are allowed when making
    | a request. By default, all headers are allowed.
    |
    | Default: ['*']
    |
    */

    'allowed_headers' => ['*'],  // You can specify headers like ['Content-Type', 'X-Requested-With']

    /*
    |--------------------------------------------------------------------------
    | Allowed Methods
    |--------------------------------------------------------------------------
    |
    | Here you can specify which HTTP methods (verbs) are allowed for cross-origin
    | requests. You can also use '*' to allow all methods (e.g., GET, POST, PUT).
    |
    | Default: ['*']
    |
    */

    'allowed_methods' => ['*'],  // You can specify methods like ['GET', 'POST', 'PUT']

    /*
    |--------------------------------------------------------------------------
    | Exposed Headers
    |--------------------------------------------------------------------------
    |
    | This setting allows you to specify which headers are safe to expose
    | to the browser during a cross-origin request.
    |
    | Default: []
    |
    */

    'exposed_headers' => [],

    /*
    |--------------------------------------------------------------------------
    | Max Age
    |--------------------------------------------------------------------------
    |
    | The maximum amount of time (in seconds) that the results of a preflight
    | request can be cached by the browser.
    |
    | Default: 0
    |
    */

    'max_age' => 0,

    /*
    |--------------------------------------------------------------------------
    | Allowed Hosts
    |--------------------------------------------------------------------------
    |
    | This option allows you to limit requests to specific hosts, e.g., "example.com".
    | You can leave this as an empty array if you do not want to restrict hosts.
    |
    | Default: []
    |
    */

    'hosts' => [],
];
