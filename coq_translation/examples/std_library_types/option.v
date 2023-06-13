(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Definition checked_division (dividend : i32) (divisor : i32) : M (Option i32) :=
  let* α0 := divisor.["eq"] 0 in
  if (α0 : bool) then
    Pure None
  else
    let* α0 := dividend.["div"] divisor in
    Pure (Some α0).

Definition try_division (dividend : i32) (divisor : i32) : M unit :=
  let* α0 := checked_division dividend divisor in
  match α0 with
  | None =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of dividend) in
      let* α1 := format_argument::["new_display"] (addr_of divisor) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " / "; " failed!
" ])
          (addr_of [ α0; α1 ]) in
      _crate.io._print α2 in
    Pure tt
  | Some quotient =>
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of dividend) in
      let* α1 := format_argument::["new_display"] (addr_of divisor) in
      let* α2 := format_argument::["new_display"] (addr_of quotient) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " / "; " = "; "
" ])
          (addr_of [ α0; α1; α2 ]) in
      _crate.io._print α3 in
    Pure tt
  end.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let* _ := try_division 4 2 in
  let* _ := try_division 1 0 in
  let none := None in
  let _equivalent_none := None in
  let optional_float := Some 0 (* 0 *) in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of optional_float) in
      let* α1 := optional_float.["unwrap"] in
      let* α2 := format_argument::["new_debug"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " unwraps to "; "
" ])
          (addr_of [ α0; α2 ]) in
      _crate.io._print α3 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_debug"] (addr_of none) in
      let* α1 := none.["unwrap"] in
      let* α2 := format_argument::["new_debug"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; " unwraps to "; "
" ])
          (addr_of [ α0; α2 ]) in
      _crate.io._print α3 in
    Pure tt in
  Pure tt.