use ExtUtils::MakeMaker;
WriteMakefile(
        'NAME'         => 'Sledge::Config::YAML',
        'VERSION_FROM' => 'lib/Sledge/Config/YAML.pm', # finds $VERSION
        'PREREQ_PM'    => {
                Test::More     => 0.32,
                Sledge::Config => 0.12,
                YAML           => 0.39,
        },
);
