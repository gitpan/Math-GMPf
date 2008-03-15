    package Math::GMPf;
    use strict;
    require Exporter;
    *import = \&Exporter::import;
    require DynaLoader;

use overload
    '+'    => \&overload_add,
    '-'    => \&overload_sub,
    '*'    => \&overload_mul,
    '/'    => \&overload_div,
    '+='   => \&overload_add_eq,
    '-='   => \&overload_sub_eq,
    '*='   => \&overload_mul_eq,
    '/='   => \&overload_div_eq,
    '""'   => \&overload_string,
    '>'    => \&overload_gt,
    '>='   => \&overload_gte,
    '<'    => \&overload_lt,
    '<='   => \&overload_lte,
    '<=>'  => \&overload_spaceship,
    '=='   => \&overload_equiv,
    '!='   => \&overload_not_equiv,
    '!'    => \&overload_not,
    'not'  => \&overload_not,
    '='    => \&overload_copy,
    'abs'  => \&overload_abs,
    '**'   => \&overload_pow,
    '**='  => \&overload_pow_eq,
    'int'  => \&overload_int,
    'sqrt' => \&overload_sqrt;

    @Math::GMPf::EXPORT_OK = qw(
Rmpf_abs Rmpf_add Rmpf_add_ui Rmpf_ceil Rmpf_clear Rmpf_clear_mpf Rmpf_clear_ptr
Rmpf_cmp Rmpf_cmp_d Rmpf_cmp_si Rmpf_cmp_ui 
Rmpf_deref2 Rmpf_div Rmpf_div_2exp Rmpf_div_ui
Rmpf_eq Rmpf_fits_sint_p Rmpf_fits_slong_p Rmpf_fits_sshort_p Rmpf_fits_uint_p 
Rmpf_fits_ulong_p Rmpf_fits_ushort_p Rmpf_floor Rmpf_fprintf
Rmpf_get_d Rmpf_get_d_2exp 
Rmpf_get_default_prec Rmpf_get_prec Rmpf_get_si Rmpf_get_str Rmpf_get_ui 
Rmpf_init Rmpf_init2 Rmpf_init2_nobless Rmpf_init_nobless Rmpf_init_set 
Rmpf_init_set_d Rmpf_init_set_d_nobless Rmpf_init_set_nobless Rmpf_init_set_si 
Rmpf_init_set_si_nobless Rmpf_init_set_str Rmpf_init_set_str_nobless 
Rmpf_init_set_ui Rmpf_init_set_ui_nobless Rmpf_inp_str
TRmpf_inp_str
Rmpf_integer_p Rmpf_mul 
Rmpf_mul_2exp Rmpf_mul_ui Rmpf_neg Rmpf_out_str 
TRmpf_out_str
Rmpf_pow_ui Rmpf_printf 
Rmpf_random2 Rmpf_reldiff Rmpf_set Rmpf_set_d Rmpf_set_default_prec Rmpf_set_prec 
Rmpf_set_prec_raw Rmpf_set_q Rmpf_set_si Rmpf_set_str Rmpf_set_ui Rmpf_set_z 
Rmpf_sgn Rmpf_sprintf Rmpf_sprintf_ret 
Rmpf_sqrt Rmpf_sqrt_ui Rmpf_sub Rmpf_sub_ui Rmpf_swap Rmpf_trunc 
Rmpf_ui_div Rmpf_ui_sub Rmpf_urandomb
    );
    $Math::GMPf::VERSION = '0.26';

    DynaLoader::bootstrap Math::GMPf $Math::GMPf::VERSION;

    %Math::GMPf::EXPORT_TAGS =(mpf => [qw(
Rmpf_abs Rmpf_add Rmpf_add_ui Rmpf_ceil Rmpf_clear Rmpf_clear_mpf Rmpf_clear_ptr
Rmpf_cmp Rmpf_cmp_d Rmpf_cmp_si Rmpf_cmp_ui 
Rmpf_deref2 Rmpf_div Rmpf_div_2exp Rmpf_div_ui
Rmpf_eq Rmpf_fits_sint_p Rmpf_fits_slong_p Rmpf_fits_sshort_p Rmpf_fits_uint_p 
Rmpf_fits_ulong_p Rmpf_fits_ushort_p Rmpf_floor Rmpf_fprintf
Rmpf_get_d Rmpf_get_d_2exp 
Rmpf_get_default_prec Rmpf_get_prec Rmpf_get_si Rmpf_get_str Rmpf_get_ui 
Rmpf_init Rmpf_init2 Rmpf_init2_nobless Rmpf_init_nobless Rmpf_init_set 
Rmpf_init_set_d Rmpf_init_set_d_nobless Rmpf_init_set_nobless Rmpf_init_set_si 
Rmpf_init_set_si_nobless Rmpf_init_set_str Rmpf_init_set_str_nobless 
Rmpf_init_set_ui Rmpf_init_set_ui_nobless Rmpf_inp_str 
TRmpf_inp_str
Rmpf_integer_p Rmpf_mul 
Rmpf_mul_2exp Rmpf_mul_ui Rmpf_neg Rmpf_out_str 
TRmpf_out_str
Rmpf_pow_ui Rmpf_printf 
Rmpf_random2 Rmpf_reldiff Rmpf_set Rmpf_set_d Rmpf_set_default_prec Rmpf_set_prec 
Rmpf_set_prec_raw Rmpf_set_q Rmpf_set_si Rmpf_set_str Rmpf_set_ui Rmpf_set_z 
Rmpf_sgn Rmpf_sprintf Rmpf_sprintf_ret
Rmpf_sqrt Rmpf_sqrt_ui Rmpf_sub Rmpf_sub_ui Rmpf_swap Rmpf_trunc 
Rmpf_ui_div Rmpf_ui_sub Rmpf_urandomb
)]);

sub dl_load_flags {0} # Prevent DynaLoader from complaining and croaking

sub new {

    # This function caters for 2 possibilities:
    # 1) that 'new' has been called OOP style - in which 
    #    case there will be a maximum of 3 args
    # 2) that 'new' has been called as a function - in
    #    which case there will be a maximum of 2 args.
    # If there are no args, then we just want to return an
    # initialized Math::GMPf object
    if(!@_) {return Rmpf_init()}
   
    if(@_ > 3) {die "Too many arguments supplied to new()"}

    # If 'new' has been called OOP style, the first arg is the string
    # "Math::GMPf" which we don't need - so let's remove it. However,
    # if the first arg is a Math::GMPf object (which is a possibility),
    # then we'll get a fatal error when we check it for equivalence to
    # the string "Math::GMPf". So we first need to check that it's not
    # an object - which we'll do by using the ref() function:
    if(!ref($_[0]) && $_[0] eq "Math::GMPf") {
      shift;
      if(!@_) {return Rmpf_init()}
      } 

    # @_ can now contain a maximum of 2 args - the value, and iff the value is
    # a string, (optionally) the base of the numeric string.
    if(@_ > 2) {die "Too many arguments supplied to new() - expected no more than two"}

    my ($arg1, $type, $base);

    # $_[0] is the value, $_[1] (if supplied) is the base of the number
    # in the string $[_0].
    $arg1 = shift;
    $base = 10;

    $type = _itsa($arg1);
    if(!$type) {die "Inappropriate argument supplied to new()"}

    # Create a Math::GMPz object that has $arg1 as its value.
    # Die if there are any additional args (unless $type == 4)
    if($type == 1 || $type == 2) { # UOK or IOK
      if(@_ ) {die "Too many arguments supplied to new() - expected only one"}
      return Rmpf_init_set_str($arg1, 10);
    }

    if($type == 3) { # NOK
      if(@_ ) {die "Too many arguments supplied to new() - expected only one"}
      if(Math::GMPf::_has_longdouble()) {
        my $ret = Rmpf_init();
        _Rmpf_set_ld($ret, $arg1);
        return $ret;
      }
      return Rmpf_init_set_d($arg1);

    }
    
    if($type == 4) { # POK
      if(@_ > 1) {die "Too many arguments supplied to new() - expected no more than two"}
      $base = shift if @_;
      if(($base < 2 && $base > -2) || $base < -62 || $base > 62) {die "Invalid value for base"}
      return Rmpf_init_set_str($arg1, $base);
    }

    if($type == 6) { # Math::GMPf object
      if(@_) {die "Too many arguments supplied to new() - expected only one"}
      return Rmpf_init_set($arg1);
    }
}

#sub Rmpf_out_str {
#    if(@_ == 3) { return _Rmpf_out_str($_[0], $_[1], $_[2]) }
#    elsif(@_ == 4) { return _Rmpf_out_str2($_[0], $_[1], $_[2], $_[3]) }
#    else {die "Wrong number of arguments supplied to Rmpf_out_str()"}
#}

sub Rmpf_out_str {
    if(@_ == 3) {
       die "Inappropriate 1st arg supplied to Rmpf_out_str" if _itsa($_[0]) != 6;
       return _Rmpf_out_str($_[0], $_[1], $_[2]);
    }
    if(@_ == 4) {
      if(_itsa($_[0]) == 6) {return _Rmpf_out_strS($_[0], $_[1], $_[2], $_[3])}
      die "Incorrect args supplied to Rmpf_out_str" if _itsa($_[1]) != 6;
      return _Rmpf_out_strP($_[0], $_[1], $_[2], $_[3]);
    }
    if(@_ == 5) {
      die "Inappropriate 2nd arg supplied to Rmpf_out_str" if _itsa($_[1]) != 6;
      return _Rmpf_out_strPS($_[0], $_[1], $_[2], $_[3], $_[4]);
    }
    die "Wrong number of arguments supplied to Rmpf_out_str()";
}

sub TRmpf_out_str {
    if(@_ == 4) {
      die "Inappropriate 4th arg supplied to TRmpf_out_str" if _itsa($_[3]) != 6;
      return _TRmpf_out_str($_[0], $_[1], $_[2], $_[3]);
    }
    if(@_ == 5) {
      if(_itsa($_[3]) == 6) {return _TRmpf_out_strS($_[0], $_[1], $_[2], $_[3], $_[4])}
      die "Incorrect args supplied to TRmpf_out_str" if _itsa($_[4]) != 6;
      return _TRmpf_out_strP($_[0], $_[1], $_[2], $_[3], $_[4]);
    }
    if(@_ == 6) {
      die "Inappropriate 5th arg supplied to TRmpf_out_str" if _itsa($_[4]) != 6;
      return _TRmpf_out_strPS($_[0], $_[1], $_[2], $_[3], $_[4], $_[5]);
    }
    die "Wrong number of arguments supplied to TRmpf_out_str()";
}

sub Rmpf_get_str {
    my $sep = $_[1] <=10 ? 'e' : '@';
    my ($mantissa, $exponent) = Rmpf_deref2($_[0], $_[1], $_[2]);

    if($mantissa =~ /\-/ && $mantissa !~ /[^0,\-]/) {return '-0'}
    if($mantissa !~ /[^0]/ || $mantissa eq '' ) {return '0'}

    if(substr($mantissa, 0, 1) eq '-') {
       substr($mantissa, 0, 1, '');
       return "-0." . $mantissa . $sep . $exponent if $exponent;
       return "-0." . $mantissa;
       }
    return "0." . $mantissa . $sep . $exponent if $exponent;
    return "0." . $mantissa;
}

sub overload_string {
    return Rmpf_get_str($_[0], 10, 0);
}

sub _rewrite {
    my $len = length($_[0]);
    my @split = ();
    my @ret = ();
    for(my $i = 0; $i < $len - 1; $i++) {
       if(substr($_[0], $i, 1) eq '%') {
         if(substr($_[0], $i + 1, 1) eq '%') { $i++ }
         else { push(@split, $i) }
         }
       }

    push(@split, $len);
    shift(@split);

    my $start = 0;
    
    for(@split) {
       push(@ret, substr($_[0], $start, $_ - $start));
       $start = $_;
       }

    return @ret;
}

sub Rmpf_printf {
    local $| = 1; # Make sure the output gets presented in the correct sequence.
    if(@_ == 1) {printf(shift)}

    else {
      my @fmt = _rewrite(shift);
      my @args = @_;

     # It's expected that @fmt and @args are of equal size (though in the case
     # of both perl's and C's printf function that's not always the case).
     # Each member of @fmt is paired with one and only one member of @args, each
     # pair of arguments being passed on to either perl's printf function or
     # the gmp_printf function. Any excess (leftover) arguments are simply ignored.
      if(@fmt != @args) {warn "Mismatch in number of args provided to Rmpf_printf.",
                         " Perhaps the function has not parsed the format string as expected"};
      my $len = @fmt;


     # If $fmt[$i] contains a 'Z' or a 'Q' or an 'F', hand over $fmt[$i] and
     # $args[$i] to the gmp_printf function.
     # Else let perl's printf function take care of the formatting - though
     # the gmp_printf function is also probably capable of handling the task.
      for(my $i = 0; $i < $len; $i++) { 
         if($fmt[$i] =~ /Z|Q|F/) {wrap_gmp_printf($fmt[$i], $args[$i])}
         else {printf($fmt[$i], $args[$i])}
         }
      }
}

sub Rmpf_fprintf {
    die "Rmpf_fprintf must take 3 arguments: filehandle, format string, and variable" if @_ != 3;
    wrap_gmp_fprintf(@_);
}

sub Rmpf_sprintf {
    die "Rmpf_sprintf must take 3 arguments: buffer, format string, and variable" if @_ != 3;
    my $len = wrap_gmp_sprintf(@_);
    $_[0] = substr($_[0], 0, $len);
}

sub Rmpf_sprintf_ret {
    die "Rmpf_sprintf must take 3 arguments: buffer, format string, and variable" if @_ != 3;
    my $len = wrap_gmp_sprintf(@_);
    return substr($_[0], 0, $len);
}

1;

__END__

=head1 NAME

   Math::GMPf - perl interface to the GMP library's floating point (mpf) functions.

=head1 DEPENDENCIES

   This module needs the GMP C library - available from:
   http://swox.com/gmp

=head1 DESCRIPTION

   A bigfloat module utilising the Gnu MP (GMP) library.
   Basically this module simply wraps all of the 'mpf'
   floating point functions provided by that library.
   The documentation below extensively plagiarises the
   GMP documentation at http://swox.com/gmp/manual .
   See the Math::GMPf test suite for some examples
   of usage.

=head1 SYNOPSIS

   use Math::GMPf qw(:mpf);

   my $string = '.123542@2'; # mantissa = (.)12345
                         # exponent = 2
   # my $string = '12.354'; # alternative string format

   my $base = 10;

   # Set the default precision to at least 80 bits.
   Rmpf_set_default_prec(80);

   # Create the Math::GMPf object
   my $bn1 = Rmpf_init_set_str($string, $base);

   # Create another Math::GMPf object that holds
   # an initial value of zero, but with at least
   # 131 bits of precision.
   my $bn2 = Rmpf_init2(131);

   # Create another Math::GMPf object that holds
   # an initial value of zero, with default precision.
   my $bn3 = Rmpf_init();

   # Or just use the new() function:
   my $bn4 = Math::GMPf->new(116.8129);

   # Perform some operations ... see 'FUNCTIONS' below.

   .
   .

   # print out the value held by $bn1 (in octal):
   print Rmpf_get_str($bn1, 8, 0), "\n"; 

   # print out the value held by $bn1 (in decimal):
   print Rmpf_get_str($bn1, 10, 0);

   # print out the value held by $bn1 (in base 29)
   # using the (alternative) TRmpf_out_str()
   # function. (This function doesn't print a newline.)
   TRmpf_out_str(*STDOUT, 29, 0, $bn1);

=head1 MEMORY MANAGEMENT

   Objects created with Rmpf_init* functions have been
   blessed into package Math::GMPf. They will
   therefore be automatically cleaned up by the
   DESTROY() function whenever they go out of scope.

   For each Rmpf_init* fnction there is a corresponding
   Rmpf_init*_nobless function. If you wish you can 
   create unblessed objects using these functions.
   It will then be up to you to clean up the memory
   associated with these objects by calling
   Rmpf_clear($op), for each object. Alternatively the objects
   will be cleaned up when the script ends. I don't know
   why you would want to create unblessed objects. The
   point is that you can if you want to.  

=head1 FUNCTIONS

   See the GMP documentation at http://swox.com/gmp/manual

   These next 3 functions are demonstrated above:
   $rop   = Rmpf_init_set_str($str, $base); # 1 < abs($base) < 63
   $rop   = Rmpf_init2($bits); # $bits > 0
   $str = Rmpf_get_str($r, $base, $digits); # 1 < abs($base) < 63 
   The third argument to Rmpf_get_str() specifies the number
   of digits required to be output. Up to $digits digits
   will be generated.  Trailing zeros are not returned.  No
   more digits than can be accurately represented by OP are
   ever generated.  If $digits is 0 then that accurate
   maximum number of digits are generated.

   The following functions are simply wrappers around a GMP
   function of the same name. eg. Rmpf_swap() is a wrapper around
   mpf_swap() which is fully documented in the GMP manual at
   http://swox.com/gmp/manual.

   "$rop", "$op1", "$op2", etc. are simply Math::GMPf objects
   - the return value of one of the Rmpf_init* functions
   (or their '_nobless' counterpart).
   They are in fact references to GMP structures.
   The "$rop" argument(s) contain the result(s) of the calculation
   being done, the "$op" argument(s) being the input(s) into that 
   calculation.
   Generally, $rop, $op1, $op2, etc. can be the same perl variable,
   though usually they will be distinct perl variables referencing
   distinct GMP structures.
   Eg. something like Rmpf_add($r1, $r1, $r1),
   where $r1 *is* the same reference to the same GMP structure,
   would add $r1 to itself and store the result in $r1. Think of it
   as $r1 += $r1. Otoh, Rmpf_add($r1, $r2, $r3), where each of the
   arguments is a different reference to a different GMP structure
   would add $r2 to $r3 and store the result in $r1. Think of it as
   $r1 = $r2 + $r3. Mostly, the first argument is the argument that 
   stores the result and subsequent arguments provide the input values.
   Exceptions to this can be found in some of the functions that
   actually return a value. 
   Like I say, see the GMP manual for details. I hope it's 
   intuitively obvious or quickly becomes so. Also see the test
   suite that comes with the distro for some examples of usage.

   "$ui" means any integer that will fit into a C 'unsigned long int'.

   "$si" means any integer that will fit into a C 'signed long int'.

   "$double" means any number (not necessarily integer) that will fit
   into a C 'double

   "$bool" means a value (usually a 'signed long int') in which
   the only interest is whether it's true or false.

   "$str" simply means a string of symbols that represent a number,
   eg "1234567890987654321234567@7" which might be a base 10 number,
   or "zsa34760sdfgq123r5@11" which would have to represent a base 36
   number (because "z" is a valid digit only in base 36). Valid
   bases for GMP numbers are 2 to 62 (inclusive).

   ########################

   INITIALIZATION FUNCTIONS
   See http://swox.com/gmp/manual/Initializing-Floats.html

   Normally, a variable should be initialized once only or at least be
   cleared, using `Rmpf_clear', between initializations.
   'DESTROY' (which calls 'Rmpf_clear') is automatically called on 
   blessed objects whenever they go out of scope.

   First read the section 'MEMORY MANAGEMENT' (above).

   $bits = Rmpf_get_default_prec();
    Return the current default default precision.

   Rmpf_set_default_prec($bits); 
    Set the default precision to be *at least* $bits bits.  All
    subsequent calls to `Rmpf_init' will use this precision, but
    previously initialized variables are unaffected.

   $rop = Math::GMPf::new();
   $rop = Math::GMPf->new();
   $rop = new Math::GMPf();
   $rop = Rmpf_init();
   $rop = Rmpf_init_nobless();
    Initialize $rop to 0. The precision of $rop is undefined
    unless a default precision has already been established by
    a call to `Rmpf_set_default_prec'.

   $rop = Rmpf_init2($bits);
   $rop = Rmpf_init2_nobless($bits);
     Initialize $rop to 0 and set its precision to be
     *at least* $bits bits. 

   $bits = Rmpf_get_prec($op);
    Return the current precision of $op, in bits.

   Rmpf_set_prec($rop, $bits);
    Set the precision of $rop to be *at least* $bits bits.
    The value in $rop will be truncated to the new precision.
    This function requires internal reallocation of memory,
    and so should not be used in a tight loop.

   Rmpf_set_prec_raw($rop, $bits);
    Set the precision of $rop to be *at least* $bits bits, without
    changing the memory allocated. $bits must be no more than the 
    allocated precision for $rop, that being the precision when $rop
    was initialized, or in the most recent `Rmpf_set_prec'.
    The value in $rop is unchanged, and in particular if it had a
    higher precision than $bits it will retain that higher precision
    New values written to $rop will use the new value $bits.
    Before calling `Rmpf_clear' (which will happen when a blessed
    Math::GMPf object goes out of scope) or the full `Rmpf_set_prec',
    another `Rmpf_set_prec_raw' call must be made to restore $rop to
    its original allocated precision.  Failing to do so will have 
    unpredictable results.
    `Rmpf_get_prec' can be used before `Rmpf_set_prec_raw' to get the
    original allocated precision.  After `Rmpf_set_prec_raw' it
    reflects the $bits value set.
    `Rmpf_set_prec_raw' is an efficient way to use a Math::GMPf
    object at different precisions during a calculation, perhaps to
    gradually increase precision in an iteration, or just to use
    various different precisions for different purposes during a
    calculation.

   ####################

   ASSIGNMENT FUNCTIONS
   See http://swox.com/gmp/manual/Assigning-Floats.html

   Rmpf_set($rop, $op); 
   Rmpf_set_ui($rop, $ui);
   Rmpf_set_si($rop, $si);
   Rmpf_set_d($rop, $double);
   Rmpf_set_z($rop, $z); # $z is a Math::GMPz object.
   Rmpf_set_q($rop, $q); # $q is a Math::GMPq object. 
    Set the value of $rop from the 2nd arg.

   Rmpf_set_str($rop, $str, $base);
    Set the value of $rop from the string in $str. The string is of
    the form `M@N' or, if the base is 10 or less, alternatively
    `MeN'. `M' is the mantissa and `N' is the exponent. The mantissa
    is always in the specified base. The exponent is either in the
    specified base or, if base is negative, in decimal. 
    The argument $base may be in the ranges 2 to 62, or -62 to -2.
    Negative values are used to specify that the exponent is in
    decimal. For bases up to 36, case is ignored; upper-case and
    lower-case letters have the same value; for bases 37 to 62,
    upper-case letter represent the usual 10..35 while lower-case
    letter represent 36..61. 
    Unlike the corresponding mpz function, the base will not be 
    determined from the leading characters of the string if base is 0.
    This is so that numbers like `0.23' are not interpreted as octal. 
    This function croaks if the entire string is not a valid number
    in base $base. 

   Rmpf_swap($rop1, $rop2);
    Swap $rop1 and $rop2. Both the values and the
    precisions of the two variables are swapped.

   ######################################

   COMBINED INITIALIZATION AND ASSIGNMENT

   NOTE: Do NOT use these functions if $rop has already
   been initialised. Instead use the Rmpz_set* functions 
   in 'Assignment Functions' (above)

   First read the section 'MEMORY MANAGEMENT' (above).

   $rop = Math::GMPf->new($arg);
   $rop = Math::GMPf::new($arg);
   $rop = new Math::GMPf($arg);
    Returns a Math::GMPf object with the value of $arg, with default
    precision. $arg can be either a number (signed integer, unsigned
    integer, signed fraction or unsigned fraction) or a string that 
    represents a numeric value. If $arg is a string, an optional
    additional argument that specifies the base of the number can
    be supplied to new(). If $arg is a string and no additional
    argument is supplied, base 10 is assumed.

   $rop = Rmpf_init_set($op);
   $rop = Rmpf_init_set_nobless($op);
   $rop = Rmpf_init_set_ui($ui);
   $rop = Rmpf_init_set_ui_nobless($ui);
   $rop = Rmpf_init_set_si($si);
   $rop = Rmpf_init_set_si_nobless($si);
   $rop = Rmpf_init_set_d($double);
   $rop = Rmpf_init_set_d_nobless($double);
    Initialise $rop and assign to it the value held by
    the functions argument. See the 'Rmpf_set*'
    functions above.

   $rop = Rmpf_init_set_str($str, $base);
   $rop = Rmpf_init_set_str_nobless($str, $base);
    Initialise $rop and assign to it the base $base
    value represented by $str. See the 'Rmpf_set_str'
    documentation above for details.

   ####################

   CONVERSION FUNCTIONS
   See http://swox.com/gmp/manual/Converting-Floats.html

   $double = Rmpf_get_d($op);
    Convert $op to a 'double'.

   $si = Rmpf_get_si($op);
   $ui = Rmpf_get_ui($op);
    Convert $op to a `signed long' or `unsigned long',
    truncating any fraction part.  If $op is too big for
    the return type, the result is undefined.

   ($double, $exp) = Rmpf_get_d_2exp($op);
    Find $double and $exp such that $double * (2 ** $exp),
    with 0.5<=abs($double)<1, is a good approximation to $op.
    This is similar to the standard C function `frexp'.

   $str = Rmpf_get_str($op, $base, $digits);
    Convert $op to a string of digits in base $base. $base can
    be 2 to 62.  Up to $digits digits will be generated. 
    Trailing zeros are not returned.  No more digits than can be
    accurately represented by $op are ever generated.  If $digits
    is 0 then that accurate maximum number of digits are generated.

   ($man, $exp) = Rmpf_deref2($op, $base, $digits);
    Returns the mantissa to $man (as a string of digits, prefixed with
    a minus sign if $op is negative), and returns the exponent to $exp.
    There's an implicit decimal point to the left of the first digit in
    $man. The third argument to Rmpf_deref2() specifies the number of
    digits required to be output in the mantissa. No more digits than
    can be accurately represented by $op are ever generated. If $digits
    is 0 then that accurate maximum number of digits are generated

   ####################

   ARITHMETIC FUNCTIONS
   See http://swox.com/gmp/manual/Float-Arithmetic.html

   Rmpf_add($rop, $op1, $op2);
   Rmpf_add_ui($rop, $op, $ui);
    $rop = 2nd arg + 3rd arg.

   Rmpf_sub($rop, $op1, $op2);
   Rmpf_sub_ui($rop, $op, $ui);
   Rmpf_ui_sub($rop, $ui, $op);
    $rop = 2nd arg - 3rd arg.

   Rmpf_mul($rop, $op1, $op2);
   Rmpf_mul_ui($rop, $op, $ui);
    $rop = 2nd arg * 3rd arg.

   Rmpf_div($rop, $op1, $op2); 
   Rmpf_ui_div($rop, $ui, $op);
   Rmpf_div_ui($rop, $op, $ui);
    $rop = 2nd arg / 3rd arg.

   Rmpf_sqrt($rop, $op);
   Rmpf_sqrt_ui($rop, $ui);
    $rop = 2nd arg ** 0.5.

   Rmpf_pow_ui($rop, $op, $ui);
    $ROP = $OP ** $ui.

   Rmpf_neg($rop, $op); 
    $rop = -$op.

   Rmpf_abs($rop, $op);
    $rop = abs($op).

   Rmpf_mul_2exp($rop, $op, $ui);
    $rop = $op * (2 ** $ui).

   Rmpf_div_2exp($rop, $op, $ui);
    $rop = $op / (2 ** $ui).

   #################### 

   COMPARISON FUNCTIONS
   See http://swox.com/gmp/manual/Float-Comparison.html

   $si = Rmpf_cmp($op1, $op2); 
   $si = Rmpf_cmp_ui($op, $ui);
   $si = Rmpf_cmp_si($op, $si);
   $si = Rmpf_cmp_d($op, $double);
    Compare 1st arg and 2nd arg.  Return a positive value if 
    1st arg >  2nd arg, zero if 1st arg = 2nd arg, and a 
    negative value if 1st arg < 2nd arg.

   Rmpf_eq($op1, $op2, $bits);
    Return non-zero if the first $bits bits of $op1 and $op2
    are equal, zero otherwise.  I.e., test if $op1 and $op2
    are approximately equal.
    Caution: Currently only whole limbs are compared, and only in an
    exact fashion.

   Rmpf_reldiff($rop, $op1, $op2);
    $rop = abs($op1 - $op2) / $op1.

   $si = Rmpf_sgn($op);
    Returns either +1 or -1 (or 0 if $op is zero).

   ##########################

   INPUT AND OUTPUT FUNCTIONS
   See http://swox.com/gmp/manual/I-O-of-Floats.html

   $bytes_read = Rmpf_inp_str($rop, $base);
    BEST TO USE TRmpf_inp_str INSTEAD.
    Read a string in base $base from STDIN, and put the read
    float in $rop. The string is of the form `M@N' or, if 
    $base is 10 or less, alternatively `MeN'.  `M' is the
    mantissa and `N' is the exponent.  The mantissa is always
    in the specified base. The exponent is either in the
    specified base or, if $base is negative,in decimal. The
    decimal point expected is taken from the current locale,
    on systems providing `localeconv'. The argument $base may
    be in the ranges 2 to 36, or -36 to -2. Negative values
    are used to specify that the exponent is in decimal.
    Unlike the corresponding `Math::GMPz' function, the
    base will not be determined from the leading characters
    of the string if $base is 0. This is so that numbers
    like `0.23' are not interpreted as octal.

   $bytes_read = TRmpf_inp_str($rop, $stream, $base);
    As for Rmpf_inp_str, except that there's the capability to read
    from somewhere other than STDIN.
    To read from STDIN:
       TRmpf_inp_str($rop, *stdin, $base);
    To read from an open filehandle (let's call it FH):
       TRmpf_inp_str($rop, \*FH, $base);

   $bytes_written = Rmpf_out_str([$prefix,] $op, $base, $digits  [, $suffix]);
    BEST TO USE TRmpf_out_str INSTEAD.
    Print $op to stream, as a string of digits. Return the number of
    bytes written, or if an error occurred, return 0. The mantissa is
    prefixed with an `0.' and is in the given base, which may vary 
    from 2 to 62 or from -2 to -36. An exponent is then printed,
    separated by an `e', or if the base is greater than 10 then by an
    `@'. The exponent is always in decimal. The decimal point follows
    the current locale, on systems providing localeconv. For bases in
    the range 2..36, digits and lower-case letters are used; for
    -2..-36, digits and upper-case letters are used; for 37..62, digits,
    upper-case letters, and lower-case letters (in that significance
    order) are used. Up to $digits will be printed from the mantissa,
    except that no more digits than are accurately representable by $op 
    will be printed. $digits can be 0 to select that accurate maximum. 
    The optional last argument ($suffix) is a string (eg "\n") that
    will be appended to the output. The optional first argument 
    ($prefix) is a string that will be prepended to the output. Note
    that either none, one, or both, of $prefix and $suffix may be
    supplied. ($bytes_written does not include the number of bytes in
    $suffix and $prefix.)

   $bytes_written = TRmpf_out_str([$prefix,] $stream, $base, $digits, $op, [, $suffix]);
    As for Rmpf_out_str, except that there's the capability to print
    to somewhere other than STDOUT. Note that the order of the args
    is different (to match the order of the mpf_out_str args).
    To print to STDERR:
       TRmpf_out_str(*stderr, $base, $digits, $op);
    To print to an open filehandle (let's call it FH):
       TRmpf_out_str(\*FH, $base, $digits, $op);

   #######################

   MISCELLANEOUS FUNCTIONS
   See http://swox.com/gmp/manual/Miscellaneous-Float_Functions.html

   Rmpf_ceil($rop, $op); 
   Rmpf_floor($rop, $op); 
   Rmpf_trunc($rop, $op);
    Set $rop to $op rounded to an integer.  `Rmpf_ceil' rounds to the
    next higher integer, `mpf_floor' to the next lower, and
    `Rmpf_trunc' to the integer towards zero.

   $bool = Rmpf_integer_p($op);
    Return non-zero if $op is an integer.

   $bool = Rmpf_fits_ulong_p($op); 
   $bool = Rmpf_fits_slong_p($op);
   $bool = Rmpf_fits_uint_p($op); 
   $bool = Rmpf_fits_sint_p($op);
   $bool = Rmpf_fits_ushort_p($op);
   $bool = Rmpf_fits_sshort_p($op);
    Return non-zero if OP would fit in the respective C data
    type, when truncated to an integer.


   In Rmpf_urandomb() (below), @r is an array of 
   Math::GMPf objects (one for each random number that is
   required). $how_many is the number of random numbers you 
   want and must be equal to scalar(@r). $bits is simply the
   number of random bits required. Before calling
   Rmpf_urandomb(), you first initialise state by calling 
   Math::GMPz::rand_init(). When you've finished with
   Rmpf_urandomb, call Math::GMPz::rand_clear(). 
   With Rmpf_random2() there is no need to call rand_init()
   and rand_clear().

   $state = Math::GMPz::rand_init($z);
    $z is the seed - a Math::GMPz object.

   Rmpf_urandomb(@r, $state, $bits, $how_many);
     Generate uniformly distributed random floats, all
     between 0 and 1, with $bits significant bits in the mantissa.

   Math::GMPz::rand_clear($state);
   Rmpf_random2(@r, $limbs, $exp, $how_many);
    Generate random floats of at most $limbs limbs, with long
    strings of zeros and ones in the binary representation.
    The exponent of the number is in the interval -$exp to $exp.
    This function is useful for testing functions and algorithms,
    since this kind of random numbers have proven to be more
    likely to trigger corner-case bugs.  Negative random 
    numbers are generated when $limbs is negative. 

    ####################

    OPERATOR OVERLOADING

    Overloading works with numbers, strings (base 10 only)
    and Math::GMPf objects. Strings are coerced into
    Math::GMPf objects (with default precision).

    The following operators are overloaded:
     + - * / ** sqrt (Return values have default precision)
     += -= *= /= **= (Precision remains unchanged)
     < <= > >= == != <=>
     ! not
     abs (Return value has default precision)
     int (on perl 5.8 only, NA on perl 5.6.
          Return value has default precision.)
     = (The copy that gets modified will have default precision.
       The other copy retains the precision of the original)
     "" 

    Atempting to use the overloaded operators with objects that
    have been blessed into some package other than 'Math::GMPf'
    will not work.

    In those situations where the overload subroutine operates on 2
    perl variables, then obviously one of those perl variables is
    a Math::GMPf object. To determine the value of the other variable
    the subroutine works through the following steps (in order),
    using the first value it finds, or croaking if it gets
    to step 6:

    1. If the variable is an unsigned long then that value is used.
       The variable is considered to be an unsigned long if 
       (perl 5.8) the UOK flag is set or if (perl 5.6) SvIsUV() 
       returns true.

    2. If the variable is a signed long int, then that value is used.
       The variable is considered to be a signed long int if the
       IOK flag is set. (In the case of perls built with
       -Duse64bitint, the variable is treated as a signed long long
       int if the IOK flag is set.)

    3. If the variable is a double, then that value is used. The
       variable is considered to be a double if the NOK flag is set.

    4. If the variable is a string (ie the POK flag is set) then the
       base 10 value of that string is used. If the POK flag is set,
       but the string is not a valid base 10 number, the subroutine
       croaks with an appropriate error message.

    5. If the variable is a Math::GMPf object then the value of that
       object is used.

    6. If none of the above is true, then the second variable is
       deemed to be of an invalid type. The subroutine croaks with
       an appropriate error message.

   #####

   OTHER

    $GMP_version = Math::GMPf::gmp_v();
     Returns the version of the GMP library. The function is not
     exported.

   ################

   FORMATTED OUTPUT

   Rmpf_printf($format_string, @variables);

    'Rmpf_printf' accepts format strings similar to the standard C
    'printf' (and hence also perl's printf function).  A format
     specification is of the form:

      % [flags] [width] [.[precision]] [type] conv

    GMP adds types 'Z', 'Q' and 'F' for Math::GMPz objects,
    Math::GMPq objects and Math::GMPf objects respectively.
    'Z', and 'Q' behave like integers.  'Q' will print a '/' and a
    denominator, if needed.  'F' behaves like a float.  For example:

     Rmpf_printf ("%s is a Math::GMPz object %Zd\n", "here", $z);
     Rmpf_printf ("a hex rational: %#40Qx\n", $q);
     Rmpf_printf ("fixed point mpf %.5Ff with 5 decimal places\n", $f);

    The flags accepted are as follows:

     0         pad with zeros (rather than spaces)
     #         show the base with '0x', '0X' or '0'
     +         always show a sign
     (space)   show a space or a '-' sign

    The optional width and precision can be given as a number within
    the format string, or as an interpolated perl variable - but note
    that formatting with '*' (for width and precision fields)
    WON'T currently work.ie the following is not currently supported:

     $places = 5;
     Rmpf_printf("mpf %.*Ff\n", $places, $f);

    Instead you would need to rewrite this as:

     $places = 5;
     Rmpf_printf("mpf %.${places}Ff\n", $f);

    The conversions accepted are as follows.  

     a A       hex floats, C99 style
     c         character
     d         decimal integer
     e E       scientific format float
     f         fixed point float
     i         same as d
     g G       fixed or scientific float
     o         octal integer
     s         string
     u         unsigned integer
     x X       hex integer

    'a' and 'A' are always supported for GMP objects but don't work with
    perl's printf function. Always call them prefixed with either 'Z',
    'F' or 'Q' (whichever is appropriate).

    'p' works with the GMP library and with perl (returns the address of
    the variable), but can segfault if it's used in the Rmpf_printf 
    function. For this reason I've excluded it from the list above,
    though you can certainly use it with perl's printf function - even
    if the perl variable is a gmp object.

    'o', 'x' and 'X' are unsigned for the standard C types, but for
    types 'Z', 'Q' and 'N' they are signed.  'u' is not meaningful
    for 'Z', 'Q' and 'N'.

    In the GMP C library, 'n' can be used with any type, even the GMP
    types - but that functionality does not currently extend to Perl's
    GMP objects - so 'n' has been excluded from the above list.

    The precision field has it's usual meaning for integer 'Z' and float
    'F' types, but is currently undefined for 'Q' and should not be used
    with that.

    Conversions of Math::GMPf objects only ever generate as many 
    digits as can be accurately represented by the operand, the same as
    'Rmpf_get_str' does. Zeros will be used if necessary to pad to the 
    requested precision.  This happens even for an 'f' conversion of a 
    Math::GMPf object which is an integer, for instance 2^1024 in a 
    Math::GMPq object of 128 bits precision will only produce about
    40 digits, then pad with zeros to the decimal point.  An empty 
    precision field like '%.Fe' or '%.Ff' can be used to specifically
    request just the significant digits.

    The format string is interpreted as plain ASCII - multibyte
    characters are not recognised.

    Also, in Rmpf_printf, there's no support for POSIX '$' style 
    numbered arguments.

   Rmpf_fprintf($fh, $format_string, $var);

    This function (unlike the GMP counterpart) is limited to taking
    3 arguments - the filehandle, the format string, and the variable
    to be formatted. That is, you can format only one variable at a time.
    Other than that, the rules outlined above wrt Rmpf_printf apply.

   Rmpf_sprintf($buffer, $format_string, $var);

    This function (unlike the GMP counterpart) is limited to taking
    3 arguments - the filehandle, the format string, and the variable
    to be formatted. $buffer must be large enough to accommodate the
    formatted string, and is truncated to the length of that formatted
    string. If you prefer to have the resultant string returned (rather
    than stored in $buffer), use Rmpz_sprintf_ret instead - which will
    also leave the length of $buffer unaltered. See Rmpf_printf
    documentation for further info.

   $string = Rmpf_sprintf_ret($buffer, $format_string, $var);

    As for Rmpf_sprintf, but returns the formatted string, rather than
    storing it in $buffer. $buffer needs to be large enough to 
    accommodate the formatted string. The length of $buffer (but not the
    contents) will be unaltered.

   ###############################
   ###############################

=head1 BUGS

   You can get segfaults if you pass the wrong type of
   argument to the functions - so if you get a segfault, the
   first thing to do is to check that the argument types 
   you have supplied are appropriate.

=head1 LICENSE

    This perl code is free software; you may redistribute it
    and/or modify it under the same terms as Perl itself.

=head1 AUTHOR

    Sisyphus <sisyphus at(@) cpan dot (.) org>


=cut