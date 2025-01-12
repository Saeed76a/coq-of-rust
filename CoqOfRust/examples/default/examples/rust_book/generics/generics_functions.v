(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "A";
    const_params := [];
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "S";
    const_params := [];
    ty_params := [];
    fields := [ Ty.path "generics_functions::A" ];
  } *)

(* StructTuple
  {
    name := "SGen";
    const_params := [];
    ty_params := [ "T" ];
    fields := [ T ];
  } *)

(* fn reg_fn(_s: S) {} *)
Definition reg_fn (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _, _ => M.impossible
  end.

Axiom Function_reg_fn : M.IsFunction "generics_functions::reg_fn" reg_fn.

(* fn gen_spec_t(_s: SGen<A>) {} *)
Definition gen_spec_t (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _, _ => M.impossible
  end.

Axiom Function_gen_spec_t : M.IsFunction "generics_functions::gen_spec_t" gen_spec_t.

(* fn gen_spec_i32(_s: SGen<i32>) {} *)
Definition gen_spec_i32 (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _, _ => M.impossible
  end.

Axiom Function_gen_spec_i32 : M.IsFunction "generics_functions::gen_spec_i32" gen_spec_i32.

(* fn generic<T>(_s: SGen<T>) {} *)
Definition generic (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [ T ], [ _s ] =>
    ltac:(M.monadic
      (let _s := M.alloc (| _s |) in
      Value.Tuple []))
  | _, _, _ => M.impossible
  end.

Axiom Function_generic : M.IsFunction "generics_functions::generic" generic.

(*
fn main() {
    // Using the non-generic functions
    reg_fn(S(A)); // Concrete type.
    gen_spec_t(SGen(A)); // Implicitly specified type parameter `A`.
    gen_spec_i32(SGen(6)); // Implicitly specified type parameter `i32`.

    // Explicitly specified type parameter `char` to `generic()`.
    generic::<char>(SGen('a'));

    // Implicitly specified type parameter `char` to `generic()`.
    generic(SGen('c'));
}
*)
Definition main (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::reg_fn", [] |),
              [
                Value.StructTuple
                  "generics_functions::S"
                  [ Value.StructTuple "generics_functions::A" [] ]
              ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::gen_spec_t", [] |),
              [
                Value.StructTuple
                  "generics_functions::SGen"
                  [ Value.StructTuple "generics_functions::A" [] ]
              ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::gen_spec_i32", [] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.Integer 6 ] ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::generic", [ Ty.path "char" ] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.UnicodeChar 97 ] ]
            |)
          |) in
        let~ _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "generics_functions::generic", [ Ty.path "char" ] |),
              [ Value.StructTuple "generics_functions::SGen" [ Value.UnicodeChar 99 ] ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "generics_functions::main" main.
