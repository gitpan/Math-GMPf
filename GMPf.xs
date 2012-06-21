#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

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

#ifndef Newx
#  define Newx(v,n,t) New(0,v,n,t)
#endif

#ifndef Newxz
#  define Newxz(v,n,t) Newz(0,v,n,t)
#endif

SV * Rmpf_get_default_prec(void) {
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
     if(mpf_init_set_str(*mpf_t_obj, SvPV_nolen(str), SvIV(base)))
       croak("First arg to Rmpf_init_set_str_nobless() is not a valid base %d number", (signed long int)SvIV(base));
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, NULL);
     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
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
     if(mpf_init_set_str(*mpf_t_obj, SvPV_nolen(str), SvIV(base)))
       croak("First arg to Rmpf_init_set_str() is not a valid base %d number", (signed long int)SvIV(base));
     obj_ref = newSV(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
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

SV * Rmpf_init_nobless(void) {
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

SV * Rmpf_init(void) {
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
     dXSARGS;
     char * out;
     mp_exp_t ptr;
     int b = (int)SvIV(base);
     size_t n_dig = (size_t)SvUV(n_digits);

     if(!n_dig) {
        n_dig = (double)(mpf_get_prec(*p)) / log(b) * log(2);
        }

     if((b < 2 && b > -2) || b > 62 || b < -36) croak("Second argument supplied to Rmpf_get_str() is not in acceptable range");

     New(2, out, n_dig + 5 , char);
     if(out == NULL) croak("Failed to allocate memory in Rmpf_get_str function");

     mpf_get_str(out, &ptr, b, SvUV(n_digits), *p);

     /* sp = mark; */ /* not needed */
     ST(0) = sv_2mortal(newSVpv(out, 0));
     Safefree(out);
     ST(1) = sv_2mortal(newSViv(ptr));
     /* PUTBACK; */ /* not needed */
     XSRETURN(2);
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
      croak("2nd arg to Rmpf_set_str() is not a valid base %d number", (signed long int)SvIV(base));
}

void Rmpf_swap(mpf_t * p1, mpf_t * p2) {
     mpf_swap(*p1, *p2);
}

SV * _TRmpf_out_str(FILE * stream, SV * base, SV * dig, mpf_t * p) {
     size_t ret;
     ret = mpf_out_str(stream, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stream);
     return newSVuv(ret);
}

SV * _Rmpf_out_str(mpf_t * p, SV * base, SV * dig) {
     size_t ret;
     ret = mpf_out_str(NULL, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stdout);
     return newSVuv(ret);
}

SV * _TRmpf_out_strS(FILE * stream, SV * base, SV * dig, mpf_t * p, SV * suff) {
     size_t ret;
     ret = mpf_out_str(stream, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stream);
     fprintf(stream, "%s", SvPV_nolen(suff));
     return newSVuv(ret);
}

SV * _TRmpf_out_strP(SV * pre, FILE * stream, SV * base, SV * dig, mpf_t * p) {
     size_t ret;
     fprintf(stream, "%s", SvPV_nolen(pre));
     fflush(stream);
     ret = mpf_out_str(stream, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stream);
     return newSVuv(ret);
}

SV * _TRmpf_out_strPS(SV * pre, FILE * stream, SV * base, SV * dig, mpf_t * p, SV * suff) {
     size_t ret;
     fprintf(stream, "%s", SvPV_nolen(pre));
     fflush(stream);
     ret = mpf_out_str(stream, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stream);
     fprintf(stream, "%s", SvPV_nolen(suff));
     fflush(stream);
     return newSVuv(ret);
}

SV * _Rmpf_out_strS(mpf_t * p, SV * base, SV * dig, SV * suff) {
     size_t ret;
     ret = mpf_out_str(NULL, (int)SvIV(base), (size_t)SvUV(dig), *p);
     printf("%s", SvPV_nolen(suff));
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpf_out_strP(SV * pre, mpf_t * p, SV * base, SV * dig) {
     size_t ret;
     printf("%s", SvPV_nolen(pre));
     ret = mpf_out_str(NULL, (int)SvIV(base), (size_t)SvUV(dig), *p);
     fflush(stdout);
     return newSVuv(ret);
}

SV * _Rmpf_out_strPS(SV * pre, mpf_t * p, SV * base, SV * dig, SV * suff) {
     size_t ret;
     printf("%s", SvPV_nolen(pre));
     ret = mpf_out_str(NULL, (int)SvIV(base), (size_t)SvUV(dig), *p);
     printf("%s", SvPV_nolen(suff));
     fflush(stdout);
     return newSVuv(ret);
}

SV * TRmpf_inp_str(mpf_t * p, FILE * stream, SV * base) {
     size_t ret;
     ret = mpf_inp_str(*p, stream, (int)SvIV(base));
     /* fflush(stream); */
     return newSVuv(ret);
}

SV * Rmpf_inp_str(mpf_t * p, SV * base) {
     size_t ret;
     ret = mpf_inp_str(*p, NULL, (int)SvIV(base));
     /* fflush(stdin); */
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
     dXSARGS;
     double d;
     long exp;

     d = mpf_get_d_2exp(&exp, *n);
 
     /* sp = mark; */ /* not needed */
     EXTEND(SP, 2);
     ST(0) = sv_2mortal(newSVnv(d));
     ST(1) = sv_2mortal(newSViv(exp));
     /* PUTBACK; */ /* not needed */
     XSRETURN(2);
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

SV * overload_mul(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     if(!sv_isobject(b) || strNE(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
       New(1, mpf_t_obj, 1, mpf_t);
       if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_mul function");
       obj_ref = newSV(0);
       obj = newSVrv(obj_ref, "Math::GMPf");
       mpf_init(*mpf_t_obj);
       sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
       SvREADONLY_on(obj);
     }

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_mul");
       mpf_mul(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }
#else
     if(SvUOK(b)) {
       mpf_mul_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
     }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_mul_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return obj_ref;
       }
       mpf_mul_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
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
       mpf_mul(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_mul");
       mpf_mul(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_mul(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
         dSP;
         SV * ret;
         int count;

         ENTER;

         PUSHMARK(SP);
         XPUSHs(b);
         XPUSHs(a);
         XPUSHs(sv_2mortal(newSViv(1)));
         PUTBACK;

         count = call_pv("Math::MPFR::overload_mul", G_SCALAR);

         SPAGAIN;

         if (count != 1)
           croak("Error in Math::GMPf::overload_mul callback to Math::MPFR::overload_mul\n");

         ret = POPs;

         /* Avoid "Attempt to free unreferenced scalar" warning */
         SvREFCNT_inc(ret);
         LEAVE;
         return ret;
       }
     }

     croak("Invalid argument supplied to Math::GMPf::overload_mul");
}

SV * overload_add(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     if(!sv_isobject(b) || strNE(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
       New(1, mpf_t_obj, 1, mpf_t);
       if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_add function");
       obj_ref = newSV(0);
       obj = newSVrv(obj_ref, "Math::GMPf");
       mpf_init(*mpf_t_obj);
       sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
       SvREADONLY_on(obj);
     }

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_add");
       mpf_add(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }
#else
     if(SvUOK(b)) {
       mpf_add_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
     }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         mpf_add_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return obj_ref;
       }
       mpf_sub_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
       return obj_ref;
     }
#endif

     if(SvNOK(b)) {
#ifdef USE_LONG_DOUBLE
       _Rmpf_set_ld(mpf_t_obj, b);
#else
       mpf_set_d(*mpf_t_obj, SvNV(b));
#endif
       mpf_add(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_add");
       mpf_add(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_add(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
         dSP;
         SV * ret;
         int count;

         ENTER;

         PUSHMARK(SP);
         XPUSHs(b);
         XPUSHs(a);
         XPUSHs(sv_2mortal(newSViv(1)));
         PUTBACK;

         count = call_pv("Math::MPFR::overload_add", G_SCALAR);

         SPAGAIN;

         if (count != 1)
           croak("Error in Math::GMPf:overload_add callback to Math::MPFR::overload_add\n");

         ret = POPs;

         /* Avoid "Attempt to free unreferenced scalar" warning */
         SvREFCNT_inc(ret);
         LEAVE;
         return ret;
       }
     }

     croak("Invalid argument supplied to Math::GMPf::overload_add");
}

SV * overload_sub(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     if(!sv_isobject(b) || strNE(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
       New(1, mpf_t_obj, 1, mpf_t);
       if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sub function");
       obj_ref = newSV(0);
       obj = newSVrv(obj_ref, "Math::GMPf");
       mpf_init(*mpf_t_obj);
       sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
       SvREADONLY_on(obj);
     }

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_sub");
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_sub(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) mpf_ui_sub(*mpf_t_obj, SvUV(b), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_sub_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
     }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) mpf_ui_sub(*mpf_t_obj, SvUV(b), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
         else mpf_sub_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return obj_ref;
       }
       mpf_add_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
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
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_sub(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_sub");
       if(third == &PL_sv_yes) mpf_sub(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_sub(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_sub(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
         dSP;
         SV * ret;
         int count;

         ENTER;

         PUSHMARK(SP);
         XPUSHs(b);
         XPUSHs(a);
         XPUSHs(sv_2mortal(&PL_sv_yes));
         PUTBACK;

         count = call_pv("Math::MPFR::overload_sub", G_SCALAR);

         SPAGAIN;

         if (count != 1)
           croak("Error in Math::GMPf:overload_sub callback to Math::MPFR::overload_sub\n");

         ret = POPs;

         /* Avoid "Attempt to free unreferenced scalar" warning */
         SvREFCNT_inc(ret);
         LEAVE;
         return ret;
       }
     }

     croak("Invalid argument supplied to Math::GMPf::overload_sub function");

}

SV * overload_div(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     if(!sv_isobject(b) || strNE(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
       New(1, mpf_t_obj, 1, mpf_t);
       if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_div function");
       obj_ref = newSV(0);
       obj = newSVrv(obj_ref, "Math::GMPf");
       mpf_init(*mpf_t_obj);
       sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
       SvREADONLY_on(obj);
     }

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_div");
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_div(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }
#else
     if(SvUOK(b)) {
       if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvUV(b), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_div_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       return obj_ref;
     }

     if(SvIOK(b)) {
       if(SvIV(b) >= 0) {
         if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvUV(b), *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
         else mpf_div_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
         return obj_ref;
       }
       if(third == &PL_sv_yes) mpf_ui_div(*mpf_t_obj, SvIV(b) * -1, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_div_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b) * -1);
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
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_div(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(SvPOK(b)) {
       if(mpf_set_str(*mpf_t_obj, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_div");
       if(third == &PL_sv_yes) mpf_div(*mpf_t_obj, *mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));
       else mpf_div(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *mpf_t_obj);
       return obj_ref;
     }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         mpf_div(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return obj_ref;
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::MPFR")) {
         dSP;
         SV * ret;
         int count;

         ENTER;

         PUSHMARK(SP);
         XPUSHs(b);
         XPUSHs(a);
         XPUSHs(sv_2mortal(&PL_sv_yes));
         PUTBACK;

         count = call_pv("Math::MPFR::overload_div", G_SCALAR);

         SPAGAIN;

         if (count != 1)
           croak("Error in Math::GMPf::overload_div callback to Math::MPFR::overload_div\n");

         ret = POPs;

         /* Avoid "Attempt to free unreferenced scalar" warning */
         SvREFCNT_inc(ret);
         LEAVE;
         return ret;
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

     mpf_init2(*mpf_t_obj, mpf_get_prec(*p));
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

SV * overload_pow(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     if(!sv_isobject(second)) {
       New(1, mpf_t_obj, 1, mpf_t);
       if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
       obj_ref = newSV(0);
       obj = newSVrv(obj_ref, "Math::GMPf");
       mpf_init(*mpf_t_obj);
       sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
       SvREADONLY_on(obj);
     }

     if(SvUOK(second)) {
       mpf_pow_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(second));
       return obj_ref;
     }

     if(SvIOK(second)) {
       if(SvIV(second) >= 0) {
         mpf_pow_ui(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(second));
         return obj_ref;
       }
     }

     if(sv_isobject(second)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(second))), "Math::MPFR")) {
         dSP;
         SV * ret;
         int count;

         ENTER;

         PUSHMARK(SP);
         XPUSHs(second);
         XPUSHs(p);
         XPUSHs(sv_2mortal(&PL_sv_yes));
         PUTBACK;

         count = call_pv("Math::MPFR::overload_pow", G_SCALAR);

         SPAGAIN;

         if (count != 1)
           croak("Error in Math::GMPf:overload_pow callback to Math::MPFR::overload_pow\n");

         ret = POPs;

         /* Avoid "Attempt to free unreferenced scalar" warning */
         SvREFCNT_inc(ret);
         LEAVE;
         return ret;
       }
     }

     croak("Invalid argument supplied to Math::GMPf::overload_pow. The function handles only unsigned longs and Math::MPFR objects as exponents.");
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
     dXSARGS;
     unsigned long q, i, thingies;

     thingies = items;
     q = SvUV(ST(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpf_urandomb function");

     for(i = 0; i < q; ++i) {
        mpf_urandomb(*(INT2PTR(mpf_t *, SvIV(SvRV(ST(i))))), *(INT2PTR(gmp_randstate_t *, SvIV(SvRV(ST(thingies - 3))))), SvUV(ST(thingies - 2)));
        }

     XSRETURN(0);
}

void Rmpf_random2(SV * x, ...){
     dXSARGS;
     unsigned long q, i, thingies;

     thingies = items;
     q = SvUV(ST(thingies - 1)); 

     if((q + 3) != thingies) croak ("Wrong args supplied to mpf_random2 function"); 

     for(i = 0; i < q; ++i) {
        mpf_random2(*(INT2PTR(mpf_t *, SvIV(SvRV(ST(i))))), SvIV(ST(thingies - 3)), SvUV(ST(thingies - 2)));
        }

     XSRETURN(0);
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

SV * gmp_v(void) {
     return newSVpv(gmp_version, 0);
}

SV * wrap_gmp_printf(SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_printf(SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         fflush(stdout);
         return newSViv(ret);
       }
   
       croak("Unrecognised object supplied as argument to Rmpf_printf");
     } 

     if(SvUOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvUV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvIOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvIV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvNOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvNV(b));
       fflush(stdout);
       return newSViv(ret);
     }
     if(SvPOK(b)) {
       ret = gmp_printf(SvPV_nolen(a), SvPV_nolen(b));
       fflush(stdout);
       return newSViv(ret);
     }
  
     croak("Unrecognised type supplied as argument to Rmpf_printf");
}

SV * wrap_gmp_fprintf(FILE * stream, SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_fprintf(stream, SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         fflush(stream);
         return newSViv(ret);
       }
 
       else croak("Unrecognised object supplied as argument to Rmpf_fprintf");
     } 

     if(SvUOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvUV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvIOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvIV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvNOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvNV(b));
       fflush(stream);
       return newSViv(ret);
     }
     if(SvPOK(b)) {
       ret = gmp_fprintf(stream, SvPV_nolen(a), SvPV_nolen(b));
       fflush(stream);
       return newSViv(ret);
     }

     croak("Unrecognised type supplied as argument to Rmpf_fprintf");
}

SV * wrap_gmp_sprintf(char * stream, SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_sprintf(stream, SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       croak("Unrecognised object supplied as argument to Rmpf_sprintf");
     } 

     if(SvUOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvUV(b));
       return newSViv(ret);
     }

     if(SvIOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvIV(b));
       return newSViv(ret);
     }

     if(SvNOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvNV(b));
       return newSViv(ret);
     }

     if(SvPOK(b)) {
       ret = gmp_sprintf(stream, SvPV_nolen(a), SvPV_nolen(b));
       return newSViv(ret);
     }

     croak("Unrecognised type supplied as argument to Rmpf_sprintf");
}

SV * wrap_gmp_snprintf(char * stream, SV * bytes, SV * a, SV * b) {
     int ret;
     if(sv_isobject(b)) { 
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPz") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMP") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpz")) {
         ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), *(INT2PTR(mpz_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPq") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpq")) {
         ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), *(INT2PTR(mpq_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf") ||
         strEQ(HvNAME(SvSTASH(SvRV(b))), "GMP::Mpf")) {
         ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         return newSViv(ret);
       }

       croak("Unrecognised object supplied as argument to Rmpf_snprintf");
     } 

     if(SvUOK(b)) {
       ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), SvUV(b));
       return newSViv(ret);
     }

     if(SvIOK(b)) {
       ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), SvIV(b));
       return newSViv(ret);
     }

     if(SvNOK(b)) {
       ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), SvNV(b));
       return newSViv(ret);
     }

     if(SvPOK(b)) {
       ret = gmp_snprintf(stream, (size_t)SvUV(bytes), SvPV_nolen(a), SvPV_nolen(b));
       return newSViv(ret);
     }

     croak("Unrecognised type supplied as argument to Rmpf_snprintf");
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


int _has_longlong(void) {
#ifdef USE_64_BIT_INT
    return 1;
#else
    return 0;
#endif
}

int _has_longdouble(void) {
#ifdef USE_LONG_DOUBLE
    return 1;
#else
    return 0;
#endif
}

/* Has inttypes.h been included ? */
int _has_inttypes(void) {
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

SV * ___GNU_MP_VERSION(void) {
     return newSVuv(__GNU_MP_VERSION);
}

SV * ___GNU_MP_VERSION_MINOR(void) {
     return newSVuv(__GNU_MP_VERSION_MINOR);
}

SV * ___GNU_MP_VERSION_PATCHLEVEL(void) {
     return newSVuv(__GNU_MP_VERSION_PATCHLEVEL);
}

SV * ___GMP_CC(void) {
#ifdef __GMP_CC
     char * ret = __GMP_CC;
     return newSVpv(ret, 0);
#else
     return &PL_sv_undef;
#endif
}

SV * ___GMP_CFLAGS(void) {
#ifdef __GMP_CFLAGS
     char * ret = __GMP_CFLAGS;
     return newSVpv(ret, 0);
#else
     return &PL_sv_undef;
#endif
}

SV * overload_inc(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpf_add_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), 1);
     return p;
}

SV * overload_dec(SV * p, SV * second, SV * third) {
     SvREFCNT_inc(p);
     mpf_sub_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))),1);
     return p;
}

SV * _wrap_count(void) {
     return newSVuv(PL_sv_count);
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
_TRmpf_out_str (stream, base, dig, p)
	FILE *	stream
	SV *	base
	SV *	dig
	mpf_t *	p

SV *
_Rmpf_out_str (p, base, dig)
	mpf_t *	p
	SV *	base
	SV *	dig

SV *
_TRmpf_out_strS (stream, base, dig, p, suff)
	FILE *	stream
	SV *	base
	SV *	dig
	mpf_t *	p
	SV *	suff

SV *
_TRmpf_out_strP (pre, stream, base, dig, p)
	SV *	pre
	FILE *	stream
	SV *	base
	SV *	dig
	mpf_t *	p

SV *
_TRmpf_out_strPS (pre, stream, base, dig, p, suff)
	SV *	pre
	FILE *	stream
	SV *	base
	SV *	dig
	mpf_t *	p
	SV *	suff

SV *
_Rmpf_out_strS (p, base, dig, suff)
	mpf_t *	p
	SV *	base
	SV *	dig
	SV *	suff

SV *
_Rmpf_out_strP (pre, p, base, dig)
	SV *	pre
	mpf_t *	p
	SV *	base
	SV *	dig

SV *
_Rmpf_out_strPS (pre, p, base, dig, suff)
	SV *	pre
	mpf_t *	p
	SV *	base
	SV *	dig
	SV *	suff

SV *
TRmpf_inp_str (p, stream, base)
	mpf_t *	p
	FILE *	stream
	SV *	base

SV *
Rmpf_inp_str (p, base)
	mpf_t *	p
	SV *	base

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
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div (a, b, third)
	SV *	a
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
	SV *	p
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
		

SV *
wrap_gmp_printf (a, b)
	SV *	a
	SV *	b

SV *
wrap_gmp_fprintf (stream, a, b)
	FILE *	stream
	SV *	a
	SV *	b

SV *
wrap_gmp_sprintf (stream, a, b)
	char *	stream
	SV *	a
	SV *	b

SV *
wrap_gmp_snprintf (stream, bytes, a, b)
	char *	stream
	SV *	bytes
	SV *	a
	SV *	b

SV *
_itsa (a)
	SV *	a

int
_has_longlong ()
		

int
_has_longdouble ()
		

int
_has_inttypes ()
		

SV *
___GNU_MP_VERSION ()
		

SV *
___GNU_MP_VERSION_MINOR ()
		

SV *
___GNU_MP_VERSION_PATCHLEVEL ()
		

SV *
___GMP_CC ()
		

SV *
___GMP_CFLAGS ()
		

SV *
overload_inc (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_dec (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
_wrap_count ()
		

