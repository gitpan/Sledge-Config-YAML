use strict;
use Test::More tests => 4;

BEGIN { 
    use_ok 'Sledge::Config::YAML';
    use_ok 'YAML';
}

my $config_dev = Sledge::Config::YAML->new('develop_user', 't/example.yaml');
my $source_dev = {
    datasource => [
        'dbi:mysql:proj',
        'dev_user',
        'dev_pass',
    ],
    tmpl_path => '/path/to/template/proj',
    info_addr => 'kan@example.com',
    favorite  => 'precure',
    session_servers => [
        '127.0.0.1:XXXXX',
    ],
    cache_servers => [
        '127.0.0.1:XXXXX',
    ],
    host => 'proj.dev.example.com',
    validator_message_file => '/path/to/dev_conf/message.yaml',
};

is_deeply($config_dev, $source_dev, 'development');

my $config_product     = Sledge::Config::YAML->new('product', 't/example.yaml');
my $source_product = {
    datasource => [
        'dbi:mysql:proj',
        'proj',
        'pass_xxx',
    ],
    tmpl_path => '/path/to/template/proj',
    info_addr => 'info@proj.example.com',
    favorite  => 'precure',
    session_servers => [
        '111.111.111.1:12345',
    ],
    cache_servers => [
        '222.222.222.2:12345',
    ],
    host => 'proj.example.com',
    validator_message_file => '/path/to/conf/message.yaml',
};

is_deeply($config_product, $source_product, 'product');

