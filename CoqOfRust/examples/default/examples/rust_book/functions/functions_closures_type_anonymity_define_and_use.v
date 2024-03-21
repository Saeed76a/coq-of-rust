(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn apply<F>(f: F)
where
    F: Fn(),
{
    f();
}
*)
Definition apply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ F ], [ f ] =>
    let* f := M.alloc f in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::ops::function::Fn"
          F
          [ Ty.tuple [] ]
          "call"
          [] in
      let* α1 := M.call_closure α0 [ f; Value.Tuple [] ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;

    // Capture `x` into an anonymous type and implement
    // `Fn` for it. Store it in `print`.
    let print = || println!("{}", x);

    apply(print);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 7) in
    let* print :=
      M.alloc
        (M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* _ :=
                      let* α0 := M.get_function "std::io::stdio::_print" [] in
                      let* α1 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::Arguments")
                          "new_v1"
                          [] in
                      let* α2 := M.read (mk_str "") in
                      let* α3 := M.read (mk_str "
") in
                      let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                      let* α5 :=
                        M.get_associated_function
                          (Ty.path "core::fmt::rt::Argument")
                          "new_display"
                          [ Ty.path "i32" ] in
                      let* α6 := M.call_closure α5 [ x ] in
                      let* α7 := M.alloc (Value.Array [ α6 ]) in
                      let* α8 :=
                        M.call_closure
                          α1
                          [
                            M.pointer_coercion (* Unsize *) α4;
                            M.pointer_coercion (* Unsize *) α7
                          ] in
                      let* α9 := M.call_closure α0 [ α8 ] in
                      M.alloc α9 in
                    let* α0 := M.alloc (Value.Tuple []) in
                    M.read α0
                ]
            | _ => M.impossible
            end)) in
    let* _ :=
      let* α0 :=
        M.get_function
          "functions_closures_type_anonymity_define_and_use::apply"
          [ Ty.function [ Ty.tuple [] ] (Ty.tuple []) ] in
      let* α1 := M.read print in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.