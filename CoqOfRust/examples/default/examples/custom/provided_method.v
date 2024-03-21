(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
Module ProvidedAndRequired.
  Definition provided (Self : Ty.t) (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "provided_method::ProvidedAndRequired"
          Self
          []
          "required"
          [] in
      let* α1 := M.read self in
      let* α2 := M.call_closure α0 [ α1 ] in
      BinOp.Panic.add (Value.Integer Integer.I32 42) α2
    | _, _ => M.impossible
    end.
  
  Axiom ProvidedMethod_provided :
    M.IsProvidedMethod
      "provided_method::ProvidedAndRequired"
      "provided"
      provided.
End ProvidedAndRequired.

Module Impl_provided_method_ProvidedAndRequired_for_i32.
  Definition Self : Ty.t := Ty.path "i32".
  
  (*
      fn required(&self) -> i32 {
          *self
      }
  *)
  Definition required (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "provided_method::ProvidedAndRequired"
      (* Self *) (Ty.path "i32")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("required", InstanceField.Method required) ].
End Impl_provided_method_ProvidedAndRequired_for_i32.

Module Impl_provided_method_ProvidedAndRequired_for_u32.
  Definition Self : Ty.t := Ty.path "u32".
  
  (*
      fn required(&self) -> i32 {
          *self as i32
      }
  *)
  Definition required (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      let* α1 := M.read α0 in
      M.pure (M.rust_cast α1)
    | _, _ => M.impossible
    end.
  
  (*
      fn provided(&self) -> i32 {
          0
      }
  *)
  Definition provided (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.Integer Integer.I32 0)
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "provided_method::ProvidedAndRequired"
      (* Self *) (Ty.path "u32")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("required", InstanceField.Method required);
          ("provided", InstanceField.Method provided)
        ].
End Impl_provided_method_ProvidedAndRequired_for_u32.

(*
fn main() {
    let x = 5;
    assert_eq!(x.provided(), 47);
    let y = 5u32;
    assert_eq!(y.provided(), 0);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 5) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "provided_method::ProvidedAndRequired"
          (Ty.path "i32")
          []
          "provided"
          [] in
      let* α1 := M.call_closure α0 [ x ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc (Value.Integer Integer.I32 47) in
      let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.read left_val in
            let* α1 := M.read α0 in
            let* α2 := M.read right_val in
            let* α3 := M.read α2 in
            let* α4 := M.alloc (UnOp.Pure.not (BinOp.Pure.eq α1 α3)) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [ Ty.path "i32"; Ty.path "i32" ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call_closure
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* y := M.alloc (Value.Integer Integer.U32 5) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "provided_method::ProvidedAndRequired"
          (Ty.path "u32")
          []
          "provided"
          [] in
      let* α1 := M.call_closure α0 [ y ] in
      let* α2 := M.alloc α1 in
      let* α3 := M.alloc (Value.Integer Integer.I32 0) in
      let* α4 := M.alloc (Value.Tuple [ α2; α3 ]) in
      match_operator
        α4
        [
          fun γ =>
            let γ0_0 := M.get_tuple_field γ 0 in
            let γ0_1 := M.get_tuple_field γ 1 in
            let* left_val := M.copy γ0_0 in
            let* right_val := M.copy γ0_1 in
            let* α0 := M.read left_val in
            let* α1 := M.read α0 in
            let* α2 := M.read right_val in
            let* α3 := M.read α2 in
            let* α4 := M.alloc (UnOp.Pure.not (BinOp.Pure.eq α1 α3)) in
            let* α5 := M.read (M.use α4) in
            if Value.is_true α5 then
              let* kind :=
                M.alloc
                  (Value.StructTuple "core::panicking::AssertKind::Eq" []) in
              let* α0 :=
                M.get_function
                  "core::panicking::assert_failed"
                  [ Ty.path "i32"; Ty.path "i32" ] in
              let* α1 := M.read kind in
              let* α2 := M.read left_val in
              let* α3 := M.read right_val in
              let* α4 :=
                M.call_closure
                  α0
                  [
                    α1;
                    α2;
                    α3;
                    Value.StructTuple "core::option::Option::None" []
                  ] in
              let* α0 := M.alloc α4 in
              let* α1 := M.read α0 in
              let* α2 := M.never_to_any α1 in
              M.alloc α2
            else
              M.alloc (Value.Tuple [])
        ] in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.