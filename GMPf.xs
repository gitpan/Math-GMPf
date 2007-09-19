#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

#ifdef _MSC_VER
#pragma warning(disable:4700 4715 4716)
#endif

#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
#ifndef _MSC_VER
#include <inttypes.h>
#endif
#endif

#ifdef OLDPERL
#define SvUOK SvIsUV
#endif

SV * Rmpf_get_default_prec() {
     return newSVuv(mpf_get_default_prec());
     }

void Rmpf_set_default_prec(SV * prec) {
     mpf_set_default_prec(SvUV(prec));
     }

SV * Rmpf_init_set_str_nobless(SV * str, SV * base) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_str_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);

     if(mpf_init_set_str(*mpf_t_obj, SvPV_nolen(str), SvIV(base)))
       croak("First arg to Rmpf_init_set_str_nobless() is not a valid base %d number", SvIV(base));

     return obj_ref;

}

SV * Rmpf_init2_nobless(SV * prec) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init2_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init2 (*mpf_t_obj, SvUV(prec));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpf_init_set_str(SV * str, SV * base) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_str function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);

     if(mpf_init_set_str(*mpf_t_obj, SvPV_nolen(str), SvIV(base)))
       croak("First arg to Rmpf_init_set_str() is not a valid base %d number", SvIV(base));

     return obj_ref;
}

SV * Rmpf_init2(SV * prec) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init2 function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init2 (*mpf_t_obj, SvUV(prec));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_nobless() {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init(*mpf_t_obj);

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;

}

SV * Rmpf_init() {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set(mpf_t * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set(*mpf_t_obj, *a);

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_ui(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_ui function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set_ui(*mpf_t_obj, SvUV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_si(SV *a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_si function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set_si(*mpf_t_obj, SvIV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_d(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_d function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set_d(*mpf_t_obj, SvNV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

void _Rmpf_set_ld(mpf_t * q, SV * p) {
#ifdef USE_LONG_DOUBLE
     char buffer[50];
     int exp, exp2 = 0;
     long double fr;

     fr = frexpl((long double)SvNV(p), &exp);

     while(fr != floorl(fr)) {
          fr *= 2;
          exp2 += 1;
     }

     sprintf(buffer, "%.0Lf", fr);

     mpf_set_str(*q, buffer, 10);

     if (exp2 > exp) mpf_div_2exp(*q, *q, exp2 - exp);
     else mpf_mul_2exp(*q, *q, exp - exp2);
#else
     croak("_Rmpf_set_ld not implemented on this build of perl");
#endif
}

SV * Rmpf_init_set_nobless(mpf_t * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set(*mpf_t_obj, *a);

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_ui_nobless(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_ui_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set_ui(*mpf_t_obj, SvUV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_si_nobless(SV *a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_si_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set_si(*mpf_t_obj, SvIV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_d_nobless(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_d_nobless function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set_d(*mpf_t_obj, SvNV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

void Rmpf_deref2(mpf_t * p, SV * base, SV * n_digits) {
     Inline_Stack_Vars;
     char * out;
     mp_exp_t ptr, *expptr;
     unsigned long b = SvUV(base), n_dig = SvUV(n_digits);

     expptr = &ptr;

     if(!n_dig) {
        n_dig = (double)(mpf_get_prec(*p)) / log(b) * log(2);
        }

     if(b < 2 || b > 36) croak("Second argument supplied to Rmpf_get_str() is not in acceptable range");

     New(2, out, n_dig + 5 , char);
     if(out == NULL) croak("Failed to allocate memory in Rmpf_get_str function");

     mpf_get_str(out, expptr, b, SvUV(n_digits), *p);

     Inline_Stack_Reset;
     Inline_Stack_Push(sv_2mortal(newSVpv(out, 0)));
     Safefree(out);
     Inline_Stack_Push(sv_2mortal(newSViv(ptr)));
     Inline_Stack_Done;
     Inline_Stack_Return(2);
}

void DESTROY(mpf_t * p) {
/*     printf("Destroying mpf "); */
     mpf_clear(*p);
     Safefree(p);
/*     printf("...destroyed\n"); */
}

void Rmpf_clear(mpf_t * p) {
     mpf_clear(*p);
     Safefree(p);
}

void Rmpf_clear_mpf(mpf_t * p) {
     mpf_clear(*p);
}

void Rmpf_clear_ptr(mpf_t * p) {
     Safefree(p);
}

SV * Rmpf_get_prec(mpf_t * p) {
     return newSVuv(mpf_get_prec(*p));
}

void Rmpf_set_prec(mpf_t * p, SV * prec) {
     mpf_set_prec(*p, SvUV(prec));
}

void Rmpf_set_prec_raw(mpf_t * p, SV * prec) {
     mpf_set_prec_raw(*p, SvUV(prec));
}

void Rmpf_set(mpf_t * p1, mpf_t * p2) {
     mpf_set(*p1, *p2);
}

void Rmpf_set_ui(mpf_t * p, SV * ul) {
     mpf_set_ui(*p, SvUV(ul));
}

void Rmpf_set_si(mpf_t * p, SV * l) {
     mpf_set_si(*p, SvIV(l));
}

void Rmpf_set_d(mpf_t * p, SV * d) {
     mpf_set_d(*p, SvNV(d));
}

void Rmpf_set_z(mpf_t * p, mpz_t * z) {
     mpf_set_z(*p, *z );
}

void Rmpf_set_q(mpf_t * p, mpq_t * q) {
     mpf_set_q(*p, *q );
}

void Rmpf_set_str(mpf_t * p, SV * str, SV * base) {
     if(mpf_set_str(*p, SvPV_nolen(str), SvIV(base)))
      croak("2nd arg to Rmpf_set_str() is not a valid base %d number", SvIV(base));
}

void Rmpf_swap(mpf_t * p1, mpf_t * p2) {
     mpf_swap(*p1, *p2);
}

SV * _Rmpf_out_str(mpf_t * p, SV * base, SV * digits) {
     unsigned long ret;
     if(SvIV(base) < 2 || SvIV(base) > 36)
       croak("2nd argument supplied to Rmpf_out_str is out of allowable range (must be between 2 and 36 inclusive)");
     ret = mpf_out_str(NULL, SvIV(base), SvUV(digits), *p);
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpf_out_str2(mpf_t * p, SV * base, SV * dig, SV * suff) {
     unsigned long ret;
     if(SvIV(base) < 2 || SvIV(base) > 36)
       croak("2nd argument supplied to Rmpf_out_str is out of allowable range (must be between 2 and 36 inclusive)");
     ret = mpf_out_str(NULL, SvUV(base), SvUV(dig), *p);
     printf("%s", SvPV_nolen(suff));
     fflush(stdout);
     return newSVuv(ret);
}

SV * Rmpf_cmp(mpf_t * p1, mpf_t * p2) {
     return newSViv(mpf_cmp(*p1, *p2));
}

SV * Rmpf_cmp_ui(mpf_t * p, SV * ul) {
     return newSViv(mpf_cmp_ui(*p, SvUV(ul)));
}

SV * Rmpf_cmp_si(mpf_t * p, SV * l) {
     return newSViv(mpf_cmp_si(*p, SvIV(l)));
}

SV * Rmpf_cmp_d(mpf_t * p, SV * d) {
     return newSViv(mpf_cmp_d(*p, SvNV(d)));
}

SV * Rmpf_get_d(mpf_t * p) {
     return newSVnv(mpf_get_d(*p));
}

SV * Rmpf_get_si(mpf_t * p) {
     return newSViv(mpf_get_si(*p));
}

SV * Rmpf_get_ui(mpf_t * p) {
     return newSViv(mpf_get_ui(*p));
}

void Rmpf_get_d_2exp(mpf_t * n) {
     Inline_Stack_Vars;
     double d;
     unsigned long exp, *expptr;

     expptr = &exp;
     d = mpf_get_d_2exp(expptr, *n);
 
     Inline_Stack_Reset;
     Inline_Stack_Push(sv_2mortal(newSVnv(d)));
     Inline_Stack_Push(sv_2mortal(newSVuv(exp)));
     Inline_Stack_Done;
     Inline_Stack_Return(2);
}

void Rmpf_add(mpf_t * dest, mpf_t * src1, mpf_t * src2) {
     mpf_add(*dest, *src1, *src2 );
}

void Rmpf_add_ui(mpf_t * dest, mpf_t * src, SV * num) {
     mpf_add_ui(*dest, *src, SvUV(num));
}

void Rmpf_sub(mpf_t * dest, mpf_t * src1, mpf_t * src2) {
     mpf_sub(*dest, *src1, *src2 );
}

void Rmpf_sub_ui(mpf_t * dest, mpf_t * src, SV * num) {
     mpf_sub_ui(*dest, *src, SvUV(num));
}

void Rmpf_ui_sub(mpf_t * dest, SV * num, mpf_t * src) {
     mpf_ui_sub(*dest, SvUV(num), *src);
}

void Rmpf_mul(mpf_t * dest, mpf_t * src1, mpf_t * src2) {
     mpf_mul(*dest, *src1, *src2 );
}

void Rmpf_mul_ui(mpf_t * dest, mpf_t * src, SV * num) {
     mpf_mul_ui(*dest, *src, SvUV(num));
}

void Rmpf_div(mpf_t * d, mpf_t * p, mpf_t * q) {
     mpf_div(*d, *p, *q);    
}

void Rmpf_ui_div(mpf_t * d, SV * p, mpf_t * q) {
     mpf_ui_div(*d, SvUV(p), *q);    
}

void Rmpf_div_ui(mpf_t * d, mpf_t * p, SV * q) {
     mpf_div_ui(*d, *p, SvUV(q));    
}

void Rmpf_sqrt(mpf_t * r, mpf_t * x) {
     mpf_sqrt(*r, *x);
}

void Rmpf_sqrt_ui(mpf_t * r, SV * x) {
     mpf_sqrt_ui(*r, SvUV(x));
}

void Rmpf_pow_ui(mpf_t * r, mpf_t * num, SV * pow) {
     mpf_pow_ui(*r, *num, SvUV(pow));
}

void Rmpf_neg(mpf_t * r, mpf_t * x) {
     mpf_neg(*r, *x);
}

void Rmpf_abs(mpf_t * r, mpf_t * x) {
     mpf_abs(*r, *x);
}

void Rmpf_mul_2exp(mpf_t * r, mpf_t * x, SV * s) {
     mpf_mul_2exp(*r, *x, SvUV(s));
}

void Rmpf_div_2exp(mpf_t * r, mpf_t * x, SV * s) {
     mpf_div_2exp(*r, *x, SvUV(s));
}

SV * Rmpf_eq(mpf_t * a, mpf_t * b, SV * bits) {
     return newSViv(mpf_eq(*a, *b, SvUV(bits)));
}

void Rmpf_reldiff(mpf_t * d, mpf_t * p, mpf_t * q){
     mpf_reldiff(*d, *p, *q);
}

SV * Rmpf_sgn(mpf_t * p) {
     return newSViv(mpf_sgn(*p));
}

SV * Rmpf_inp_str(mpf_t * p, SV * base) {
     return newSVuv(mpf_inp_str(*p, NULL, SvUV(base)));
}

void Rmpf_ceil(mpf_t * p, mpf_t * q) {
     mpf_ceil(*p, *q);
}

void Rmpf_floor(mpf_t * p, mpf_t * q) {
     mpf_floor(*p, *q);
}

void Rmpf_trunc(mpf_t * p, mpf_t * q) {
     mpf_trunc(*p, *q);
}

SV * Rmpf_integer_p(mpf_t * p) {
     return newSViv(mpf_integer_p(*p));
}

SV * Rmpf_fits_ulong_p(mpf_t * p) {
     return newSViv(mpf_fits_ulong_p(*p));
}

SV * Rmpf_fits_slong_p(mpf_t * p) {
     return newSViv(mpf_fits_slong_p(*p));
}

SV * Rmpf_fits_uint_p(mpf_t * p) {
     return newSViv(mpf_fits_uint_p(*p));
}

SV * Rmpf_fits_sint_p(mpf_t * p) {
     return newSViv(mpf_fits_sint_p(*p));
}

SV * Rmpf_fits_ushort_p(mpf_t * p) {
     return newSViv(mpf_fits_ushort_p(*p));
}

SV * Rmpf_fits_sshort_p(mpf_t * p) {
     return newSViv(mpf_fits_sshort_p(*p));
}

/* Finish typemapping - typemap 1st arg only */

SV * overload_mul(mpf_t * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_mul function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_mul");
       mpf_mul(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpf_mul_ui(*mpf_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_mul_ui(*mpf_t_obj, *a, SvUV(b));
         return obj_ref;
         }
       mpf_mul_ui(*mpf_t_obj, *a, SvIV(b) * -1);
       mpf_neg(*mpf_t_obj, *mpf_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       _Rmpf_set_ld(mpf_t_obj, b);
#else
       mpf_set_d(*mpf_t_obj, SvNV(b));
#endif
       mpf_mul(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_mul");
       mpf_mul(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_mul(*mpf_t_obj, *a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_mul");
}

SV * overload_add(mpf_t * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_add function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_add");
       mpf_add(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       mpf_add_ui(*mpf_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_add_ui(*mpf_t_obj, *a, SvUV(b));
         return obj_ref;
         }
       mpf_sub_ui(*mpf_t_obj, *a, SvIV(b) * -1);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       _Rmpf_set_ld(mpf_t_obj, b);
#else
       mpf_set_d(*mpf_t_obj, SvNV(b));
#endif
       mpf_add(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_add");
       mpf_add(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_add(*mpf_t_obj, *a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_add");
}

SV * overload_sub(mpf_t * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sub function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_sub");
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_sub(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) mpf_ui_sub(*mpf_t_obj, SvUV(b), *a);
       else mpf_sub_ui(*mpf_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) mpf_ui_sub(*mpf_t_obj, SvUV(b), *a);
         else mpf_sub_ui(*mpf_t_obj, *a, SvUV(b));
         return obj_ref;
         }
       mpf_add_ui(*mpf_t_obj, *a, SvIV(b) * -1);
       if(third == &PL_sv_yes) mpf_neg(*mpf_t_obj, *mpf_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       _Rmpf_set_ld(mpf_t_obj, b);
#else
       mpf_set_d(*mpf_t_obj, SvNV(b));
#endif
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_sub(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_sub");
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_sub(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_sub(*mpf_t_obj, *a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_sub function");

}

SV * overload_div(mpf_t * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_div function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_div");
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_div(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvUV(b), *a);
       else mpf_div_ui(*mpf_t_obj, *a, SvUV(b));
       return obj_ref;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvUV(b), *a);
         else mpf_div_ui(*mpf_t_obj, *a, SvUV(b));
         return obj_ref;
         }
       if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvIV(b) * -1, *a);
       else mpf_div_ui(*mpf_t_obj, *a, SvIV(b) * -1);
       mpf_neg(*mpf_t_obj, *mpf_t_obj);
       return obj_ref;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       _Rmpf_set_ld(mpf_t_obj, b);
#else
       mpf_set_d(*mpf_t_obj, SvNV(b));
#endif
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_div(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_div");
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *a);
       else mpf_div(*mpf_t_obj, *a, *mpf_t_obj);
       return obj_ref;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_div(*mpf_t_obj, *a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_div function");

}

SV * overload_copy(mpf_t * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_copy function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");

     mpf_init(*mpf_t_obj);
     mpf_set(*mpf_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_abs(mpf_t * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_abs function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     mpf_abs(*mpf_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_gt(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gt");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gt");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_gt");
}

SV * overload_gte(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gte");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gte");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret >= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_gte");
}

SV * overload_lt(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lt");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lt");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_lt");
}

SV * overload_lte(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lte");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lte");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret <= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_lte");
}

SV * overload_spaceship(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_spaceship");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_spaceship");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(-1);
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_spaceship");
}

SV * overload_equiv(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_equiv");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_equiv");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret == 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_equiv");
}

SV * overload_not_equiv(mpf_t * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_not_equiv");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*a, SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
     if(SvIOK(b)) {
       ret = mpf_cmp_si(*a, SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_not_equiv");
       ret = mpf_cmp(*a, t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*a, *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret != 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_not_equiv");
}

SV * overload_not(mpf_t * a, SV * second, SV * third) {
     if(mpf_cmp_ui(*a, 0)) return newSViv(0);
     return newSViv(1);
}

SV * overload_sqrt(mpf_t * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     if(mpf_cmp_ui(*p, 0) < 0) croak("Negative value supplied as argument to overload_sqrt");
     mpf_sqrt(*mpf_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_pow(mpf_t * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

     if(SvUOK(second)) {
       mpf_pow_ui(*mpf_t_obj, *p, SvUV(second));
       return obj_ref;
       }

     if(SvIOK(second)) {
       if(SvIV(second) >= 0) {
         mpf_pow_ui(*mpf_t_obj, *p, SvUV(second));
         return obj_ref;
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_pow. The function handles only positive 'unsigned long' exponents.");
}

SV * overload_int(mpf_t * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_int function");
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     mpf_trunc(*mpf_t_obj, *p);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

/* Finish typemapping */

void Rmpf_urandomb(SV * p, ...) {
     Inline_Stack_Vars;
     unsigned long q, i, thingies;

     thingies = Inline_Stack_Items;
     q = SvUV(Inline_Stack_Item(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpf_urandomb function");

     for(i = 0; i < q; ++i) {
        mpf_urandomb(*(INT2PTR(mpf_t *, SvIV(SvRV(Inline_Stack_Item(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(Inline_Stack_Item(thingies - 3))))), SvUV(Inline_Stack_Item(thingies - 2)));
        }

     Inline_Stack_Void;
}

void Rmpf_random2(SV * x, ...){
     Inline_Stack_Vars;
     unsigned long q, i, thingies;

     thingies = Inline_Stack_Items;
     q = SvUV(Inline_Stack_Item(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpf_random2 function"); 

     for(i = 0; i < q; ++i) {
        mpf_random2(*(INT2PTR(mpf_t *, SvIV(SvRV(Inline_Stack_Item(i))))), SvIV(Inline_Stack_Item(thingies - 3)), SvUV(Inline_Stack_Item(thingies - 2)));
        }

     Inline_Stack_Void;
}

SV * get_refcnt(SV * s) {
     return newSVuv(SvREFCNT(s));
}

SV * overload_mul_eq(SV * a, SV * b, SV * third) {
     mpf_t t;

     SvREFCNT_inc(a);


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_mul_eq");
         }
       mpf_mul(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpf_mul_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_mul_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpf_mul_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       mpf_neg(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       return a;
       }
#endif


     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       mpf_mul(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_mul_eq");
         }
       mpf_mul(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_mul(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPf::overload_mul_eq");
}

SV * overload_add_eq(SV * a, SV * b, SV * third) {
     mpf_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_add_eq");
         }
       mpf_add(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpf_add_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_add_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpf_sub_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       mpf_add(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_add_eq");
         }
       mpf_add(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_add(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPf::overload_add_eq");
}

SV * overload_sub_eq(SV * a, SV * b, SV * third) {
     mpf_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_sub_eq");
         }
       mpf_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpf_sub_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_sub_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpf_add_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       mpf_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_sub_eq");
         }
       mpf_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPf::overload_sub_eq function");

}

SV * overload_div_eq(SV * a, SV * b, SV * third) {
     mpf_t t;

     SvREFCNT_inc(a);

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_div_eq");
         }
       mpf_div(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }
#else
     if(SvUOK(b)) {
       mpf_div_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return a;
       }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_div_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return a;
         }
       mpf_div_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       mpf_neg(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       return a;
       }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       mpf_init(t);
       _Rmpf_set_ld(&t, b);
#else
       mpf_init_set_d(t, SvNV(b));
#endif
       mpf_div(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10)) {
         SvREFCNT_dec(a);
         croak("Invalid string supplied to Math::GMPf::overload_div_eq");
         }
       mpf_div(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       return a;
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_div(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return a;
         }
       }

     SvREFCNT_dec(a);
     croak("Invalid argument supplied to Math::GMPf::overload_div_eq function");

}

SV * overload_pow_eq(SV * p, SV * second, SV * third) {

     SvREFCNT_inc(p);

     if(SvUOK(second)) {
       mpf_pow_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(second));
       return p;
       }

     if(SvIOK(second)) {
       if(SvIV(second) >= 0) {
         mpf_pow_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(second));
         return p;
         }
       }

     SvREFCNT_dec(p);
     croak("Invalid argument supplied to Math::GMPf::overload_pow_eq. The function handles only positive 'unsigned long' exponents.");
}

SV * gmp_v() {
     return newSVpv(gmp_version, 0);
}

void wrap_gmp_printf(SV * a, SV * b) {
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
          strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
          strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz"))
          gmp_printf(SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
       else {
         if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
            strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq"))
            gmp_printf(SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         else {
           if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
              strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf"))
              gmp_printf(SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
              else croak("Unrecognised object supplied as argument to Rmpf_printf");
           }
         }
       } 

     else {
       if(SvUOK(b)) gmp_printf(SvPV_nolen(a), SvUV(b));
       else {
         if(SvIOK(b)) gmp_printf(SvPV_nolen(a), SvIV(b)); 
         else {
           if(SvNOK(b)) gmp_printf(SvPV_nolen(a), SvNV(b)); 
           else {
             if(SvPOK(b)) gmp_printf(SvPV_nolen(a), SvPV_nolen(b));
             else croak("Unrecognised type supplied as argument to Rmpf_printf");
             }
           } 
         }
       }
}

SV * _itsa(SV * a) {
     if(SvUOK(a)) return newSVuv(1);
     if(SvIOK(a)) return newSVuv(2);
     if(SvNOK(a)) return newSVuv(3);
     if(SvPOK(a)) return newSVuv(4);
     if(sv_isobject(a)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(a))), "Math::GMPf")) return newSVuv(6);
       }
     return newSVuv(0);
}


int _has_longlong() {
#ifdef USE_64_BIT_INT
    return 1;
#else
    return 0;
#endif
}

int _has_longdouble() {
#ifdef USE_LONG_DOUBLE
    return 1;
#else
    return 0;
#endif
}

/* Has inttypes.h been included ? */
int _has_inttypes() {
#ifdef _MSC_VER
return 0;
#else
#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
return 1;
#else
return 0;
#endif
#endif
}
MODULE = Math::GMPf	PACKAGE = Math::GMPf	

PROTOTYPES: DISABLE


SV *
Rmpf_get_default_prec ()

void
Rmpf_set_default_prec (prec)
	SV *	prec
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_default_prec(prec);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_init_set_str_nobless (str, base)
	SV *	str
	SV *	base

SV *
Rmpf_init2_nobless (prec)
	SV *	prec

SV *
Rmpf_init_set_str (str, base)
	SV *	str
	SV *	base

SV *
Rmpf_init2 (prec)
	SV *	prec

SV *
Rmpf_init_nobless ()

SV *
Rmpf_init ()

SV *
Rmpf_init_set (a)
	mpf_t *	a

SV *
Rmpf_init_set_ui (a)
	SV *	a

SV *
Rmpf_init_set_si (a)
	SV *	a

SV *
Rmpf_init_set_d (a)
	SV *	a

void
_Rmpf_set_ld (q, p)
	mpf_t *	q
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	_Rmpf_set_ld(q, p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_init_set_nobless (a)
	mpf_t *	a

SV *
Rmpf_init_set_ui_nobless (a)
	SV *	a

SV *
Rmpf_init_set_si_nobless (a)
	SV *	a

SV *
Rmpf_init_set_d_nobless (a)
	SV *	a

void
Rmpf_deref2 (p, base, n_digits)
	mpf_t *	p
	SV *	base
	SV *	n_digits
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_deref2(p, base, n_digits);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
DESTROY (p)
	mpf_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	DESTROY(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_clear (p)
	mpf_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_clear(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_clear_mpf (p)
	mpf_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_clear_mpf(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_clear_ptr (p)
	mpf_t *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_clear_ptr(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_get_prec (p)
	mpf_t *	p

void
Rmpf_set_prec (p, prec)
	mpf_t *	p
	SV *	prec
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_prec(p, prec);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_prec_raw (p, prec)
	mpf_t *	p
	SV *	prec
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_prec_raw(p, prec);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set (p1, p2)
	mpf_t *	p1
	mpf_t *	p2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set(p1, p2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_ui (p, ul)
	mpf_t *	p
	SV *	ul
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_ui(p, ul);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_si (p, l)
	mpf_t *	p
	SV *	l
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_si(p, l);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_d (p, d)
	mpf_t *	p
	SV *	d
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_d(p, d);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_z (p, z)
	mpf_t *	p
	mpz_t *	z
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_z(p, z);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_q (p, q)
	mpf_t *	p
	mpq_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_q(p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_set_str (p, str, base)
	mpf_t *	p
	SV *	str
	SV *	base
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_set_str(p, str, base);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_swap (p1, p2)
	mpf_t *	p1
	mpf_t *	p2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_swap(p1, p2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
_Rmpf_out_str (p, base, digits)
	mpf_t *	p
	SV *	base
	SV *	digits

SV *
_Rmpf_out_str2 (p, base, dig, suff)
	mpf_t *	p
	SV *	base
	SV *	dig
	SV *	suff

SV *
Rmpf_cmp (p1, p2)
	mpf_t *	p1
	mpf_t *	p2

SV *
Rmpf_cmp_ui (p, ul)
	mpf_t *	p
	SV *	ul

SV *
Rmpf_cmp_si (p, l)
	mpf_t *	p
	SV *	l

SV *
Rmpf_cmp_d (p, d)
	mpf_t *	p
	SV *	d

SV *
Rmpf_get_d (p)
	mpf_t *	p

SV *
Rmpf_get_si (p)
	mpf_t *	p

SV *
Rmpf_get_ui (p)
	mpf_t *	p

void
Rmpf_get_d_2exp (n)
	mpf_t *	n
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_get_d_2exp(n);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_add (dest, src1, src2)
	mpf_t *	dest
	mpf_t *	src1
	mpf_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_add(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_add_ui (dest, src, num)
	mpf_t *	dest
	mpf_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_add_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_sub (dest, src1, src2)
	mpf_t *	dest
	mpf_t *	src1
	mpf_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_sub(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_sub_ui (dest, src, num)
	mpf_t *	dest
	mpf_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_sub_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_ui_sub (dest, num, src)
	mpf_t *	dest
	SV *	num
	mpf_t *	src
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_ui_sub(dest, num, src);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_mul (dest, src1, src2)
	mpf_t *	dest
	mpf_t *	src1
	mpf_t *	src2
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_mul(dest, src1, src2);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_mul_ui (dest, src, num)
	mpf_t *	dest
	mpf_t *	src
	SV *	num
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_mul_ui(dest, src, num);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_div (d, p, q)
	mpf_t *	d
	mpf_t *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_div(d, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_ui_div (d, p, q)
	mpf_t *	d
	SV *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_ui_div(d, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_div_ui (d, p, q)
	mpf_t *	d
	mpf_t *	p
	SV *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_div_ui(d, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_sqrt (r, x)
	mpf_t *	r
	mpf_t *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_sqrt(r, x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_sqrt_ui (r, x)
	mpf_t *	r
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_sqrt_ui(r, x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_pow_ui (r, num, pow)
	mpf_t *	r
	mpf_t *	num
	SV *	pow
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_pow_ui(r, num, pow);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_neg (r, x)
	mpf_t *	r
	mpf_t *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_neg(r, x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_abs (r, x)
	mpf_t *	r
	mpf_t *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_abs(r, x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_mul_2exp (r, x, s)
	mpf_t *	r
	mpf_t *	x
	SV *	s
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_mul_2exp(r, x, s);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_div_2exp (r, x, s)
	mpf_t *	r
	mpf_t *	x
	SV *	s
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_div_2exp(r, x, s);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_eq (a, b, bits)
	mpf_t *	a
	mpf_t *	b
	SV *	bits

void
Rmpf_reldiff (d, p, q)
	mpf_t *	d
	mpf_t *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_reldiff(d, p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_sgn (p)
	mpf_t *	p

SV *
Rmpf_inp_str (p, base)
	mpf_t *	p
	SV *	base

void
Rmpf_ceil (p, q)
	mpf_t *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_ceil(p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_floor (p, q)
	mpf_t *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_floor(p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_trunc (p, q)
	mpf_t *	p
	mpf_t *	q
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_trunc(p, q);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
Rmpf_integer_p (p)
	mpf_t *	p

SV *
Rmpf_fits_ulong_p (p)
	mpf_t *	p

SV *
Rmpf_fits_slong_p (p)
	mpf_t *	p

SV *
Rmpf_fits_uint_p (p)
	mpf_t *	p

SV *
Rmpf_fits_sint_p (p)
	mpf_t *	p

SV *
Rmpf_fits_ushort_p (p)
	mpf_t *	p

SV *
Rmpf_fits_sshort_p (p)
	mpf_t *	p

SV *
overload_mul (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_add (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_sub (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_div (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_copy (p, second, third)
	mpf_t *	p
	SV *	second
	SV *	third

SV *
overload_abs (p, second, third)
	mpf_t *	p
	SV *	second
	SV *	third

SV *
overload_gt (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_gte (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_lt (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_lte (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_spaceship (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_equiv (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_not_equiv (a, b, third)
	mpf_t *	a
	SV *	b
	SV *	third

SV *
overload_not (a, second, third)
	mpf_t *	a
	SV *	second
	SV *	third

SV *
overload_sqrt (p, second, third)
	mpf_t *	p
	SV *	second
	SV *	third

SV *
overload_pow (p, second, third)
	mpf_t *	p
	SV *	second
	SV *	third

SV *
overload_int (p, second, third)
	mpf_t *	p
	SV *	second
	SV *	third

void
Rmpf_urandomb (p, ...)
	SV *	p
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_urandomb(p);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

void
Rmpf_random2 (x, ...)
	SV *	x
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	Rmpf_random2(x);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
get_refcnt (s)
	SV *	s

SV *
overload_mul_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_pow_eq (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
gmp_v ()

void
wrap_gmp_printf (a, b)
	SV *	a
	SV *	b
	PREINIT:
	I32* temp;
	PPCODE:
	temp = PL_markstack_ptr++;
	wrap_gmp_printf(a, b);
	if (PL_markstack_ptr != temp) {
          /* truly void, because dXSARGS not invoked */
	  PL_markstack_ptr = temp;
	  XSRETURN_EMPTY; /* return empty stack */
        }
        /* must have used dXSARGS; list context implied */
	return; /* assume stack size is correct */

SV *
_itsa (a)
	SV *	a

int
_has_longlong ()

int
_has_longdouble ()

int
_has_inttypes ()

