(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module vec.
  Module set_len_on_drop.
    (* StructRecord
      {
        name := "SetLenOnDrop";
        ty_params := [];
        fields :=
          [ ("len", Ty.apply (Ty.path "&mut") [ Ty.path "usize" ]); ("local_len", Ty.path "usize")
          ];
      } *)
    
    Module Impl_alloc_vec_set_len_on_drop_SetLenOnDrop.
      Definition Self : Ty.t := Ty.path "alloc::vec::set_len_on_drop::SetLenOnDrop".
      
      (*
          pub(super) fn new(len: &'a mut usize) -> Self {
              SetLenOnDrop { local_len: *len, len }
          }
      *)
      Definition new (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ len ] =>
          ltac:(M.monadic
            (let len := M.alloc (| len |) in
            Value.StructRecord
              "alloc::vec::set_len_on_drop::SetLenOnDrop"
              [ ("local_len", M.read (| M.read (| len |) |)); ("len", M.read (| len |)) ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub(super) fn increment_len(&mut self, increment: usize) {
              self.local_len += increment;
          }
      *)
      Definition increment_len (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; increment ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let increment := M.alloc (| increment |) in
            M.read (|
              let _ :=
                let β :=
                  M.get_struct_record_field
                    (M.read (| self |))
                    "alloc::vec::set_len_on_drop::SetLenOnDrop"
                    "local_len" in
                M.write (| β, BinOp.Panic.add (| M.read (| β |), M.read (| increment |) |) |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_increment_len :
        M.IsAssociatedFunction Self "increment_len" increment_len.
      
      (*
          pub(super) fn current_len(&self) -> usize {
              self.local_len
          }
      *)
      Definition current_len (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.get_struct_record_field
                (M.read (| self |))
                "alloc::vec::set_len_on_drop::SetLenOnDrop"
                "local_len"
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_current_len : M.IsAssociatedFunction Self "current_len" current_len.
    End Impl_alloc_vec_set_len_on_drop_SetLenOnDrop.
    
    Module Impl_core_ops_drop_Drop_for_alloc_vec_set_len_on_drop_SetLenOnDrop.
      Definition Self : Ty.t := Ty.path "alloc::vec::set_len_on_drop::SetLenOnDrop".
      
      (*
          fn drop(&mut self) {
              *self.len = self.local_len;
          }
      *)
      Definition drop (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              let _ :=
                M.write (|
                  M.read (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "alloc::vec::set_len_on_drop::SetLenOnDrop"
                      "len"
                  |),
                  M.read (|
                    M.get_struct_record_field
                      (M.read (| self |))
                      "alloc::vec::set_len_on_drop::SetLenOnDrop"
                      "local_len"
                  |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::ops::drop::Drop"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("drop", InstanceField.Method drop) ].
    End Impl_core_ops_drop_Drop_for_alloc_vec_set_len_on_drop_SetLenOnDrop.
  End set_len_on_drop.
End vec.