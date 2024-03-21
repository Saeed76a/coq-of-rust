(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    test!(1i32 + 1 == 2i32; and 2i32 * 2 == 4i32);
    test!(true; or false);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " and ") in
        let* α4 := M.read (mk_str " is ") in
        let* α5 := M.read (mk_str "
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α8 := M.call_closure α7 [ mk_str "1i32 + 1 == 2i32" ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α10 := M.call_closure α9 [ mk_str "2i32 * 2 == 4i32" ] in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "bool" ] in
        let* α12 :=
          BinOp.Panic.add
            (Value.Integer Integer.I32 1)
            (Value.Integer Integer.I32 1) in
        let* α13 :=
          LogicalOp.and
            (BinOp.Pure.eq α12 (Value.Integer Integer.I32 2))
            (let* α12 :=
              BinOp.Panic.mul
                (Value.Integer Integer.I32 2)
                (Value.Integer Integer.I32 2) in
            M.pure (BinOp.Pure.eq α12 (Value.Integer Integer.I32 4))) in
        let* α14 := M.alloc α13 in
        let* α15 := M.call_closure α11 [ α14 ] in
        let* α16 := M.alloc (Value.Array [ α8; α10; α15 ]) in
        let* α17 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α16
            ] in
        let* α18 := M.call_closure α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " or ") in
        let* α4 := M.read (mk_str " is ") in
        let* α5 := M.read (mk_str "
") in
        let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
        let* α7 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α8 := M.call_closure α7 [ mk_str "true" ] in
        let* α9 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α10 := M.call_closure α9 [ mk_str "false" ] in
        let* α11 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "bool" ] in
        let* α12 :=
          LogicalOp.or (Value.Bool true) (M.pure (Value.Bool false)) in
        let* α13 := M.alloc α12 in
        let* α14 := M.call_closure α11 [ α13 ] in
        let* α15 := M.alloc (Value.Array [ α8; α10; α14 ]) in
        let* α16 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α6;
              M.pointer_coercion (* Unsize *) α15
            ] in
        let* α17 := M.call_closure α0 [ α16 ] in
        M.alloc α17 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.