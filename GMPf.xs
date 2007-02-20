#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "INLINE.h"
#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>

#if defined USE_64_BIT_INT || defined USE_LONG_DOUBLE
#include <inttypes.h>
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_ui(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_ui function");
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init_set_d(*mpf_t_obj, SvNV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_nobless(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_nobless function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(a)))));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * Rmpf_init_set_ui_nobless(SV * a) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in Rmpf_init_set_ui_nobless function");
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
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
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, NULL);
     mpf_init_set_d(*mpf_t_obj, SvNV(a));

     sv_setiv(obj, INT2PTR(IV,mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

void Rmpf_deref2(SV * p, SV * base, SV * n_digits) {
     Inline_Stack_Vars;
     char * out;
     mp_exp_t ptr, *expptr;
     unsigned long b = SvUV(base), n_dig = SvUV(n_digits);

     expptr = &ptr;

     if(!n_dig) {
        n_dig = (double)(mpf_get_prec(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))))) / log(b) * log(2);
        }

     if(b < 2 || b > 36) croak("Second argument supplied to Rmpf_get_str() is not in acceptable range");

     New(2, out, n_dig + 5 , char);
     if(out == NULL) croak("Failed to allocate memory in Rmpf_get_str function");

     mpf_get_str(out, expptr, b, n_dig, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))));

     Inline_Stack_Reset;
     Inline_Stack_Push(sv_2mortal(newSVpv(out, 0)));
     Safefree(out);
     Inline_Stack_Push(sv_2mortal(newSViv(ptr)));
     Inline_Stack_Done;
     Inline_Stack_Return(2);
}

void DESTROY(SV * p) {
/*     printf("Destroying mpf "); */
     mpf_clear(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(mpf_t *, SvIV(SvRV(p))));
/*     printf("...destroyed\n"); */
}

void Rmpf_clear(SV * p) {
     mpf_clear(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     Safefree(INT2PTR(mpf_t *, SvIV(SvRV(p))));
}

void Rmpf_clear_mpf(SV * p) {
     mpf_clear(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
}

void Rmpf_clear_ptr(SV * p) {
     Safefree(INT2PTR(mpf_t *, SvIV(SvRV(p))));
}

SV * Rmpf_get_prec(SV * p) {
     return newSVuv(mpf_get_prec(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

void Rmpf_set_prec(SV * p, SV * prec) {
     mpf_set_prec(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(prec));
}

void Rmpf_set_prec_raw(SV * p, SV * prec) {
     mpf_set_prec_raw(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(prec));
}

void Rmpf_set(SV * p1, SV * p2) {
     mpf_set(*(INT2PTR(mpf_t *, SvIV(SvRV(p1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p2)))));
}

void Rmpf_set_ui(SV * p, SV * ul) {
     mpf_set_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(ul));
}

void Rmpf_set_si(SV * p, SV * l) {
     mpf_set_si(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvIV(l));
}

void Rmpf_set_d(SV * p, SV * d) {
     mpf_set_d(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvNV(d));
}

void Rmpf_set_z(SV * p, SV * z) {
     mpf_set_z(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpz_t *, SvIV(SvRV(z)))) );
}

void Rmpf_set_q(SV * p, SV * q) {
     mpf_set_q(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpq_t *, SvIV(SvRV(q)))) );
}

void Rmpf_set_str(SV * p, SV * str, SV * base) {
     if(mpf_set_str(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvPV_nolen(str), SvIV(base)))
      croak("2nd arg to Rmpf_set_str() is not a valid base %d number", SvIV(base));
}

void Rmpf_swap(SV * p1, SV * p2) {
     mpf_swap(*(INT2PTR(mpf_t *, SvIV(SvRV(p1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p2)))));
}

SV * Rmpf_out_str(SV * p, SV * base, SV * digits) {
     return newSVuv(mpf_out_str(NULL, SvIV(base), SvUV(digits), *(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_cmp(SV * p1, SV * p2) {
     return newSViv(mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(p1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p2))))));
}

SV * Rmpf_cmp_ui(SV * p, SV * ul) {
     return newSViv(mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(ul)));
}

SV * Rmpf_cmp_si(SV * p, SV * l) {
     return newSViv(mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvIV(l)));
}

SV * Rmpf_cmp_d(SV * p, SV * d) {
     return newSViv(mpf_cmp_d(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvNV(d)));
}

SV * Rmpf_get_d(SV * p) {
     return newSVnv(mpf_get_d(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_get_si(SV * p) {
     return newSViv(mpf_get_si(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_get_ui(SV * p) {
     return newSViv(mpf_get_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

void Rmpf_get_d_2exp(SV * n) {
     Inline_Stack_Vars;
     double d;
     unsigned long exp, *expptr;

     expptr = &exp;
     d = mpf_get_d_2exp(expptr, *(INT2PTR(mpf_t *, SvIV(SvRV(n)))));
 
     Inline_Stack_Reset;
     Inline_Stack_Push(sv_2mortal(newSVnv(d)));
     Inline_Stack_Push(sv_2mortal(newSVuv(exp)));
     Inline_Stack_Done;
     Inline_Stack_Return(2);
}

void Rmpf_add(SV * dest, SV * src1, SV * src2) {
     mpf_add(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src2)))) );
}

void Rmpf_add_ui(SV * dest, SV * src, SV * num) {
     mpf_add_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpf_sub(SV * dest, SV * src1, SV * src2) {
     mpf_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src2)))) );
}

void Rmpf_sub_ui(SV * dest, SV * src, SV * num) {
     mpf_sub_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpf_ui_sub(SV * dest, SV * num, SV * src) {
     mpf_ui_sub(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), SvUV(num), *(INT2PTR(mpf_t *, SvIV(SvRV(src)))));
}

void Rmpf_mul(SV * dest, SV * src1, SV * src2) {
     mpf_mul(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src1)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src2)))) );
}

void Rmpf_mul_ui(SV * dest, SV * src, SV * num) {
     mpf_mul_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(dest)))), *(INT2PTR(mpf_t *, SvIV(SvRV(src)))), SvUV(num));
}

void Rmpf_div(SV * d, SV * p, SV * q) {
     mpf_div(*(INT2PTR(mpf_t *, SvIV(SvRV(d)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));    
}

void Rmpf_ui_div(SV * d, SV * p, SV * q) {
     mpf_ui_div(*(INT2PTR(mpf_t *, SvIV(SvRV(d)))), SvUV(p), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));    
}

void Rmpf_div_ui(SV * d, SV * p, SV * q) {
     mpf_div_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(d)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), SvUV(q));    
}

void Rmpf_sqrt(SV * r, SV * x) {
     mpf_sqrt(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(x)))));
}

void Rmpf_sqrt_ui(SV * r, SV * x) {
     mpf_sqrt_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), SvUV(x));
}

void Rmpf_pow_ui(SV * r, SV * num, SV * pow) {
     mpf_pow_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(num)))), SvUV(pow));
}

void Rmpf_neg(SV * r, SV * x) {
     mpf_neg(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(x)))));
}

void Rmpf_abs(SV * r, SV * x) {
     mpf_abs(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(x)))));
}

void Rmpf_mul_2exp(SV * r, SV * x, SV * s) {
     mpf_mul_2exp(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(x)))), SvUV(s));
}

void Rmpf_div_2exp(SV * r, SV * x, SV * s) {
     mpf_div_2exp(*(INT2PTR(mpf_t *, SvIV(SvRV(r)))), *(INT2PTR(mpf_t *, SvIV(SvRV(x)))), SvUV(s));
}

SV * Rmpf_eq(SV * a, SV * b, SV * bits) {
     return newSViv(mpf_eq(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))), SvUV(bits)));
}

void Rmpf_reldiff(SV * d, SV * p, SV * q){
     mpf_reldiff(*(INT2PTR(mpf_t *, SvIV(SvRV(d)))), *(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));
}

SV * Rmpf_sgn(SV * p) {
     return newSViv(mpf_sgn(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_inp_str(SV * p, SV * base) {
     return newSVuv(mpf_inp_str(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), NULL, SvUV(base)));
}

void Rmpf_ceil(SV * p, SV * q) {
     mpf_ceil(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));
}

void Rmpf_floor(SV * p, SV * q) {
     mpf_floor(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));
}

void Rmpf_trunc(SV * p, SV * q) {
     mpf_trunc(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), *(INT2PTR(mpf_t *, SvIV(SvRV(q)))));
}

SV * Rmpf_integer_p(SV * p) {
     return newSViv(mpf_integer_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_ulong_p(SV * p) {
     return newSViv(mpf_fits_ulong_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_slong_p(SV * p) {
     return newSViv(mpf_fits_slong_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_uint_p(SV * p) {
     return newSViv(mpf_fits_uint_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_sint_p(SV * p) {
     return newSViv(mpf_fits_sint_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_ushort_p(SV * p) {
     return newSViv(mpf_fits_ushort_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

SV * Rmpf_fits_sshort_p(SV * p) {
     return newSViv(mpf_fits_sshort_p(*(INT2PTR(mpf_t *, SvIV(SvRV(p))))));
}

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

SV * overload_mul(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_mul function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

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
       mpf_set_d(*mpf_t_obj, SvNV(b));
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
       }

     croak("Invalid argument supplied to Math::GMPf::overload_mul");
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
       mpf_init_set_d(t, SvNV(b));
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

SV * overload_add(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_add function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

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
       mpf_set_d(*mpf_t_obj, SvNV(b));
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
       }

     croak("Invalid argument supplied to Math::GMPf::overload_add");
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
       mpf_init_set_d(t, SvNV(b));
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

SV * overload_sub(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sub function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

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
       mpf_set_d(*mpf_t_obj, SvNV(b));
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
       }

     croak("Invalid argument supplied to Math::GMPf::overload_sub function");

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
       mpf_init_set_d(t, SvNV(b));
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

SV * overload_div(SV * a, SV * b, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_div function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

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
       mpf_set_d(*mpf_t_obj, SvNV(b));
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
       }

     croak("Invalid argument supplied to Math::GMPf::overload_div function");

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
       mpf_init_set_d(t, SvNV(b));
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

SV * overload_copy(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_copy function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");

     mpf_init(*mpf_t_obj);
     mpf_set(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_abs(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_abs function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     mpf_abs(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_gt(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gt");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gt");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_gt");
}

SV * overload_gte(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gte");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_gte");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret >= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret >= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_gte");
}

SV * overload_lt(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;


#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lt");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lt");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_lt");
}

SV * overload_lte(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lte");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_lte");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret <= 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret <= 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_lte");
}

SV * overload_spaceship(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_spaceship");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_spaceship");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret < 0) return newSViv(-1);
       if(ret > 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret < 0) return newSViv(-1);
         if(ret > 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_spaceship");
}

SV * overload_equiv(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_equiv");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_equiv");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(ret == 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret == 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_equiv");
}

SV * overload_not_equiv(SV * a, SV * b, SV * third) {
     mpf_t t;
     int ret;

#ifdef USE_64_BIT_INT
     if(SvIOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_not_equiv");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#else
     if(SvUOK(b)) {
       ret = mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvUV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
     if(SvIOK(b)) {
       ret = mpf_cmp_si(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), SvIV(b));
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }
#endif

     if(SvNOK(b)) {
       mpf_init_set_d(t, SvNV(b));
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(SvPOK(b)) {
       if(mpf_init_set_str(t, SvPV_nolen(b), 10))
         croak("Invalid string supplied to Math::GMPf::overload_not_equiv");
       ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), t);
       mpf_clear(t);
       if(third == &PL_sv_yes) ret *= -1;
       if(ret != 0) return newSViv(1);
       return newSViv(0);
       }

     if(sv_isobject(b)) {
       if(strEQ(HvNAME(SvSTASH(SvRV(b))), "Math::GMPf")) {
         ret = mpf_cmp(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), *(INT2PTR(mpf_t *, SvIV(SvRV(b)))));
         if(ret != 0) return newSViv(1);
         return newSViv(0);
         }
       }

     croak("Invalid argument supplied to Math::GMPf::overload_not_equiv");
}

SV * overload_not(SV * a, SV * second, SV * third) {
     if(mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(a)))), 0)) return newSViv(0);
     return newSViv(1);
}

SV * overload_sqrt(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     if(mpf_cmp_ui(*(INT2PTR(mpf_t *, SvIV(SvRV(p)))), 0) < 0) croak("Negative value supplied as argument to overload_sqrt");
     mpf_sqrt(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
}

SV * overload_pow(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_sqrt function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);

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

     croak("Invalid argument supplied to Math::GMPf::overload_pow. The function handles only positive 'unsigned long' exponents.");
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

SV * overload_int(SV * p, SV * second, SV * third) {
     mpf_t * mpf_t_obj;
     SV * obj_ref, * obj;

     New(1, mpf_t_obj, 1, mpf_t);
     if(mpf_t_obj == NULL) croak("Failed to allocate memory in overload_int function");
     obj_ref = newSViv(0);
     obj = newSVrv(obj_ref, "Math::GMPf");
     mpf_init(*mpf_t_obj);

     mpf_trunc(*mpf_t_obj, *(INT2PTR(mpf_t *, SvIV(SvRV(p)))));
     sv_setiv(obj, INT2PTR(IV, mpf_t_obj));
     SvREADONLY_on(obj);
     return obj_ref;
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
       if(strEQ(HvNAME(SvSTASH(SvRV(a))), "Math::GMPf")) return newSVuv(5);
       }
     return newSVuv(0);
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
	SV *	a

SV *
Rmpf_init_set_ui (a)
	SV *	a

SV *
Rmpf_init_set_si (a)
	SV *	a

SV *
Rmpf_init_set_d (a)
	SV *	a

SV *
Rmpf_init_set_nobless (a)
	SV *	a

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
	SV *	p
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
	SV *	p
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
	SV *	p
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
	SV *	p
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
	SV *	p
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
	SV *	p

void
Rmpf_set_prec (p, prec)
	SV *	p
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
	SV *	p
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
	SV *	p1
	SV *	p2
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
	SV *	p
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
	SV *	p
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
	SV *	p
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
	SV *	p
	SV *	z
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
	SV *	p
	SV *	q
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
	SV *	p
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
	SV *	p1
	SV *	p2
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
Rmpf_out_str (p, base, digits)
	SV *	p
	SV *	base
	SV *	digits

SV *
Rmpf_cmp (p1, p2)
	SV *	p1
	SV *	p2

SV *
Rmpf_cmp_ui (p, ul)
	SV *	p
	SV *	ul

SV *
Rmpf_cmp_si (p, l)
	SV *	p
	SV *	l

SV *
Rmpf_cmp_d (p, d)
	SV *	p
	SV *	d

SV *
Rmpf_get_d (p)
	SV *	p

SV *
Rmpf_get_si (p)
	SV *	p

SV *
Rmpf_get_ui (p)
	SV *	p

void
Rmpf_get_d_2exp (n)
	SV *	n
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
	SV *	dest
	SV *	src1
	SV *	src2
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
	SV *	dest
	SV *	src
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
	SV *	dest
	SV *	src1
	SV *	src2
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
	SV *	dest
	SV *	src
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
	SV *	dest
	SV *	num
	SV *	src
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
	SV *	dest
	SV *	src1
	SV *	src2
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
	SV *	dest
	SV *	src
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
	SV *	d
	SV *	p
	SV *	q
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
	SV *	d
	SV *	p
	SV *	q
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
	SV *	d
	SV *	p
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
	SV *	r
	SV *	x
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
	SV *	r
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
	SV *	r
	SV *	num
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
	SV *	r
	SV *	x
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
	SV *	r
	SV *	x
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
	SV *	r
	SV *	x
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
	SV *	r
	SV *	x
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
	SV *	a
	SV *	b
	SV *	bits

void
Rmpf_reldiff (d, p, q)
	SV *	d
	SV *	p
	SV *	q
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
	SV *	p

SV *
Rmpf_inp_str (p, base)
	SV *	p
	SV *	base

void
Rmpf_ceil (p, q)
	SV *	p
	SV *	q
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
	SV *	p
	SV *	q
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
	SV *	p
	SV *	q
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
	SV *	p

SV *
Rmpf_fits_ulong_p (p)
	SV *	p

SV *
Rmpf_fits_slong_p (p)
	SV *	p

SV *
Rmpf_fits_uint_p (p)
	SV *	p

SV *
Rmpf_fits_sint_p (p)
	SV *	p

SV *
Rmpf_fits_ushort_p (p)
	SV *	p

SV *
Rmpf_fits_sshort_p (p)
	SV *	p

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
overload_mul (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_mul_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_add_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_sub_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_div_eq (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_copy (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_abs (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_gt (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_gte (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lt (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_lte (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_spaceship (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_equiv (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_not_equiv (a, b, third)
	SV *	a
	SV *	b
	SV *	third

SV *
overload_not (a, second, third)
	SV *	a
	SV *	second
	SV *	third

SV *
overload_sqrt (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_pow (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_pow_eq (p, second, third)
	SV *	p
	SV *	second
	SV *	third

SV *
overload_int (p, second, third)
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

