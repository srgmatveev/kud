use ExtUtils::MakeMaker;

WriteMakefile(
    NAME            => 'kud',
    VERSION_FROM    => 'bin/get_last_kernel.pl'
);
