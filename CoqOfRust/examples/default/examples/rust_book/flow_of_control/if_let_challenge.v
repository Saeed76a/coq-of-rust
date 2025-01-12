(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Foo
{
  const_params := [];
  ty_params := [];
  variants :=
    [
      {
        name := "Bar";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
Definition main (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
  match ε, τ, α with
  | [], [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ a := M.alloc (| Value.StructTuple "if_let_challenge::Foo::Bar" [] |) in
        M.match_operator (|
          M.alloc (| Value.Tuple [] |),
          [
            fun γ =>
              ltac:(M.monadic
                (let γ := a in
                let _ := M.is_struct_tuple (| γ, "if_let_challenge::Foo::Bar" |) in
                let~ _ :=
                  let~ _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.path "core::fmt::Arguments",
                              "new_const",
                              []
                            |),
                            [ M.alloc (| Value.Array [ M.read (| Value.String "a is foobar
" |) ] |)
                            ]
                          |)
                        ]
                      |)
                    |) in
                  M.alloc (| Value.Tuple [] |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "if_let_challenge::main" main.
