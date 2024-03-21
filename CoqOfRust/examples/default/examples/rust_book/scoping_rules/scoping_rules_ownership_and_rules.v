(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn destroy_box(c: Box<i32>) {
    println!("Destroying a box that contains {}", c);

    // `c` is destroyed and the memory freed
}
*)
Definition destroy_box (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ c ] =>
    let* c := M.alloc c in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Destroying a box that contains ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
            ] in
        let* α6 := M.call_closure α5 [ c ] in
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
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    // _Stack_ allocated integer
    let x = 5u32;

    // *Copy* `x` into `y` - no resources are moved
    let y = x;

    // Both values can be independently used
    println!("x is {}, and y is {}", x, y);

    // `a` is a pointer to a _heap_ allocated integer
    let a = Box::new(5i32);

    println!("a contains: {}", a);

    // *Move* `a` into `b`
    let b = a;
    // The pointer address of `a` is copied (not the data) into `b`.
    // Both are now pointers to the same heap allocated data, but
    // `b` now owns it.

    // Error! `a` can no longer access the data, because it no longer owns the
    // heap memory
    //println!("a contains: {}", a);
    // TODO ^ Try uncommenting this line

    // This function takes ownership of the heap allocated memory from `b`
    destroy_box(b);

    // Since the heap memory has been freed at this point, this action would
    // result in dereferencing freed memory, but it's forbidden by the compiler
    // Error! Same reason as the previous Error
    //println!("b contains: {}", b);
    // TODO ^ Try uncommenting this line
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.U32 5) in
    let* y := M.copy x in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "x is ") in
        let* α3 := M.read (mk_str ", and y is ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u32" ] in
        let* α7 := M.call_closure α6 [ x ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.path "u32" ] in
        let* α9 := M.call_closure α8 [ y ] in
        let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* a :=
      let* α0 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ])
          "new"
          [] in
      let* α1 := M.call_closure α0 [ Value.Integer Integer.I32 5 ] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "a contains: ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ]
            ] in
        let* α6 := M.call_closure α5 [ a ] in
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
      M.alloc (Value.Tuple []) in
    let* b := M.copy a in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_ownership_and_rules::destroy_box" [] in
      let* α1 := M.read b in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.