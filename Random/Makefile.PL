use ExtUtils::MakeMaker;
my %options = %{
{
  'TYPEMAPS' => [
    '../typemap'
  ],
  'NAME' => 'Math::GMPf::Random',
  'LIBS' => $LIBS,
  'INC' => $INC,
  'VERSION_FROM' => 'Random.pm'
}
};
WriteMakefile(%options);

# Remove the Makefile dependency. Causes problems on a few systems.
sub MY::makefile { '' }
